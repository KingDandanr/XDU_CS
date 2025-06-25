from pyspark import SparkConf, SparkContext
import sys

# Usage: spark-submit grade_stats.py <input_path> <output_path>
conf = SparkConf().setAppName("RequiredCourseStats")
sc = SparkContext(conf=conf)

# Paths from command-line
if len(sys.argv) != 3:
    print("Usage: spark-submit grade_stats.py <input_path> <output_path>")
    sys.exit(1)
input_path = sys.argv[1]
output_path = sys.argv[2]

# Read input file
lines = sc.textFile(input_path)

# Parse each line: 班级, 姓名, 科目, 必修/选修, 成绩
def parse_line(line):
    parts = [p.strip() for p in line.split(',')]
    if len(parts) != 5:
        return None
    clazz, name, subject, ctype, score_str = parts
    try:
        score = float(score_str)
    except ValueError:
        return None
    return clazz, name, ctype, score

parsed = lines.map(parse_line).filter(lambda x: x is not None)

# Filter required courses only
required = parsed.filter(lambda x: x[2] == '必修')

# Map to ((class, student), score)
stu_scores = required.map(lambda x: ((x[0], x[1]), x[3]))

# Compute average score per student
avg_scores = stu_scores.groupByKey() \
    .mapValues(lambda scores: sum(scores) / len(scores))

# Assign score into buckets
def score_bucket(avg):
    if avg >= 90:
        return '90-100'
    elif avg >= 80:
        return '80-89'
    elif avg >= 70:
        return '70-79'
    elif avg >= 60:
        return '60-69'
    else:
        return '60以下'

# Map to ((class, bucket), 1) and count students
class_bucket = avg_scores.map(
    lambda x: ((x[0][0], score_bucket(x[1])), 1)
)

counts = class_bucket.reduceByKey(lambda a, b: a + b)

# Format result as CSV: class,bucket,count
output = counts.map(lambda x: f"{x[0][0]},{x[0][1]},{x[1]}")

# Save to output
output.saveAsTextFile(output_path)

sc.stop()

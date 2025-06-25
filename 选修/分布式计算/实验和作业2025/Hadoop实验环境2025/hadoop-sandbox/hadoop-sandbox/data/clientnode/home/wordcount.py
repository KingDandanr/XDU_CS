from pyspark import SparkConf,SparkContext

conf = SparkConf().setMaster("local").setAppName("wordcount")
sc = SparkContext(conf=conf)

textData = sc.textFile("input_file.txt")
splitData = textData.flatMap(lambda line:line.split(" "))
flagData = splitData.map(lambda word:(word,1))
countData = flagData.reduceByKey(lambda x,y:x+y)
countData.saveAsTextFile("result")

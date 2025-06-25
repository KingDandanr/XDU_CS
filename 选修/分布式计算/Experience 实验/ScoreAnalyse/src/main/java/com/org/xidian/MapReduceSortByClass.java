//题目 2
//输入文件为学生成绩信息，包含了必修课与选修课成绩，格式如下：
//班级 1, 姓名 1, 科目 1, 必修, 成绩 1 <br> （注：<br> 为换行符）
//班级 2, 姓名 2, 科目 1, 必修, 成绩 2 <br>
//班级 1, 姓名 1, 科目 2, 选修，成绩 3 <br>
//………., ………, ………, ……… <br>
//编写 Hadoop 平台上的 MapReduce 程序，分别实现如下功能：
//1. 计算每个学生必修课的平均成绩。
//2. 统计每个班级中所有课程（必修+选修）平均成绩排名前五的学生姓名和成绩。
package com.org.xidian;

import org.apache.hadoop.conf.Configuration;
import org.apache.hadoop.fs.Path;
import org.apache.hadoop.io.DoubleWritable;
import org.apache.hadoop.io.LongWritable;
import org.apache.hadoop.io.Text;
import org.apache.hadoop.mapreduce.Job;
import org.apache.hadoop.mapreduce.Mapper;
import org.apache.hadoop.mapreduce.Reducer;
import org.apache.hadoop.mapreduce.lib.input.FileInputFormat;
import org.apache.hadoop.mapreduce.lib.output.FileOutputFormat;

import java.io.IOException;
import java.util.*;

public class MapReduceSortByClass {
    //自定义的mapper，继承org.apache.hadoop.mapreduce.Mapper
    public static class MyMapper1 extends Mapper<LongWritable, Text, Text, LongWritable> {
        @Override
        protected void map(LongWritable key, Text value, Mapper<LongWritable, Text, Text, LongWritable>.Context context)
                throws IOException, InterruptedException {
            String line = value.toString();
            // input format :"班级 1, 姓名 1, 科目 1, 必修, 成绩 1 <br>"
            // split by ','
            String[] splitWords = line.split(",");

            // no filter because sorting according to scores of all lessons
            // String lessonType = splitWords[3];
            // if(!lessonType.equals("必修")) return;

            // parse data from splitWords
            String className = splitWords[0];
            String studentName = splitWords[1];
            long score = Long.parseLong(splitWords[4]);

            // output format :<"studentName",score>
            context.write(new Text(className + ',' + studentName), new LongWritable(score));
        }
    }

    public static class MyReducer1 extends Reducer<Text, LongWritable, Text, DoubleWritable> {
        @Override
        protected void reduce(Text k2, Iterable<LongWritable> v2s,
                              Reducer<Text, LongWritable, Text, DoubleWritable>.Context context)
                throws IOException, InterruptedException {

            long count = 0;
            long sum = 0;
            for (LongWritable v2 : v2s) {
                count++;
                sum += v2.get();
            }
            DoubleWritable v3 = new DoubleWritable((double) sum / count);
            context.write(k2, v3);
        }

        // after the tasks finish, print the result
        @Override
        protected void cleanup(Context context) {
            System.out.println("Job 1 Done");
        }

    }

    public static class MyMapper2 extends Mapper<LongWritable, Text, Text, Text> {
        @Override
        protected void map(LongWritable key, Text value, Mapper<LongWritable, Text, Text, Text>.Context context)
                throws IOException, InterruptedException {
            String line = value.toString();
            // input format :"班级 1, 姓名 1, 平均成绩 1 <br>"
            // split by ','
            String[] splitWords = line.split(",");

            // parse data from splitWords
            String className = splitWords[0];
            String studentName = splitWords[1];
            String score = splitWords[2];

            // output format :<"className", "student,score">
            context.write(new Text(className), new Text(studentName + ',' + score));
        }
    }

    public static class MyReducer2 extends Reducer<Text, Text, Text, DoubleWritable> {
        @Override
        protected void reduce(Text k2, Iterable<Text> v2s,
                              Reducer<Text, Text, Text, DoubleWritable>.Context context)
                throws IOException, InterruptedException {

            // create a heap to store the top 5
            TopTracker top5Tracker = new TopTracker(5);

            for (Text v2 : v2s) {
                // extract name and score from text
                String[] splitWords = v2.toString().split(",");
                String studentName = splitWords[0];
                double score = Double.parseDouble(splitWords[1]);
                // add it into the heap to replace the last rank of top 5
                top5Tracker.add(studentName, score);
            }

            // loop to output top 5
            for (Map.Entry<String, Double> entry : top5Tracker.topK()) {
                DoubleWritable v3 = new DoubleWritable(entry.getValue());
                context.write(new Text(entry.getKey()), v3);
            }
        }

        // after the tasks finish, print the result
        @Override
        protected void cleanup(Context context) {
            System.out.println("Job 2 Done");
        }

        /*
        A private class using for track top k
         */
        private static class TopTracker {
            private final PriorityQueue<Map.Entry<String, Double>> minHeap;
            private final int capacity;

            public TopTracker(int k) {
                this.capacity = k;
                // 创建一个基于值的最小堆
                this.minHeap = new PriorityQueue<>(
                        k, Comparator.comparing(Map.Entry::getValue)
                );
            }

            /**
             * 尝试添加新键值对（name, score）
             */
            public void add(String name, double score) {
                Map.Entry<String, Double> entry = Map.entry(name, score);

                if (minHeap.size() < capacity) {
                    minHeap.offer(entry);
                } else {
                    assert minHeap.peek() != null;
                    if (score > minHeap.peek().getValue()) {
                        minHeap.poll();
                        minHeap.offer(entry);
                    }
                }
            }

            /**
             * 返回 Top-K，按分数降序排列
             */
            public List<Map.Entry<String, Double>> topK() {
                List<Map.Entry<String, Double>> result = new ArrayList<>(minHeap);
                result.sort(Comparator.comparing(Map.Entry::getValue));
                Collections.reverse(result);
                return result;
            }
        }
    }


    //客户端代码，写完交给ResourceManager框架去执行
    public static void main(String[] args) throws Exception {
        Configuration conf = new Configuration();
        // set default split between key and value to ','
        conf.set("mapreduce.output.textoutputformat.separator", ",");

        // Job1
        Job job1 = Job.getInstance(conf, "Phase1");
        job1.setJarByClass(MapReduceSortByClass.class);
        FileInputFormat.setInputPaths(job1, args[0]);
        job1.setMapperClass(MyMapper1.class);
        job1.setMapOutputKeyClass(Text.class);
        job1.setMapOutputValueClass(LongWritable.class);
        job1.setReducerClass(MyReducer1.class);
        job1.setOutputKeyClass(Text.class);
        job1.setOutputValueClass(DoubleWritable.class);
        FileOutputFormat.setOutputPath(job1, new Path(args[1]));

        // if job1 not finish, wait
        boolean isSuccess = job1.waitForCompletion(true);
        if (!isSuccess) {
            System.err.println("Job1 failed, exiting");
            System.exit(1);
        }
        // Job2
        Job job2 = Job.getInstance(conf, "Phase2");
        job2.setJarByClass(MapReduceSortByClass.class);
        FileInputFormat.setInputPaths(job2, args[1]);
        job2.setMapperClass(MyMapper2.class);
        job2.setMapOutputKeyClass(Text.class);
        job2.setMapOutputValueClass(Text.class);
        job2.setReducerClass(MyReducer2.class);
        job2.setOutputKeyClass(Text.class);
        job2.setOutputValueClass(DoubleWritable.class);
        FileOutputFormat.setOutputPath(job2, new Path(args[2]));

        boolean isSuccess2 = job2.waitForCompletion(true);
        if (!isSuccess2) {
            System.err.println("Job2 failed, exiting");
            System.exit(1);
        }

    }
}
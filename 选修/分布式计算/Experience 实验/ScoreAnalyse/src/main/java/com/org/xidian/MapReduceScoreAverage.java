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

public class MapReduceScoreAverage {
    //自定义的mapper，继承org.apache.hadoop.mapreduce.Mapper
    public static class MyMapper extends org.apache.hadoop.mapreduce.Mapper<LongWritable, Text, Text, LongWritable> {
        @Override
        protected void map(LongWritable key, Text value, Mapper<LongWritable, Text, Text, LongWritable>.Context context)
                throws IOException, InterruptedException {
            String line = value.toString();
            // split函数是用于按指定字符（串）或正则去分割某个字符串，结果以字符串数组形式返回，这里按照"\t"来分割text文件中字
            // 符，即一个制表符，这就是为什么我在文本中用了空格分割，导致最后的结果有很大的出入。
            // input format :"班级 1, 姓名 1, 科目 1, 必修, 成绩 1 <br>"
            String[] splitWords = line.split(",");

            // filter
            String lessonType = splitWords[3];
            if(!lessonType.equals("必修")) return;

            // parse data from splitWords
            String studentName = splitWords[1];
            long score = Long.parseLong(splitWords[4]);

            // output format :<"studentName",score>
            context.write(new Text(studentName), new LongWritable(score));
        }
    }

    public static class MyReducer extends org.apache.hadoop.mapreduce.Reducer<Text, LongWritable, Text, DoubleWritable> {
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
            DoubleWritable v3 = new DoubleWritable((double) sum /count);
            context.write(k2, v3);
        }
        // after the tasks finish, print the result
        @Override
        protected void cleanup(Context context) {
            // 这里做一些全局统计，比如打印到日志
            System.out.println("Done");
        }

    }

    //客户端代码，写完交给ResourceManager框架去执行
    public static void main(String[] args) throws Exception {
        Configuration conf = new Configuration();
        Job job = Job.getInstance(conf, MapReduceScoreAverage.class.getSimpleName());
        //打成jar执行
        job.setJarByClass(MapReduceScoreAverage.class);

        //数据在哪里？
        FileInputFormat.setInputPaths(job, args[0]);
        //使用哪个mapper处理输入的数据？
        job.setMapperClass(MyMapper.class);
        //map输出的数据类型是什么？
        job.setMapOutputKeyClass(Text.class);
        job.setMapOutputValueClass(LongWritable.class);

        //使用哪个reducer处理输入的数据？
        job.setReducerClass(MyReducer.class);
        //reduce输出的数据类型是什么？
        job.setOutputKeyClass(Text.class);
        job.setOutputValueClass(DoubleWritable.class);
        //数据输出到哪里？
        FileOutputFormat.setOutputPath(job, new Path(args[1]));

        //交给yarn去执行，直到执行结束才退出本程序
        job.waitForCompletion(true);
    }
}
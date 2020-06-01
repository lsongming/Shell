#!/bin/bash

this_pid=$$

while true  #死循环，做成守护进程
do
ps -ef | grep nginx | grep -v grep | grep -v $this_pid &> /dev/null #将输出放在垃圾桶

if [ $? -eq 0 ]; then
    echo "Nginx is running well"
    sleep 3
else
    systemc start nginx
    echo "Nginx is down, Start it...."
fi
done

#运行后使用 nohup sh function.sh & 命令不让其在前台输出
#tail -f nohup.out 查看日志

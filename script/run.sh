#!/bin/bash
. /etc/profile

min_heap_size="1300m"
max_heap_size="2300m"

#!/bin/sh

#加载环境变量
source /etc/profile
W_EXIT_STATUS=65
number_of_expected_args=1

# Define some constants
PROJECT_PATH=$PWD
JAR_PATH=$PROJECT_PATH/lib/


classpath=.:$PROJECT_PATH/config:$JAR_PATH*

LOG_PATH=$PROJECT_PATH/log

mkdir $LOG_PATH

start()
{
  nohup java -Xms$min_heap_size -Xmx$max_heap_size -XX:PermSize=128m -Xloggc:$LOG_PATH/gc.log -XX:+PrintGCTimeStamps -XX:-PrintGCDetails -cp $classpath org.nlpchina.web.BootStrap > $LOG_PATH/console.log &
  echo $! >$LOG_PATH/nlpcn-web.pid
}
stop()
{
  kill  `cat $PROJECT_PATH/log/nlpcn-web.pid`
}


case $1 in
"restart")
   stop
   start
;;
"start")
   start
;;
"stop")
   stop
;;
*) echo "only accept params start|stop|restart" ;;
esac

            
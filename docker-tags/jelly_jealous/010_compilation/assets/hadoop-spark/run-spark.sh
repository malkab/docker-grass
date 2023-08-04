#start-spark.sh
#!/bin/bash

# Run master
if [ "$1" == "master" ];
then

    spark-class org.apache.spark.deploy.master.Master --host $SPARK_MASTER_HOST --port $SPARK_MASTER_PORT --webui-port $SPARK_MASTER_WEBUI_PORT

elif [ "$1" == "worker" ];
then

    spark-class org.apache.spark.deploy.worker.Worker --webui-port $SPARK_WORKER_WEBUI_PORT $SPARK_MASTER

fi

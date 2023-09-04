#!/bin/bash

# -----------------------------------------------------------------
#
# Set up.
#
# -----------------------------------------------------------------
# Rename and change ownership of the Spark and Hadoop directories
mv /spark-3.4.1-bin-hadoop3 /spark
chown -R user1000:user1000 /spark
mv /hadoop-3.3.6 /hadoop
chown -R user1000:user1000 /hadoop

# run-spark script
chown user1000:user1000 /usr/local/bin/run-spark.sh
chmod 755 /usr/local/bin/run-spark.sh

# Clean unnecessary hadoop files
cd /hadoop
rm -Rf bin/ \
    etc/ \
    include/ \
    libexec/ \
    licenses-binary/ \
    LICENSE-binary \
    *.txt \
    NOTICE-binary \
    sbin/ \
    share/

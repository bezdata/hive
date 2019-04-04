--set snappy compress property
SET hive.exec.compress.output=true;
SET mapred.output.compression.codec=org.apache.hadoop.io.compress.SnappyCodec;
SET mapred.output.compression.type=BLOCK;

--create db
CREATE DATABASE svpBigData4;
CREATE TABLE svpbigdata4.messages (`timestamp` TIMESTAMP, status STRING, message STRING) 
PARTITIONED BY (dt STRING, event_type STRING)
STORED AS PARQUET;

--insert values
'/user/hive/warehouse/svpbigdata4.db/messages/dt=2019-03-30'
INSERT into TABLe svpbigdata4.messages 
PARTITION (dt='2019-03-30', event_type='error') 
select current_timestamp(), 'status1', 'message1';


--drop db
--DROP table svpbigdata4.messages;
--DROP database svpbigdata4;

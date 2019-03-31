CREATE DATABASE svpBigData4;

CREATE TABLE svpbigdata4.messages (`timestamp` TIMESTAMP, status STRING, message STRING) 
PARTITIONED BY (dt STRING, event_type STRING);

INSERT into TABLe svpbigdata4.messages 
PARTITION (dt='2019-03-30', event_type='error') 
select current_timestamp(), 'status1', 'message1';

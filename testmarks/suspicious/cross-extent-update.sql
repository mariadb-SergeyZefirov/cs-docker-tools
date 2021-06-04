-- possible update regression

use test;
drop table if exists t;
create table t(idx integer, val integer) engine = columnstore;
insert into t(idx, val) select seq, seq from seq_1_to_10000000; -- definitely cross-extent. uses cpimport.
select * from information_schema.columnstore_extents; -- for your viewing pleasure.
update t set idx = - idx where idx = 1000000 or idx = 9000000; -- definitely in different extents.
select * from t where idx < 0;

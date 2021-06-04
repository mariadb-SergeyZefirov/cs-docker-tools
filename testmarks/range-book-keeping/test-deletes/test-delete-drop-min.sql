-- tests updates that range when we updating min value to value that is bigger than min.
use test;
drop table if exists t;
create table t(x integer) engine=columnstore;
insert into t(x) values (44),(55),(66); -- range must be 44..66.
select max_value, min_value from information_schema.columnstore_extents;
delete from t where x=66; -- range must be invalid now.
select max_value, min_value from information_schema.columnstore_extents;

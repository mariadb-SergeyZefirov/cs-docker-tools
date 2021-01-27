-- tests updates that extend range to new min value.
use test;
drop table if exists t;
create table t(x integer) engine=columnstore;
insert into t(x) values (44),(55),(66); -- range must be 44..66.
update t set x=33 where x=44; -- range must be 33..66.

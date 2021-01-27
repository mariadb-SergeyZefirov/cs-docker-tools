-- tests updates that extend max range, for values at max.
use test;
drop table if exists t;
create table t(x integer) engine=columnstore;
insert into t(x) values (44),(55),(66); -- range must be 44..66.
update t set x=77 where x=66; -- range must be 44..77

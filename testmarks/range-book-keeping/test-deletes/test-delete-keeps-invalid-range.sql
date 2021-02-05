-- tests updates within range.
use test;
drop table if exists t;
create table t(x integer) engine=columnstore;
insert into t(x) values (44),(50),(55),(66); -- range must be 44..66.
delete from t where x=66; -- range must drop to invalid
delete from t where x=50; -- range must stay invalid.

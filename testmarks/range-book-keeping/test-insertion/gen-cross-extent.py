#!/usr/bin/env python3

print ("use test;")
print ("drop table if exists t;")
print ("create table t (x integer) engine = columnstore;")
beginning8K = "insert into t(x) values " + ("(1)," * 8191) + "(1);"
endAlmost8K = "insert into t(x) values " + ("(1)," * 8190) + "(1);"
threeToCrossExtent = "insert into t(x) values (42), (43), (44);"
for _ in range(0,1023):
    print(beginning8K)
print(endAlmost8K)
print(threeToCrossExtent)


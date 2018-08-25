-- using 1915591743 as a seed to the RNG

set search_path=tpch;
set vitesse.enable=0;
set statement_timeout=1800000;
set statement_mem='2000000kB';
drop table if exists out0;
drop table if exists out1;
drop table if exists out2;
drop table if exists out3;
drop table if exists out4;
drop table if exists out5;
drop table if exists out6;
drop table if exists out7;
drop table if exists out8;
drop table if exists out9;
drop table if exists out10;
drop table if exists out11;
drop table if exists out12;
drop table if exists out13;
drop table if exists out14;
drop table if exists out15;
drop table if exists out16;
drop table if exists out17;
drop table if exists out18;
drop table if exists out19;
drop table if exists out20;
drop table if exists out21;
drop table if exists out22;

\timing on

\echo query 0
create temp table out0 as select * from q0;
\echo query 1
create temp table out1 as select * from q1;
\echo query 2
create temp table out2 as select * from q2;
\echo query 3
create temp table out3 as select * from q3;
\echo query 4
create temp table out4 as select * from q4;
\echo query 5
create temp table out5 as select * from q5;
\echo query 6
create temp table out6 as select * from q6;
\echo query 7
create temp table out7 as select * from q7;
\echo query 8
create temp table out8 as select * from q8;
\echo query 9
create temp table out9 as select * from q9;
\echo query 10
create temp table out10 as select * from q10;
\echo query 11
create temp table out11 as select * from q11;
\echo query 12
create temp table out12 as select * from q12;
\echo query 13
create temp table out13 as select * from q13;
\echo query 14
create temp table out14 as select * from q14;
\echo query 15
create temp table out15 as select * from q15;
\echo query 16
create temp table out16 as select * from q16;
\echo query 17
create temp table out17 as select * from q17;
\echo query 18
create temp table out18 as select * from q18;
\echo query 19
create temp table out19 as select * from q19;
\echo query 20
create temp table out20 as select * from q20;
\echo query 21
create temp table out21 as select * from q21;
\echo query 22
create temp table out22 as select * from q22;


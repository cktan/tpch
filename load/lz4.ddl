drop schema if exists tpchlz4 cascade;
create schema tpchlz4;
set search_path=tpchlz4;

CREATE TABLE NATION  ( like tpch.nation )
WITH (APPENDONLY=true, orientation=column, COMPRESSTYPE=lz4);

CREATE TABLE REGION  ( like tpch.region )
WITH (APPENDONLY=true, orientation=column, COMPRESSTYPE=lz4);

CREATE TABLE PART  ( like tpch.part )
WITH (APPENDONLY=true, orientation=column, COMPRESSTYPE=lz4);

CREATE TABLE SUPPLIER ( like tpch.supplier )
WITH (APPENDONLY=true, orientation=column, COMPRESSTYPE=lz4);

CREATE TABLE PARTSUPP ( like tpch.partsupp )
WITH (APPENDONLY=true, orientation=column, COMPRESSTYPE=lz4);

CREATE TABLE CUSTOMER ( like tpch.customer )
WITH (APPENDONLY=true, orientation=column, COMPRESSTYPE=lz4);

CREATE TABLE ORDERS ( like tpch.orders )
WITH (APPENDONLY=true, orientation=column, COMPRESSTYPE=lz4);

CREATE TABLE LINEITEM ( like tpch.lineitem )
WITH (APPENDONLY=true, orientation=column, COMPRESSTYPE=lz4);


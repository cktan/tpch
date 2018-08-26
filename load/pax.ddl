drop schema if exists tpchpax cascade;
create schema tpchpax;
set search_path=tpchpax;

CREATE TABLE NATION  ( like tpch.nation )
WITH (APPENDONLY=true, COMPRESSTYPE=PAX);

CREATE TABLE REGION  ( like tpch.region )
WITH (APPENDONLY=true, COMPRESSTYPE=PAX);

CREATE TABLE PART  ( like tpch.part )
WITH (APPENDONLY=true, COMPRESSTYPE=PAX);

CREATE TABLE SUPPLIER ( like tpch.supplier )
WITH (APPENDONLY=true, COMPRESSTYPE=PAX);

CREATE TABLE PARTSUPP ( like tpch.partsupp )
WITH (APPENDONLY=true, COMPRESSTYPE=PAX);

CREATE TABLE CUSTOMER ( like tpch.customer )
WITH (APPENDONLY=true, COMPRESSTYPE=PAX);

CREATE TABLE ORDERS ( like tpch.orders )
WITH (APPENDONLY=true, COMPRESSTYPE=PAX);

CREATE TABLE LINEITEM ( like tpch.lineitem )
WITH (APPENDONLY=true, COMPRESSTYPE=PAX);


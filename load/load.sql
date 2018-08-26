
truncate customer;
insert into customer select * from tpch.customer;

truncate lineitem;
insert into lineitem select * from tpch.lineitem;

truncate nation;
insert into nation select * from tpch.nation;

truncate orders;
insert into orders select * from tpch.orders;

truncate part;
insert into part select * from tpch.part;

truncate partsupp;
insert into partsupp select * from tpch.partsupp;

truncate region;
insert into region select * from tpch.region;

truncate supplier;
insert into supplier select * from tpch.supplier;

vacuum analyze;

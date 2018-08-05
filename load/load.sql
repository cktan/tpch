set search_path=tpch;

truncate customer;
insert into customer select * from xcustomer ;

truncate lineitem;
insert into lineitem select * from xlineitem ;

truncate nation;
insert into nation select * from xnation ;

truncate orders;
insert into orders select * from xorders ;

truncate part;
insert into part select * from xpart ;

truncate partsupp;
insert into partsupp select * from partsupp ;

truncate region;
insert into region select * from xregion ;

truncate supplier;
insert into supplier select * from xsupplier ;

vacuum analyze;

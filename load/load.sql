set search_path=tpch;

truncate customer;
insert into customer select * from xcustomer with csv delimiter '|';

truncate lineitem;
insert into lineitem select * from xlineitem with csv delimiter '|';

truncate nation;
insert into nation select * from xnation with csv delimiter '|';

truncate orders;
insert into orders select * from xorders with csv delimiter '|';

truncate part;
insert into part select * from xpart with csv delimiter '|';

truncate partsupp;
insert into partsupp select * from partsupp with csv delimiter '|';

truncate region;
insert into region select * from xregion with csv delimiter '|';

truncate supplier;
insert into supplier select * from xsupplier with csv delimiter '|';

vacuum analyze;

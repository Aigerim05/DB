-- #1
create database lab8;

-- #2
create table salesman (salesman_id integer primary key, name varchar(200), city varchar (200), commission decimal(10, 2));

insert into salesman values(5001, 'James Hoog', 'New York', 0.15),
                           (5002, 'Naul Knite', 'Paris', 0.13),
                           (5005, 'Pit Alex', 'London', 0.11),
                           (5006, 'Mc Lyon', 'Paris', 0.14),
                           (5003, 'Lauson Hen', null, 0.12),
                           (5007, 'Paul Adam', 'Rome', 0.13);


create table customers (customer_id integer primary key , cust_name varchar(200),
                        city varchar(200), grade integer, salesman_id integer, foreign key (salesman_id) references salesman(salesman_id));

insert into customers values(3002, 'Nick Rimando', 'New York', 100, 5001),
                            (3005, 'Graham Zusi', 'California', 200, 5002),
                            (3001, 'Brad Guzan', 'London', null, 5005),
                            (3004, 'Fabian Johns', 'Paris', 300, 5006),
                            (3007, 'Brad Davis', 'New York', 200, 5001),
                            (3009, 'Geoff Camero', 'Berlin', 100, 5003),
                            (3008, 'Julian Green', 'London', 300, 5002);

create table orders (ord_no integer primary key, purch_amt decimal(10,2), ord_date date, customer_id integer, salesman_id integer,
                     foreign key (customer_id) references customers(customer_id),  foreign key (salesman_id) references salesman(salesman_id));

insert into orders values(70001, 150.5, '2012-10-05', 3005, 5002),
                         (70009, 270.65, '2012-09-10', 3001, 5005),
                         (70002, 65.26, '2012-10-05', 3002, 5001),
                         (70004, 110.5, '2012-08-17', 3009, 5003),
                         (70007, 948.5, '2012-09-10', 3005, 5002),
                         (70005, 2400.6, '2012-07-27', 3007, 5001),
                         (70008, 5760, '2012-09-10', 3002, 5001);

-- #3
create role junior_dev with login;

-- #4
create view newYorkers as select * from salesman where city = 'New York';


-- #5
create view viewOrders as select o.ord_no, s.name as salesman_name, c.cust_name as customer_name from orders o left join
    customers c on o.customer_id = c.customer_id left join salesman s on o.salesman_id = s.salesman_id;


grant all privileges on view viewOrders to junior_dev;

-- #6
create view viewHighestGrade as select * from customers where grade = (select max(grade) from customers);

grant select on view viewOrders to junior_dev;

-- #7
create view showSalesman as select city, count(*) as salesman_count from salesman group by city;

-- #8
create view salesmanCount as select s.salesman_id, s.name as salesman_name ,count(c.customer_id) as customer_count
    from salesman s
    join customers c on s.salesman_id = c.salesman_id
    group by s.salesman_id, s.name having count(c.customer_id) > 1;

-- #9
create role intern;
grant junior_dev to intern;

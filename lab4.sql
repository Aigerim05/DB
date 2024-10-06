-- #1
create database lab4;

-- #2
create table Warehouses(
    code INT,
    location varchar(255),
    capacity INT
);

create table Boxes(
    code char(4),
    contents varchar(255),
    value real,
    warehouse integer
);

-- #3
insert into Warehouses values(1, 'Chicago', 3),
                             (2, 'Chicago', 4),
                             (3, 'New York', 7),
                             (4, 'Los Angeles', 2),
                             (5, 'San Francisco', 8);

insert into Boxes values ('0MN7', 'Rocks', 180, 3),
                         ('4H8P', 'Rocks', 250, 1),
                         ('4RT3', 'Scissors', 190, 4),
                         ('7G3H', 'Rocks', 200, 1),
                         ('8jN6', 'Papers', 75, 1),
                         ('8Y6U', 'Papers', 50, 3),
                         ('9j6F', 'Papers', 175, 2),
                         ('LL08', 'Rocks', 140, 4),
                         ('P0H6', 'Scissors', 125, 1),
                         ('P2T6', 'Scissors', 150, 2),
                         ('TU55', 'Papers', 90, 5);

-- #4
select * from warehouses;

-- #5
select * from boxes where value > 150;

-- #6
select distinct contents from boxes;

-- #7
select warehouse, count(*) from boxes group by warehouse ;

-- #8
select warehouse from boxes group by warehouse having count(*) > 2 ;

-- #9
update warehouses set capacity = 3 where location = 'New York';

-- #10
insert into boxes values ('H5RT', 'Papers', 200, 2);

-- #11
update boxes set value = 0.85 * value where value =
                                            (select value from boxes order by value desc limit 1 offset 2);

-- #12
delete from boxes where value < 150;

-- #13
delete from boxes where warehouse = (select code from warehouses where location = 'New York') returning *;
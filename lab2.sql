-- #1
create database lab2;

-- #2
create table countries
(
    country_id serial primary key,
    country_name varchar,
    region_id int,
    population int
);

-- #3
insert into countries (country_name, region_id, population) values ('Kazakhstan', 2, 100);

-- #4
insert into countries (country_name) values ('USA');

-- #5
insert into countries (region_id) values (null);

-- #6
insert into countries (country_name, region_id, population) values ('A', 9, 10),
                                                                   ('B', 5, 80),
                                                                   ('C', 6, 120);
-- #7
alter table countries alter column country_name set default 'Kazakhstan';

-- #8
insert into countries (country_name, region_id, population) values (default, 4, 10);

-- #9
insert into countries (country_name, region_id, population) values (default, default, default);

-- #10
create table countries_new (like countries including all);

-- #11
insert into countries_new select * from countries;

-- #12
update countries set region_id = 1 where region_id is null;

-- #13
update countries set population = population * 1.1 returning country_name, population as new_population;

-- #14
delete from countries where population < 100;

-- #15
delete from countries_new using countries where countries.country_id = countries_new.country_id returning *;

-- #16
delete from countries returning *;
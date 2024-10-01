--# 1
create database lab3;

--# 2
-- run lab3.sql

--# 3
select lastname from employees;

--# 4
select distinct lastname from employees;

--# 5
select * from employees where lastname = 'Smith';

--# 6
select * from employees where lastname = 'Smith' or lastname = 'Doe';

--# 7
select * from employees where department = 14;

--# 8
select * from employees where department = 37 or department = 77;

--# 9
select sum(budget) from departments;

--# 10
select department, count(*) from employees group by department;

--# 11
select department from employees group by department having count(*) > 2;

--# 12
select name from departments order by budget desc limit 1 offset 1;

--#13
select name, lastname from employees where department = (select code from departments where budget = (select min(budget) from departments));

--# 14
select name from employees where city = 'Almaty' union select name from customers where city = 'Almaty';

--# 15
select * from departments where budget > 60000 order by budget, code desc;

--# 16
update departments set budget = budget * 0.9 where code = (select code from public.departments where budget = (select min(budget) from departments)) ;

--# 17
update employees set department = (select code from departments where name = 'IT') where department = (select code from departments where name = 'Research');

--# 18
delete from employees where department = (select code from departments where name = 'IT');

--# 19
delete from employees;
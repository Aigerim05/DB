
-- #1
create function increase_value (a integer)
returns integer as
$$
begin
return a + 10;
end;
$$
language plpgsql;

select increase_value(5);

-- #2
create function compare_numbers(a integer, b integer, out ans varchar(10))
as
$$
begin
    if a > b then
        ans := 'Greater';
    elseif a < b then
        ans := 'Lesser';
    else
        ans := 'Equal';
    end if;
end;
$$
language plpgsql;

-- select  compare_numbers(5, 6);
-- select compare_numbers(5, 5);
-- select compare_numbers(6, 5);

-- #3
-- create table ans (myset int);

create function number_series (in n integer)
returns setof ans as
$$
    declare i int;

    begin
        for i in 1..n
        loop
            return next i;
        end loop;
        return;
    end;
$$
language plpgsql;

-- select * from number_series(3);

-- #4
create table employee (
    employee_id serial primary key,
    employee_name text,
    department text,
    position text,
    salary decimal
);

insert into employee (employee_name, department, salary)
values
    ('John Doe', 'HR', 60000),
    ('Jane Smith', 'IT', 75000),
    ('Alice Johnson', 'Finance', 55000),
    ('Bob Brown', 'Sales', 45000),
    ('Charlie Davis', 'IT', 48000),
    ('Eva White', 'Marketing', 65000),
    ('Frank Green', 'HR', 47000);

create function find_employee(emp_name text)
returns table (
    employee_id int,
    employee_name text,
    department text,
    salary decimal
) as
$$
begin
    return query
    select employee.employee_id, employee.employee_name, employee.department, employee.salary
    from employee
    where employee.employee_name = emp_name;
end;
$$
language plpgsql;

select find_employee('John Doe');

-- #5
create table products(product_id serial primary key,
product_name text,
product_weight decimal,
product_category text);


insert into products (product_name, product_weight, product_category)
values
    ('Smartphone', 0.5, 'Electronics'),
    ('Laptop', 2.5, 'Electronics'),
    ('Desk Chair', 7.3, 'Furniture'),
    ('Coffee Maker', 1.2, 'Appliances'),
    ('LED TV', 12.4, 'Electronics');



create function list_products (category text)
returns table (product_id int, product_name text, product_weight decimal, product_category text)
as
    $$
        begin
            return query
                select products.product_id, products.product_name, products.product_weight, products.product_category
                from products
                where products.product_category = category;
        end;
    $$
language plpgsql;

select list_products('Electronics');


-- #6
create table employee (
    employee_id serial primary key,
    employee_name text,
    department text,
    salary decimal
);


insert into employee (employee_name, department, salary)
values
    ('John Doe', 'HR', 60000),
    ('Jane Smith', 'IT', 75000),
    ('Alice Johnson', 'Finance', 55000),
    ('Bob Brown', 'Sales', 45000),
    ('Charlie Davis', 'IT', 48000),
    ('Eva White', 'Marketing', 65000),
    ('Frank Green', 'HR', 47000);

create function calculate_bonus(emp_id integer)
returns decimal as
$$
    declare emp_salary decimal;
        emp_bonus decimal;
    begin
        select salary into emp_salary
        from employee
        where employee.employee_id = emp_id;

        emp_bonus := emp_salary*0.30;

        return emp_bonus;
    end;
$$
language plpgsql;

-- select calculate_bonus(1);

create function update_salary(emp_id integer)
returns void as
$$
    begin
        update employee
        set salary = salary + calculate_bonus(emp_id)
        where employee.employee_id = emp_id;
    end;
$$
language plpgsql;

-- select update_salary(1);
-- select * from employee where employee_id = 1;


-- #7

create function complex_calculation(a decimal, b decimal, name varchar, surname varchar)
returns void as
$$
declare
    fio VARCHAR = '';
    new_salary decimal = 0;
    result varchar = '';
BEGIN
    <<inner1>>
        BEGIN
            new_salary := a + b;
        END inner1;
    <<inner2>>
        BEGIN
            fio := name || ' ' || surname;
        END inner2;
    result := fio || ' has new salary: ' || new_salary::TEXT;
    RAISE NOTICE 'Final calculated result: %', result;
end;
$$
language plpgsql;

select complex_calculation(3.0, 4.0, 'Bob', 'John');

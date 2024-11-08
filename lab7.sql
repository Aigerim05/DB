--- #1
create index name_index on countries(name);

--- #2
create index name_surname_index on countries(name, surname);

--- #3
create unique index salary_index on employees(salary);

--- #4
create index substring_name_index on employees(substring(name from 1 for 4));

--- #5
create index departments_department_id_index on departments(department_id);

create index employees_department_id_index on employees(department_id);

create index departments_budget on departments(budget);

create index employees_salary on employees(salary);



-- IF YOU RETURN TABLE, then in the main product_category
-- you return QUERY

-- declare emp_salary decimal;
--         emp_bonus decimal;
--     begin
--         select salary into emp_salary
--         from employee
--         where employee.employee_id = emp_id;



-- FOR record IN 
--     SELECT id, name FROM users WHERE active = TRUE
-- LOOP
--     RAISE NOTICE 'User ID: %, User Name: %', record.id, record.name;
-- END LOOP;


-- DECLARE
--     counter INT := 0;
-- BEGIN
--     FOR counter IN 1..10 LOOP
--         IF counter = 5 THEN
--             CONTINUE;  -- Skip the iteration when counter is 5
--         END IF;
--         RAISE NOTICE 'Counter: %', counter;
--     END LOOP;
-- END;


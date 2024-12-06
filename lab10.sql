
-- #1
begin;

insert into orders (order_id, book_id, customer_id, order_date, quantity)
values(1,1,101,now(), 2);

update books set quantity = quantity - 2 where book_id = 1;
commit;
-- rollback;

select * from orders;
select * from customers;

-- #2


do $$
declare
    available integer;
begin;
    select quantity into available from books where book_id = 3;

    if available < 10 then rollback;
    else
        insert into orders(order_id, book_id, customer_id, order_date, quantity)
        values (2, 3, 102, now(), 10 );

        update books set quantity = quantity - 10 where book_id = 3;
        commit;
    end if;
end;
$$


-- #3

begin transaction isolation level read committed;

update books set price = 300.0 where book_id = 2;
commit;


begin transaction isolation level read committed;
select price from books where book_id = 2;


--#4
begin;
update customers set email = 'someemail@gmail.com' where customer_id = 101;
commit;
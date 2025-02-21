--Assignment :online Book Store


Create Table Customers51(customer_id int primary key,
customer_name varchar(30));


Create Table Books51(books_id int primary key,
Title varchar (30),
price decimal(10,2),
stock int);


Create Table Orders51(order_id int primary key,
customer_id int,
books_id int ,
order_date date,
quantity int,
Foreign key (customer_id) references customers51(customer_id),
foreign key(books_id) references books51(books_id));


INSERT INTO Customers51 (customer_id, customer_name) VALUES
(1, 'Alice Johnson'),
(2, 'Bob Smith'),
(3, 'Charlie Brown'),
(4, 'Diana Prince'),
(5, 'Evan Davis');


INSERT INTO Books51 (books_id, Title, price, stock) VALUES
(101, 'The Great Gatsby', 10.99, 50),
(102, '1984', 8.99, 30),
(103, 'To Kill a Mockingbird', 12.50, 20),
(104, 'Pride and Prejudice', 9.75, 40),
(105, 'The Catcher in the Rye', 11.20, 25);


INSERT INTO Orders51 (order_id, customer_id, books_id, order_date, quantity) VALUES
(1001, 1, 101, '2025-01-15', 2),
(1002, 2, 103, '2025-01-20', 1),
(1003, 3, 102, '2025-02-05', 3),
(1004, 4, 105, '2025-02-10', 1),
(1005, 5, 104, '2025-02-15', 2);

--Task 1
select customer_name 
from customers51
where customer_id in (select distinct customer_id from orders51);

--Task 2
select Title 
from Books51
where books_id not in (select distinct books_id from orders51);


--Task 3
select Title 
From Books51
where stock =0

--Task 5
SELECT Title, price
FROM Books51
WHERE price = (
    SELECT MAX(price)
    FROM Books51
    WHERE books_id IN (
        SELECT books_id
        FROM Orders51
    )
);

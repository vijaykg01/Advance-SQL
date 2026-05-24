CREATE TABLE Books (
    Book_ID SERIAL PRIMARY KEY,
    Title VARCHAR(100),
    Author VARCHAR(100),
    Genre VARCHAR(50),
    Published_Year INT,
    Price NUMERIC(10, 2),
    Stock INT );

CREATE TABLE Customers (
    Customer_ID SERIAL PRIMARY KEY,
    Name VARCHAR(100),
    Email VARCHAR(100),
    Phone VARCHAR(15),
    City VARCHAR(50),
    Country VARCHAR(150) );

CREATE TABLE Orders (
    Order_ID SERIAL PRIMARY KEY,
    Customer_ID INT REFERENCES Customers(Customer_ID),
    Book_ID INT REFERENCES Books(Book_ID),
    Order_Date DATE,
    Quantity INT,
    Total_Amount NUMERIC(10, 2) );

SELECT * FROM Books;
SELECT * FROM Customers;
SELECT * FROM Orders;

-- 1) Retrieve all books in the "Fiction" genre:

SELECT * FROM BOOKS
WHERE genre='Fiction';

-- 2) Find books published after the year 1950:

SELECT * FROM BOOKS
WHERE published_year>'1950';

-- 3) List all customers from the Canada:

SELECT * FROM customers
WHERE country='Canada';

-- 4) Show orders placed in November 2023:

SELECT * FROM orders
WHERE order_date between '01-11-2023' and '30-11-2023';

-- 5) Retrieve the total stock of books available:

SELECT SUM(STOCK) AS total_stock_of_books
FROM BOOKS;

-- 6) Find the details of the most expensive book:

SELECT * FROM books 
order by price DESC 
LIMIT 1;
--OR--
SELECT * FROM Books
WHERE Price = (SELECT MAX(Price)
FROM Books);

-- 7) Show all customers who ordered more than 1 quantity of a book:

SELECT * FROM orders
WHERE quantity>1;
--OR--
SELECT c.Customer_ID,
       c.Name,
       o.Order_ID,
       o.Quantity
FROM Customers c
JOIN Orders o
ON c.Customer_ID = o.Customer_ID
WHERE o.Quantity > 1;

-- 8) Retrieve all orders where the total amount exceeds $20:

SELECT * FROM orders
WHERE total_amount>20;

-- 9) List all genres available in the Books table:

SELECT DISTINCT genre from books;

-- 10) Find the book with the lowest stock:

SELECT * FROM books 
order by stock ASC 
LIMIT 1;
--OR--
SELECT * FROM Books
WHERE Stock = (SELECT MIN(Stock)
FROM Books);

-- 11) Calculate the total revenue generated from all orders:

SELECT sum(total_amount) AS tptal_revenue FROM orders;


SELECT * FROM Books;
SELECT * FROM Customers;
SELECT * FROM Orders;

-- Advance Questions : 

-- 1) Retrieve the total number of books sold for each genre:

SELECT b.genre,sum(o.quantity) as total_book_sold
from orders o
join books b
on o.book_id=b.book_id
group by genre;

-- 2) Find the average price of books in the "Fantasy" genre:

select avg(price) as avg_fantasy_price
from books
where genre='Fantasy';


-- 3) List customers who have placed at least 2 orders:

select customer_id,count(order_id) as order_count
from orders 
GROUP BY customer_id
HAVING count(order_id)>=2;
--OR--
SELECT c.Customer_ID,
       c.Name,
       COUNT(o.Order_ID) AS Total_Orders
FROM Customers c
JOIN Orders o
ON c.Customer_ID=o.Customer_ID
GROUP BY c.Customer_ID,c.Name
HAVING COUNT(o.Order_ID)>=2;

-- 4) Find the most frequently ordered book:

select book_id,count(order_id) as order_count
from orders 
GROUP BY book_id
order by order_count desc
limit 1;
--OR--
SELECT b.Book_ID,
       b.Title,
       COUNT(o.Order_ID) AS Order_Count
FROM Books b
JOIN Orders o
ON b.Book_ID=o.Book_ID
GROUP BY b.Book_ID,b.Title
ORDER BY Order_Count DESC
LIMIT 1;

-- 5) Show the top 3 most expensive books of 'Fantasy' Genre :

select * from books 
where genre='Fantasy'
order by price desc
limit 3;

-- 6) Retrieve the total quantity of books sold by each author:

select b.author,sum(o.quantity) as toatl_quantity_sold
from orders o
join books b
on o.book_id=b.book_id
GROUP BY b.author;

SELECT * FROM Books;
SELECT * FROM Customers;
SELECT * FROM Orders;

-- 7) List the cities where customers who spent over $30 are located:

 select DISTINCT c.city,total_amount
 from orders o
 join customers c
 on c.customer_id=o.customer_id
 where total_Amount>30;

-- 8) Find the customer who spent the most on orders:

 select c.customer_id,c.name,sum(total_amount) as total_sum_amount
 from orders o
 join customers c
 on c.customer_id=o.customer_id
 group by c.customer_id,c.name
 order by total_sum_amount desc
 limit 1;

-- 9) Calculate the stock remaining after fulfilling all orders

SELECT b.Book_ID,
       b.Title,
       b.Stock AS Original_Stock,
       COALESCE(SUM(o.Quantity),0) AS Ordered_Quantity,
       (b.Stock-COALESCE(SUM(o.Quantity),0)) AS Remaining_Stock
FROM Books b
LEFT JOIN Orders o
ON b.Book_ID=o.Book_ID
GROUP BY b.Book_ID,b.Title,b.Stock;



SELECT * FROM PRODUCTS1;

-- Assign a unique row number to each product within the same category
-- Ranking by category wise
Select product_name, category, Price, 
	ROW_NUMBER() OVER 
		(Partition by category order by price DESC) as row_number 
from products1;

/* ROW_NUMBER() OR DENSE_RANK() */

Select product_name, category, Price, 
	DENSE_RANK() OVER 
		(Partition by category order by price DESC) as row_number 
from products1;


--Running total without category
Select product_name, category, Price, 
	SUM(price) OVER 
		(order by price DESC) as row_number 
from products1;

--Running total with category
Select product_name, category, Price, 
	SUM(price) OVER 
		(Partition by category order by price DESC) as row_number 
from products1;


# Case Study #1 - Danny's Diner



/* --------------------
   Case Study Questions
   --------------------*/

-- 1. What is the total amount each customer spent at the restaurant?
     
    
 **Query #1**

    SELECT
       sales.customer_id,
        sum(menu.price)
        
    FROM dannys_diner.sales
    inner join dannys_diner.menu on sales.product_id = menu.product_id
    group by sales.customer_id
    ORDER BY sum(menu.price) desc;


**Query #2**

-- 2. How many days has each customer visited the restaurant?

    SELECT
       customer_id,
        count(distinct order_date) as Count_days
        
    FROM dannys_diner.sales
    group by sales.customer_id;

| customer_id | count_days |
| ----------- | ---------- |
| A           | 4          |
| B           | 6          |
| C           | 2          |

**-- 3. What was the first item from the menu purchased by each customer?**

    WITH partitioned AS (
        SELECT customer_id,
               order_date,
               product_id
              ,DENSE_RANK() OVER(PARTITION BY customer_id
                                ORDER BY order_date) AS rank
        FROM dannys_diner.sales
    )
    SELECT partitioned.customer_id,
              partitioned.order_date,
           menu.product_name
    FROM partitioned
    INNER JOIN dannys_diner.menu ON partitioned.product_id = menu.product_id
    where partitioned.rank = 1
    group by partitioned.customer_id,
              partitioned.order_date,
              menu.product_name;

| customer_id | order_date               | product_name |
| ----------- | ------------------------ | ------------ |
| A           | 2021-01-01T00:00:00.000Z | curry        |
| A           | 2021-01-01T00:00:00.000Z | sushi        |
| B           | 2021-01-01T00:00:00.000Z | curry        |
| C           | 2021-01-01T00:00:00.000Z | ramen        |

---



**Query #4**

    SELECT product_name,
           COUNT(product_name)
               
        FROM dannys_diner.sales 
        INNER JOIN dannys_diner.menu ON sales.product_id = menu.product_id
        GROUP BY product_name
        LIMIT 1;

| product_name | count |
| ------------ | ----- |
| ramen        | 8     |


**5. Which item was the most popular for each customer?**

    WITH partitioned AS (SELECT customer_id,
                   product_id,
                   count(product_id) as contagem,
                          DENSE_RANK() OVER(PARTITION BY customer_id
                                    ORDER BY count(product_id) DESC) AS ranking
                  
            FROM dannys_diner.sales
            group by customer_id,
                   product_id
            ) 
            
      SELECT partitioned.customer_id,
             menu.product_name,
             partitioned.contagem 
    from partitioned
    INNER JOIN dannys_diner.menu ON partitioned.product_id = menu.product_id
    where partitioned.ranking = 1
    
    order by partitioned.customer_id;

| customer_id | product_name | contagem |
| ----------- | ------------ | -------- |
| A           | ramen        | 3        |
| B           | sushi        | 2        |
| B           | curry        | 2        |
| B           | ramen        | 2        |
| C           | ramen        | 3        |

---
**6. Which item was purchased first by the customer after they became a member?**

    WITH partitioned AS (SELECT sales.customer_id,
                       menu.product_name,
                       DENSE_RANK() OVER(PARTITION BY sales.customer_id
                                        ORDER BY order_date) AS ranking
                      
                FROM dannys_diner.sales
                INNER JOIN dannys_diner.menu ON sales.product_id = menu.product_id
                INNER JOIN dannys_diner.members ON sales.customer_id = members.customer_id
                WHERE sales.order_date >= members.join_date                     
                
                ) 
        select * from partitioned
        where partitioned.ranking = 1;

| customer_id | product_name | ranking |
| ----------- | ------------ | ------- |
| A           | curry        | 1       |
| B           | sushi        | 1       |

---


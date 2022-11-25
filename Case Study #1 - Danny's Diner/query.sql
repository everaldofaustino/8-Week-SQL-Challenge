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
**7. Which item was purchased just before the customer became a member?**

    WITH partitioned AS (SELECT sales.customer_id,
                       menu.product_name,
                       DENSE_RANK() OVER(PARTITION BY sales.customer_id
                                        ORDER BY order_date) AS ranking
                      
                FROM dannys_diner.sales
                INNER JOIN dannys_diner.menu ON sales.product_id = menu.product_id
                INNER JOIN dannys_diner.members ON sales.customer_id = members.customer_id
                WHERE sales.order_date < members.join_date                     
                
                ) 
        select * from partitioned
        where partitioned.ranking = 1;

| customer_id | product_name | ranking |
| ----------- | ------------ | ------- |
| A           | sushi        | 1       |
| A           | curry        | 1       |
| B           | curry        | 1       |

---
**8. What is the total items and amount spent for each member before they became a member?**

    select sales.customer_id,SUM(menu.price) AS sum_price,count(*) AS contagem_itens 
        FROM dannys_diner.sales
                INNER JOIN dannys_diner.menu ON sales.product_id = menu.product_id
                INNER JOIN dannys_diner.members ON sales.customer_id = members.customer_id
                WHERE sales.order_date < members.join_date  
        
       
        group by sales.customer_id;

| customer_id | sum_price | contagem_itens |
| ----------- | --------- | -------------- |
| B           | 40        | 3              |
| A           | 25        | 2              |

---


**9.  If each $1 spent equates to 10 points and sushi has a 2x points multiplier - how many points would each customer have?**

    WITH points as( select *, CASE WHEN product_id =1 THEN (menu.price)*20 ELSE (menu.price)*10  END AS points   
       
        
        FROM dannys_diner.menu)
       
       Select sales.customer_id, SUM(points)
       From dannys_diner.sales
       INNER JOIN points ON points.product_id = sales.product_id
         
       group by sales.customer_id;

| customer_id | sum |
| ----------- | --- |
| B           | 940 |
| C           | 360 |
| A           | 860 |

---


**10. In the first week after a customer joins the program (including their join date) they earn 2x points on all items, not just sushi - how many points do customer A and B have at the end of January?**

    with new_date as(
       SELECT *, 
          join_date + INTERVAL '6 day' as reference_date, date '2021-01-31' as january
      FROM dannys_diner.members)
       
       select sales.customer_id, SUM( CASE WHEN sales.product_id = 1 then (menu.price)*20
                                     when sales.order_date between new_date.join_date AND reference_date THEN (menu.price)*20
                                     ELSE (menu.price)*10 END ) as points
                                     
    from new_date      
    inner join dannys_diner.sales on new_date.customer_id = sales.customer_id
    inner join dannys_diner.menu on menu.product_id = sales.product_id
    where sales.order_date < new_date.january
    group by sales.customer_id;

| customer_id | points |
| ----------- | ------ |
| A           | 1370   |
| B           | 820    |

---




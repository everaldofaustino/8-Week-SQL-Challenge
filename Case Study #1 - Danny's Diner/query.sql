

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

---

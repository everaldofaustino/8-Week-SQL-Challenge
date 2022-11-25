# 8-Week-SQL-Challenge


<img src="https://user-images.githubusercontent.com/81607668/127727503-9d9e7a25-93cb-4f95-8bd0-20b87cb4b459.png" alt="Image" width="500" height="520">

<h2 id="introduction">Introduction</h2>

<p>Danny seriously loves Japanese food so in the beginning of 2021, he decides to embark upon a risky venture and opens up a cute little restaurant that sells his 3 favourite foods: sushi, curry and ramen.</p>

<p>Danny’s Diner is in need of your assistance to help the restaurant stay afloat - the restaurant has captured some very basic data from their few months of operation but have no idea how to use their data to help them run the business.</p>

<h2 id="problem-statement">Problem Statement</h2>

<p>Danny wants to use the data to answer a few simple questions about his customers, especially about their visiting patterns, how much money they’ve spent and also which menu items are their favourite. Having this deeper connection with his customers will help him deliver a better and more personalised experience for his loyal customers.</p>

<p>He plans on using these insights to help him decide whether he should expand the existing customer loyalty program - additionally he needs help to generate some basic datasets so his team can easily inspect the data without needing to use SQL.</p>

<p>Danny has provided you with a sample of his overall customer data due to privacy issues - but he hopes that these examples are enough for you to write fully functioning SQL queries to help him answer his questions!</p>

<p>Danny has shared with you 3 key datasets for this case study:</p>

<ul>
  <li><code class="language-plaintext highlighter-rouge">sales</code></li>
  <li><code class="language-plaintext highlighter-rouge">menu</code></li>
  <li><code class="language-plaintext highlighter-rouge">members</code></li>
</ul>

<p>You can inspect the entity relationship diagram and example data below.</p>

<h2 id="entity-relationship-diagram">Entity Relationship Diagram</h2>

![image](https://user-images.githubusercontent.com/81607668/127271130-dca9aedd-4ca9-4ed8-b6ec-1e1920dca4a8.png)

<h2 id="example-datasets">Example Datasets</h2>

<p>All datasets exist within the <code class="language-plaintext highlighter-rouge">dannys_diner</code> database schema - be sure to include this reference within your SQL scripts as you start exploring the data and answering the case study questions.</p>

<h3 id="table-1-sales">Table 1: sales</h3>

<p>The <code class="language-plaintext highlighter-rouge">sales</code> table captures all <code class="language-plaintext highlighter-rouge">customer_id</code> level purchases with an corresponding <code class="language-plaintext highlighter-rouge">order_date</code> and <code class="language-plaintext highlighter-rouge">product_id</code> information for when and what menu items were ordered.</p>

<div class="responsive-table">

  <table>
    <thead>
      <tr>
        <th>customer_id</th>
        <th>order_date</th>
        <th>product_id</th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td>A</td>
        <td>2021-01-01</td>
        <td>1</td>
      </tr>
      <tr>
        <td>A</td>
        <td>2021-01-01</td>
        <td>2</td>
      </tr>
      <tr>
        <td>A</td>
        <td>2021-01-07</td>
        <td>2</td>
      </tr>
      <tr>
        <td>A</td>
        <td>2021-01-10</td>
        <td>3</td>
      </tr>
      <tr>
        <td>A</td>
        <td>2021-01-11</td>
        <td>3</td>
      </tr>
      <tr>
        <td>A</td>
        <td>2021-01-11</td>
        <td>3</td>
      </tr>
      <tr>
        <td>B</td>
        <td>2021-01-01</td>
        <td>2</td>
      </tr>
      <tr>
        <td>B</td>
        <td>2021-01-02</td>
        <td>2</td>
      </tr>
      <tr>
        <td>B</td>
        <td>2021-01-04</td>
        <td>1</td>
      </tr>
      <tr>
        <td>B</td>
        <td>2021-01-11</td>
        <td>1</td>
      </tr>
      <tr>
        <td>B</td>
        <td>2021-01-16</td>
        <td>3</td>
      </tr>
      <tr>
        <td>B</td>
        <td>2021-02-01</td>
        <td>3</td>
      </tr>
      <tr>
        <td>C</td>
        <td>2021-01-01</td>
        <td>3</td>
      </tr>
      <tr>
        <td>C</td>
        <td>2021-01-01</td>
        <td>3</td>
      </tr>
      <tr>
        <td>C</td>
        <td>2021-01-07</td>
        <td>3</td>
      </tr>
    </tbody>
  </table>

</div>

<h3 id="table-2-menu">Table 2: menu</h3>

<p>The <code class="language-plaintext highlighter-rouge">menu</code> table maps the <code class="language-plaintext highlighter-rouge">product_id</code> to the actual <code class="language-plaintext highlighter-rouge">product_name</code> and <code class="language-plaintext highlighter-rouge">price</code> of each menu item.</p>

<div class="responsive-table">

  <table>
    <thead>
      <tr>
        <th>product_id</th>
        <th>product_name</th>
        <th>price</th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td>1</td>
        <td>sushi</td>
        <td>10</td>
      </tr>
      <tr>
        <td>2</td>
        <td>curry</td>
        <td>15</td>
      </tr>
      <tr>
        <td>3</td>
        <td>ramen</td>
        <td>12</td>
      </tr>
    </tbody>
  </table>

</div>

<h3 id="table-3-members">Table 3: members</h3>

<p>The final <code class="language-plaintext highlighter-rouge">members</code> table captures the <code class="language-plaintext highlighter-rouge">join_date</code> when a <code class="language-plaintext highlighter-rouge">customer_id</code> joined the beta version of the Danny’s Diner loyalty program.</p>

<div class="responsive-table">

  <table>
    <thead>
      <tr>
        <th>customer_id</th>
        <th>join_date</th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td>A</td>
        <td>2021-01-07</td>
      </tr>
      <tr>
        <td>B</td>
        <td>2021-01-09</td>
      </tr>
    </tbody>
  </table>

</div>

<h2 id="interactive-sql-session">Interactive SQL Session</h2>

<p>You can use the embedded DB Fiddle below to easily access these example datasets - this interactive session has everything you need to start solving these questions using SQL.</p>

<p>You can click on the <code class="language-plaintext highlighter-rouge">Edit on DB Fiddle</code> link on the top right hand corner of the embedded session below and it will take you to a fully functional SQL editor where you can write your own queries to analyse the data.</p>

<p>You can feel free to choose any SQL dialect you’d like to use, the existing Fiddle is using PostgreSQL 13 as default.</p>

<p>Serious SQL students have access to a dedicated SQL script in the 8 Week SQL Challenge section of the course which they can use to generate relevant temporary tables like we’ve done throughout the entire course!</p>

<div class="sqlfiddle-container">
  <iframe src="https://embed.db-fiddle.com/912b55b7-0c69-4f19-906f-aaef8ece6088" frameborder="0" allowfullscreen="" title="Embedded fiddle"></iframe>
</div>

<h2 id="case-study-questions">Case Study Questions</h2>

<p>Each of the following case study questions can be answered using a single SQL statement:</p>

<ol>
  <li>What is the total amount each customer spent at the restaurant?</li>
  <li>How many days has each customer visited the restaurant?</li>
  <li>What was the first item from the menu purchased by each customer?</li>
  <li>What is the most purchased item on the menu and how many times was it purchased by all customers?</li>
  <li>Which item was the most popular for each customer?</li>
  <li>Which item was purchased first by the customer after they became a member?</li>
  <li>Which item was purchased just before the customer became a member?</li>
  <li>What is the total items and amount spent for each member before they became a member?</li>
  <li>If each $1 spent equates to 10 points and sushi has a 2x points multiplier - how many points would each customer have?</li>
  <li>In the first week after a customer joins the program (including their join date) they earn 2x points on all items, not just sushi - how many points do customer A and B have at the end of January?</li>
</ol>

<h2 id="bonus-questions">Bonus Questions</h2>

<h3 id="join-all-the-things">Join All The Things</h3>

<p>The following questions are related creating basic data tables that Danny and his team can use to quickly derive insights without needing to join the underlying tables using SQL.</p>

<p>Recreate the following table output using the available data:</p>

<div class="responsive-table">

  <table>
    <thead>
      <tr>
        <th>customer_id</th>
        <th>order_date</th>
        <th>product_name</th>
        <th>price</th>
        <th>member</th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td>A</td>
        <td>2021-01-01</td>
        <td>curry</td>
        <td>15</td>
        <td>N</td>
      </tr>
      <tr>
        <td>A</td>
        <td>2021-01-01</td>
        <td>sushi</td>
        <td>10</td>
        <td>N</td>
      </tr>
      <tr>
        <td>A</td>
        <td>2021-01-07</td>
        <td>curry</td>
        <td>15</td>
        <td>Y</td>
      </tr>
      <tr>
        <td>A</td>
        <td>2021-01-10</td>
        <td>ramen</td>
        <td>12</td>
        <td>Y</td>
      </tr>
      <tr>
        <td>A</td>
        <td>2021-01-11</td>
        <td>ramen</td>
        <td>12</td>
        <td>Y</td>
      </tr>
      <tr>
        <td>A</td>
        <td>2021-01-11</td>
        <td>ramen</td>
        <td>12</td>
        <td>Y</td>
      </tr>
      <tr>
        <td>B</td>
        <td>2021-01-01</td>
        <td>curry</td>
        <td>15</td>
        <td>N</td>
      </tr>
      <tr>
        <td>B</td>
        <td>2021-01-02</td>
        <td>curry</td>
        <td>15</td>
        <td>N</td>
      </tr>
      <tr>
        <td>B</td>
        <td>2021-01-04</td>
        <td>sushi</td>
        <td>10</td>
        <td>N</td>
      </tr>
      <tr>
        <td>B</td>
        <td>2021-01-11</td>
        <td>sushi</td>
        <td>10</td>
        <td>Y</td>
      </tr>
      <tr>
        <td>B</td>
        <td>2021-01-16</td>
        <td>ramen</td>
        <td>12</td>
        <td>Y</td>
      </tr>
      <tr>
        <td>B</td>
        <td>2021-02-01</td>
        <td>ramen</td>
        <td>12</td>
        <td>Y</td>
      </tr>
      <tr>
        <td>C</td>
        <td>2021-01-01</td>
        <td>ramen</td>
        <td>12</td>
        <td>N</td>
      </tr>
      <tr>
        <td>C</td>
        <td>2021-01-01</td>
        <td>ramen</td>
        <td>12</td>
        <td>N</td>
      </tr>
      <tr>
        <td>C</td>
        <td>2021-01-07</td>
        <td>ramen</td>
        <td>12</td>
        <td>N</td>
      </tr>
    </tbody>
  </table>

</div>

<h3 id="rank-all-the-things">Rank All The Things</h3>

<p>Danny also requires further information about the <code class="language-plaintext highlighter-rouge">ranking</code> of customer products, but he purposely does not need the ranking for non-member purchases so he expects null <code class="language-plaintext highlighter-rouge">ranking</code> values for the records when customers are not yet part of the loyalty program.</p>

<div class="responsive-table">

  <table>
    <thead>
      <tr>
        <th>customer_id</th>
        <th>order_date</th>
        <th>product_name</th>
        <th>price</th>
        <th>member</th>
        <th>ranking</th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td>A</td>
        <td>2021-01-01</td>
        <td>curry</td>
        <td>15</td>
        <td>N</td>
        <td>null</td>
      </tr>
      <tr>
        <td>A</td>
        <td>2021-01-01</td>
        <td>sushi</td>
        <td>10</td>
        <td>N</td>
        <td>null</td>
      </tr>
      <tr>
        <td>A</td>
        <td>2021-01-07</td>
        <td>curry</td>
        <td>15</td>
        <td>Y</td>
        <td>1</td>
      </tr>
      <tr>
        <td>A</td>
        <td>2021-01-10</td>
        <td>ramen</td>
        <td>12</td>
        <td>Y</td>
        <td>2</td>
      </tr>
      <tr>
        <td>A</td>
        <td>2021-01-11</td>
        <td>ramen</td>
        <td>12</td>
        <td>Y</td>
        <td>3</td>
      </tr>
      <tr>
        <td>A</td>
        <td>2021-01-11</td>
        <td>ramen</td>
        <td>12</td>
        <td>Y</td>
        <td>3</td>
      </tr>
      <tr>
        <td>B</td>
        <td>2021-01-01</td>
        <td>curry</td>
        <td>15</td>
        <td>N</td>
        <td>null</td>
      </tr>
      <tr>
        <td>B</td>
        <td>2021-01-02</td>
        <td>curry</td>
        <td>15</td>
        <td>N</td>
        <td>null</td>
      </tr>
      <tr>
        <td>B</td>
        <td>2021-01-04</td>
        <td>sushi</td>
        <td>10</td>
        <td>N</td>
        <td>null</td>
      </tr>
      <tr>
        <td>B</td>
        <td>2021-01-11</td>
        <td>sushi</td>
        <td>10</td>
        <td>Y</td>
        <td>1</td>
      </tr>
      <tr>
        <td>B</td>
        <td>2021-01-16</td>
        <td>ramen</td>
        <td>12</td>
        <td>Y</td>
        <td>2</td>
      </tr>
      <tr>
        <td>B</td>
        <td>2021-02-01</td>
        <td>ramen</td>
        <td>12</td>
        <td>Y</td>
        <td>3</td>
      </tr>
      <tr>
        <td>C</td>
        <td>2021-01-01</td>
        <td>ramen</td>
        <td>12</td>
        <td>N</td>
        <td>null</td>
      </tr>
      <tr>
        <td>C</td>
        <td>2021-01-01</td>
        <td>ramen</td>
        <td>12</td>
        <td>N</td>
        <td>null</td>
      </tr>
      <tr>
        <td>C</td>
        <td>2021-01-07</td>
        <td>ramen</td>
        <td>12</td>
        <td>N</td>
        <td>null</td>
      </tr>
    </tbody>
  </table>

</div>



</html>

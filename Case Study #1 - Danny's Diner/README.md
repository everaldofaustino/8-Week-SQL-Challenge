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

<h2 id="next-steps">Next Steps</h2>

<p>It’s highly recommended to save all of your code in a separate IDE or text editor as you are trying to solve the problems in the provided SQL Fiddle instance above!</p>

<p>If you’d like to use this case study for one of your portfolio projects or in a personal blog post - please remember to link back to this URL and also don’t forget to share some LinkedIn updates using the <strong>#8WeekSQLChallenge</strong> hashtag and remember to tag me!</p>

<p>Ready for the next 8 Week SQL challenge case study? Click on the banner below to get started with case study #2!</p>

<p><a href="/case-study-2"><img src="/images/case-study-designs/2.png" alt="" /></a></p>

<h2 id="conclusion">Conclusion</h2>

<p>I really hope you enjoyed this fun little case study - it definitely was fun for me to create!</p>

<h3 id="official-solutions">Official Solutions</h3>

<p>If you’d like to see the official code solutions and explanations for this case study and a whole lot more, please consider joining me for the <a href="https://bit.ly/3gWUT2G">Serious SQL course</a> - you’ll get access to all course materials and I’m on hand to answer all of your additional SQL questions directly!</p>

<p><a href="https://bit.ly/3gWUT2G">Serious SQL</a> is priced at $49USD and $29 for students and includes access to all written course content, community events as well as live and recorded SQL training videos!</p>

<p>Please send an email to support@datawithdanny.com from your educational email or include your enrolment details or student identification for a speedy response!</p>

<p>The following topics relevant to the Danny’s Diner case study are covered lots of depth in the Serious SQL course:</p>

<ul>
  <li>Common Table Expressions</li>
  <li>Group By Aggregates</li>
  <li>Window Functions for ranking</li>
  <li>Table Joins</li>
</ul>

<p>Don’t forget to review the comprehensive list of SQL resources I’ve put together for the 8 Week SQL Challenge on the <a href="/resources">Resources</a> page!</p>

<h3 id="community-solutions">Community Solutions</h3>

<p>This section will be updated in the future with any community member solutions with a link to their respective GitHub repos!</p>

<h3 id="final-thoughts">Final Thoughts</h3>

<p>The 8 Week SQL Challenge is proudly brought to you by me - Danny Ma and the <a href="https://bit.ly/datawithdanny-8wsc">Data With Danny</a> virtual data apprenticeship program.</p>

<p>Students or anyone undertaking further studies are eligible for a $20USD student discount off the price of Serious SQL please send an email to support@datawithdanny.com from your education email or include information about your enrolment for a fast response!</p>

<p>We have a large student community active on the official DWD Discord server with regular live events, trainings and workshops available to all Data With Danny students, plus early discounted access to all future paid courses.</p>

<p>There are also opportunities for 1:1 mentoring, resume reviews, interview training and more from myself or others in the DWD Mentor Team.</p>

<p>From your friendly data mentor,
Danny :)</p>

<h3 id="all-8-week-sql-challenge-case-studies">All 8 Week SQL Challenge Case Studies</h3>

<p>All of the 8 Week SQL Challenge case studies can be found below:</p>

<ul>
  
    <li>
      <a href="/case-study-1/">Case Study #1 - Danny's Diner</a>
    </li>
  
    <li>
      <a href="/case-study-2/">Case Study #2 - Pizza Runner</a>
    </li>
  
    <li>
      <a href="/case-study-3/">Case Study #3 - Foodie-Fi</a>
    </li>
  
    <li>
      <a href="/case-study-4/">Case Study #4 - Data Bank</a>
    </li>
  
    <li>
      <a href="/case-study-5/">Case Study #5 - Data Mart</a>
    </li>
  
    <li>
      <a href="/case-study-6/">Case Study #6 - Clique Bait</a>
    </li>
  
    <li>
      <a href="/case-study-7/">Case Study #7 - Balanced Tree Clothing Co.</a>
    </li>
  
    <li>
      <a href="/case-study-8/">Case Study #8 - Fresh Segments</a>
    </li>
  
</ul>

  </div>

  <div>
    <p><span class="share-box">Share:</span> <a href="http://twitter.com/share?text=Case Study #1 - Danny's Diner&url=http://www.8weeksqlchallenge.com/case-study-1/" target="_blank">Twitter</a>, <a href="https://www.facebook.com/sharer.php?u=http://www.8weeksqlchallenge.com/case-study-1/" target="_blank">Facebook</a></p>
  </div>

  <!--<div class="date">
    Written on May  1, 2021
  </div>-->

  
</article>

        </div>
      </div>

      <div class="wrapper-footer">
        <div class="container">
          <footer class="footer">
            
<a href="mailto:support@datawithdanny.com"><i class="svg-icon email"></i></a>



<a href="https://instagram.com/datawithdanny"><i class="svg-icon instagram"></i></a>
<a href="https://www.linkedin.com/in/datawithdanny"><i class="svg-icon linkedin"></i></a>

<a href="/feed.xml"><i class="svg-icon rss"></i></a>
<a href="https://www.twitter.com/datawithdanny"><i class="svg-icon twitter"></i></a>

<a href="https://youtube.com/dannyma"><i class="svg-icon youtube"></i></a>



          </footer>
        </div>
      </div>
    </div>

    
	<!-- Google Analytics -->
	<script>
		(function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
		(i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
		m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
		})(window,document,'script','//www.google-analytics.com/analytics.js','ga');

		ga('create', 'G-FXZKPKHKTM', 'auto');
		ga('send', 'pageview', {
		  'page': '/case-study-1/',
		  'title': 'Case Study #1 - Danny\'s Diner'
		});
	</script>
	<!-- End Google Analytics -->



    <script type="text/javascript" src="/assets/darkmode.js"></script>
  </body>

</html>

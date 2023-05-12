# Performance & normalization

## Learning objectives
- Choose how to make database calls using ACID principles and explain the reasoning behind the choice.
- Understand what can impact database performance.
- Understand the concept of data normalization.

### Estimated time: 2h

## Normalization
Normalization is a technique that allows us to take a database and make it more maintainable, less error-prone, and more performant.

### Why is normalization important?
Normalization is important because it allows you to make your database design more maintainable and easier to optimize. Also, deduplicating data is a great way to prevent stale data from being fetched and used by accident.

### Normalization
Normalization is a process to reduce data redundancy and improve integrity. This process can have many forms, but you should only focus on **third normal form** (3NF). Any form beyond **3NF** is not worth the effort or not possible to achieve in all cases.

Normalizing your data will be an iterative process in which you go from first to third normal form.

- [Why is database normalization so important?](https://blog.saleslayer.com/why-is-database-normalization-so-important)
- [Normalization with examples](https://www.sqlservercentral.com/articles/database-normalization-in-sql-with-examples)

### Denormalization
Depending on the particular needs and usage of your system sometimes you might need to denormalize your data. In that case you would complete the steps listed in the section above, but in the inverse order, and duplicate some data to improve query speeds by reducing join operations.

- [Denormalization guide](https://www.vertabelo.com/blog/denormalization-when-why-and-how/)
- [Denormalization with examples](https://rubygarage.org/blog/database-denormalization-with-examples)

## Performance
Performance refers to the effectiveness of our database. It can be measured by assessing the speed of queries, memory consumption, CPU usage, and other factors. Depending on our specific needs and limitations, we may choose to prioritize certain aspects of performance, such as speed optimization.

### Why is performance important?
Performance is the end goal. When your apps start having enough traffic you will find that you spend more time improving performance than actually making new features. Because at the end of the day it doesn't matter if your app can do everything if it takes 10 seconds on each request to it. Imagine if every time you searched for something on DuckDuckGo or Google it took 5 times more than what it usually takes, would you keep using it or try and find another faster app?

**Guiding questions:**

*Think about these questions as you learn about performance.*

- What do you think is a slow query?
- How many tables/rows can a database handle?
- How would you debug slow queries?

### Performance basics
To understand how to optimize you first need to understand what sort of problems you will face, their consequences, and what metrics to keep an eye on.

- [How does number of rows affect performance?](https://stackoverflow.com/a/20024772)
- [Full table scan](https://www.datasprings.com/help/dnn-tutorials/artmid/535/articleid/57/sql-server-performance-situations-full-table-scans)
- [Effects of slow queries](https://orangematter.solarwinds.com/2018/01/17/slow-queries-move-fast-to-fix-them/)
- [PostgreSQL key metrics](https://blogs.manageengine.com/application-performance-2/appmanager/2020/04/27/key-metrics-for-postgresql-performance-monitoring.html)

### Performance investigation
If you determine that you have performance issues you will need to determine where the problem is. One of the most useful tools we have to solve these problems is `EXPLAIN ANALYZE`, this allows us to see how our queries are interpreted and executed by PostgreSQL.

- [What is a query plan?](https://dataschool.com/sql-optimization/what-is-a-query-plan/)
- [Understanding EXPLAIN ANALYZE](https://www.youtube.com/watch?v=Kdjz2e8HYPU)
- [Reading EXPLAIN ANALYZE query plan](https://thoughtbot.com/blog/reading-an-explain-analyze-query-plan)

### Performance tips
There are many tips on how to try to improve your database's performance, but one of the most useful, simple, and overlooked solutions is indexes. Indexes are another way to index (quickly search) your rows. The primary key is a kind of index.

Knowing what columns to index will depend on your actual use case, so think about what columns you use to filter rows. Foreign keys are good candidates for indexes because you tend to filter or join on them and the same value is used in several rows.

- [Guide to indexing](https://dataschool.com/sql-optimization/how-indexing-works/)
- [Why is the index not improving performance?](https://stackoverflow.com/questions/44597408/why-this-index-doesnt-improve-query-performance)
- [Query tuning](https://www.geekytidbits.com/performance-tuning-postgres/#query-tuning)

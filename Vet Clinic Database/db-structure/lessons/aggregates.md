# Aggregates

## Learning objectives
- Prepare complex queries that answer analytical questions.

### Estimated time: 1h

## Description
In this lesson, you will learn how to answer analytical questions when querying your data using aggregate functions. You will also learn how to answer more specific questions using `GROUP BY` in combination with aggregate functions.

### Why are aggregates important?
Aggregates are an integral part of databases that allow you to quickly answer questions regarding your data. Although they may seem simple, aggregate functions can be combined across queries to answer complex analytical questions.

**Guiding questions:**

*Think about these questions as you learn about aggregate functions.*

- How you would get the results from aggregate functions if they didn't exist?

### Aggregate functions and `GROUP BY`
Aggregate functions are built-in SQL tools to compute calculations on your data, allowing your queries to return a summarized view.

As you will see these aggregate functions are sometimes used in conjunction with the `GROUP BY` clause of a `SELECT` statement. `GROUP BY` allows you to group the rows fetched by your query and apply a transformation to them, usually an aggregate function, and return a summarized view of each group of data.

- Read this [guide to aggregate functions and GROUP BY](https://learnsql.com/blog/beginners-guide-sql-aggregate-functions/).
- Read this documentation on [GROUP BY](https://www.tutorialspoint.com/sql/sql-group-by.htm).

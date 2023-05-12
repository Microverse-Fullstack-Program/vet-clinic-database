# SQL: querying data

## Requirements

- `PostgreSQL` server installed and running.
- `psql` installed
- A database to use
- A table named `students`
- Data inserted into your `students` table.

## Description

Now that you have data in your database you can query it, for this we use `SELECT`. This SQL statement has a lot of variations and options you can use, but let's go from basic queries and build up to more complicated ones.

The base query to get all data (all columns) for our `students` table would be something like this:
```sql
SELECT id, student_id, age, first_name, last_name FROM students;
--  id | student_id | age | first_name | last_name
-- ----+------------+-----+------------+-----------
--   1 |         33 |     | Rory       | Williams
--   2 |         42 |  25 | Amy        | Pond
```

Since we want the values for all columns in our table we can replace the list of columns with `*`:
```sql
SELECT * FROM students;
--  id | student_id | age | first_name | last_name
-- ----+------------+-----+------------+-----------
--   1 |         33 |     | Rory       | Williams
--   2 |         42 |  25 | Amy        | Pond
```

Now you might be wondering what is that empty space in one of our rows. Well, remember you inserted that data without providing a value for `age` so it has an inexistent value, otherwise known as `NULL`. Don't mistake a SQL `NULL` value for a null in a programming language, here it is just a representation of not having a value, not an actual value.

So now how about we get some specific data, for this, we add a `WHERE` clause with a boolean expression to our `SELECT`. Let's look for all students that have a `student_id` less than 40.

```sql
SELECT * FROM students WHERE student_id < 40;
--  id | student_id | age | first_name | last_name
-- ----+------------+-----+------------+-----------
--   1 |         33 |     | Rory       | Williams
```

So you can put any boolean expression in the `WHERE` clause, you know the general idea from programming languages, but SQL offers some extra clauses to help you when building queries:

- `IN` checks if the value of the column is one of the values given.
```sql
SELECT * FROM students WHERE first_name IN ('Amy', 'Rory');
--  id | student_id | age | first_name | last_name
-- ----+------------+-----+------------+-----------
--   1 |         33 |     | Rory       | Williams
--   2 |         42 |  25 | Amy        | Pond
```

- `BETWEEN` checks if the value of the column is between two values.
```sql
SELECT * FROM students WHERE age BETWEEN 20 AND 50;
--  id | student_id | age | first_name | last_name
-- ----+------------+-----+------------+-----------
--   2 |         42 |  25 | Amy        | Pond
```

- `LIKE` checks colum for a pattern, similar to a regex.
```sql
SELECT * FROM students WHERE last_name LIKE '%liam%';
--  id | student_id | age | first_name | last_name
-- ----+------------+-----+------------+-----------
--   1 |         33 |     | Rory       | Williams
```

- `IS NULL` or `IS NOT NULL` will check if the column is `NULL` (has no value)
```sql
SELECT * FROM students WHERE age IS NULL;
--  id | student_id | age | first_name | last_name
-- ----+------------+-----+------------+-----------
--   1 |         33 |     | Rory       | Williams
```

Great! Now you know how to query your data.

# Multiple tables and primary key & foreign key

## Learning objectives
- Use primary key & foreign key mechanism for joining tables.
- Query multiple tables.
- Prepare complex queries that answer analytical questions.

### Estimated time: 1.5h

## Description
Foreign keys are how a row in a table references another row in another table, or in the same table. This feature and `JOIN` are what allow you to efficiently query multiple tables.

### Why is foreign key important?
Foreign key is important because this is where the **relational** in "relational database" comes into play. This is the mechanism that allows you to link two tables together and build a complex data model.

Occasionally you will also see this referenced as "foreign key constraint". This is because in practice when you declare a foreign key you are also declaring a constraint. This constraint ensures that whatever value you put in the foreign key column references a valid row in the other table.

**Guiding questions:**

*Think about these questions as you learn about foreign keys.*

- What extra work would you need to do to check that a row references another valid row?
- How would you get the same result of a `JOIN` query without using it?

### Defining foreign keys
As mentioned previously, foreign keys are how we create a relationship between two tables, specifically between two rows.

The most common type of relationship between tables is known as **one-to-many**. This relationship means that a row in the referenced table can have multiple rows in the other table referencing it.

**NOTE:** We will explore other relationships, like **many-to-many**, in future lessons.

- Documentation on [foreign keys](https://www.tutorialspoint.com/sql/sql-foreign-key.htm).
- [Foreign key guide](https://www.postgresqltutorial.com/postgresql-foreign-key/).
- [Diagram of one-to-many and many-to-one](https://www.tutorialspoint.com/One-to-Many-or-Many-to-One-Relationship-in-DBMS).

### Using foreign keys
Great, you know how to make relationships between your tables, but how does it help you make more complex queries? Well, we can use SQL's `JOIN`.

`JOIN` is how you combine records from different tables in one query. You can join using any columns, but most of the time it will only make sense to join the primary key and foreign key columns.

As you will see `JOIN` has four variants, each behaves a bit differently regarding how records are fetched.

- [Types of JOINs](https://www.dofactory.com/sql/join).
- [Inner join](https://www.tutorialspoint.com/sql/sql-inner-joins.htm).
- [Guide for all joins](https://www.postgresqltutorial.com/postgresql-joins/).

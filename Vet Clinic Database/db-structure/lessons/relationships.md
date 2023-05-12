# Different types of relationships

## Learning objectives
- Understand the different types of relationships between tables.

### Estimated time: 2h

## Description
In this lesson we are going to go over the different types of relationships you'll encounter when modeling your data.

### Why are types of relationships important?
Knowing how to correctly model your data is fundamental for a maintainable system and good performance. Also, knowing best practices for different scenarios will save you time as the solutions we will go over cover most use cases.

### One-to-many
This is the most common relationship type, it means that a row in the referenced table can be referenced by many rows in the other table.

Sometimes you will see the reverse, **many-to-one**. Don't worry about this - is the same idea, but from another point of view; in that case you are talking about the many rows that reference one.

To model this you will put the foreign key on the "many" side, the table that has the reference to the other one.

- Look at these examples of [one-to-many](https://devtut.github.io/mysql/one-to-many.html#example-company-tables) tables.

### Many-to-many
In these relationships you have multiple entities that could reference multiple entities. For example, think how you could have many posts, many tags, and each post could have any number of tags associated with it.

As you might remember a foreign key can only reference one row, so using just that would only allow us to include one single tag to our posts. Since we don't have a set number of tags we need a **join table**. This table will hold the actual relationship, and it will consist of two foreign key columns: one to our posts table and one to our tags table, as well as any other columns that might be needed.

- [Guide for many-to-many](https://sqlmodel.tiangolo.com/tutorial/many-to-many/).
- [Tutorial for many-to-many](https://dzone.com/articles/how-to-handle-a-many-to-many-relationship-in-datab).

### One-to-one
This relationship is a special case of **one-to-many** because it's mostly the same except you want to restrict to only be referenced by one instead of many.

How do you achieve this at a database level? Well, you need to enforce uniqueness on the foreign key. By enforcing uniqueness on the foreign key no other row in the table will be able to have the same value, reference the same row.

- Read the [one-to-one section](https://www.tutorialsteacher.com/sqlserver/tables-relations).
- [One-to-one by using PK](https://coding-examples.com/sql/table-relation-one-to-one-one-to-many-many-to-many-explained/#4-one-to-one-relation).

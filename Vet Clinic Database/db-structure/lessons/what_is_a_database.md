# What is a database?

## Learning objectives
- Explain ACID properties of databases.
- Understand the difference between relational and non-relational databases.

### Estimated time: 1.25h

## Relational vs non-relational databases

Here you will learn about relational (SQL) databases and non-relational (NoSQL) databases.

### Why is the distinction between relational vs non-relational databases important?

Knowing the different trade-offs between them will let you choose an adequate database when designing your next app.

Also, you will see that unlike relational databases, where they are pretty much identical, non-relational databases come in many forms and solve different problems.

### Relational databases

Relational databases, also known as SQL databases, are what you traditionally think of when thinking of a database. The main idea behind them is that data can be connected (related) and that is enforced by the database.

- [What is a relational database?](https://computer.howstuffworks.com/question599.htm)

### Non-relational databases

Non-relational databases provide ways of storing, searching, and retrieving data other than in tables with relationships. As you will see they come in many forms and each one solves a different problem.

- [What is NoSQL?](https://aws.amazon.com/nosql/)
- [Types of NoSQL databases](https://www.mongodb.com/scale/types-of-nosql-databases)

### Relational vs non-relational

Now that you know about both types of databases let us learn when one would be better than the other.

- [IBM: SQL vs NoSQL](https://www.ibm.com/cloud/blog/sql-vs-nosql).

## ACID properties of databases

ACID (atomicity, consistency, isolation, durability) is a set of properties of database transactions. These properties are the foundation of many databases, especially relational databases such as PostgreSQL and SQLite.

### Why is ACID important?

Knowing what ACID properties are and how they affect your database will allow you to better use your database. This means that you might design solutions that fit better your problem or understand what trade-offs a design offers against another one.

### ACID

ACID stands for:
- **Atomicity:** A transaction, which can contain multiple instructions, is treated as a single "unit". This single unit either succeeds completely or fails completely, never partially.
- **Consistency:** Any transaction can only change the state of the database from a valid one to another valid one, maintaining all invariants (i.e. foreign keys, constraints).
- **Isolation:** Each transaction is its own world. Two (or more) transactions occurring at the same time won't see the changes of the other one.
- **Durability:** In case of hardware or software errors, successful transactions must be recoverable. A database must be able to go down and back up and have the same state minus ongoing transactions.

- [Wikipedia: ACID](https://en.wikipedia.org/wiki/ACID).
- [What does ACID mean in database systems?](https://database.guide/what-is-acid-in-databases/).

## Install PostgreSQL

So you have learned about databases, now let's install one so you can test it out in a later lesson. In this case, will install the relational database [PostgreSQL](https://www.postgresql.org/).

### Installation

Depending on your OS the [download process](https://www.postgresql.org/download/) varies:

- [Windows](https://www.postgresql.org/download/windows/).
- [MacOS](https://www.postgresql.org/download/macosx/).
- Linux:
  - [Debian](https://www.postgresql.org/download/linux/debian/).
  - [Ubuntu](https://www.postgresql.org/download/linux/ubuntu/).
  - [Others](https://www.postgresql.org/download/linux/#generic).

After installing PostgreSQL read the [Getting started](https://www.postgresql.org/docs/current/tutorial-start.html) chapter from PostgreSQL's manual to understand the basics and how to check if it's working.

After that read the following tutorials:

1. [Creating a database](https://www.postgresql.org/docs/current/tutorial-createdb.html).
2. [Accesing a database](https://www.postgresql.org/docs/current/tutorial-accessdb.html).

## Additional materials
**These are all optional, but if you're interested in exploring this topic further, here are some resources to help you. Any exploration here should be done outside program time.**

- [Is NoSQL ACID?](https://stackoverflow.com/a/3014601)
- [MongoDB: SQL vs NoSQL](https://www.mongodb.com/nosql-explained/nosql-vs-sql)
- [When to use NoSQL](https://www.mongodb.com/nosql-explained/when-to-use-nosql)

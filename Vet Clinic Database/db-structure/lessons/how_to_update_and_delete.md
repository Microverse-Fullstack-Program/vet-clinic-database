# How to safely update or delete records?

## Learning objectives
- Modify and delete data in SQL.
- Use database transactions.

### Estimated time: 1.5h

## Description
In this lesson, you will learn how to safely update and delete records from your database using transactions.

### Why is safely updating or deleting records important?
Because updating or deleting records is an irreversible action, if not done with the correct preparations. Learning how to prepare for the worst-case will save you from a stressful situation (like deleting all records from a table by accident) that has no solution other than restoring from a backup (if you have one).

### Updating your records
To update records we use SQL's `UPDATE`. This will allow you to alter the values in specific columns in a table. Its syntax is as follows:

```sql
UPDATE table_name
SET column1 = value1, column2 = value2...., columnN = valueN
WHERE [condition];
```

- Documentation on [SQL UPDATE](https://www.tutorialspoint.com/sql/sql-update-query.htm)
- [Tutorial on using UPDATE](https://www.sqltutorial.org/sql-update/)

### Deleting your records
To delete records we use SQL's `DELETE`. Its syntax is as follows:

```sql
DELETE FROM table_name
WHERE [condition];
```

- Documentation on [SQL DELETE](https://www.tutorialspoint.com/sql/sql-delete-query.htm)
- [Tutorial on using DELETE](https://www.sqltutorial.org/sql-delete/)

### Transactions
In SQL a transaction is a change to apply to a database. This change can be a single instruction, like `UPDATE`, or multiple instructions to be executed in sequence.

How does this help with safely updating/deleting records? Well, since a transaction is treated as a single change you can do several instructions in it and if something went wrong you can roll back (undo) the entire transaction and your database will be the same as before you started.

- Documentation on [SQL Transactions](https://www.tutorialspoint.com/sql/sql-transactions.htm)
- [Tutorial for transactions in PostgreSQL](https://www.postgresqltutorial.com/postgresql-transaction/)

# Vet clinic database: database performance audit

## Learning objectives
- Understand what can impact database performance.

### Estimated time: 1.5h

## Description
In this project you will have a chance to optimize some slow queries in your database.

*IMPORTANT NOTE: Read **all** requirements before you start building your project.*

### General requirements

- Make sure that you used correct [Gitflow](https://github.com/microverseinc/curriculum-transversal-skills/blob/main/git-github/articles/gitflow.md).
- Make sure that you documented your work [in a professional way](https://github.com/microverseinc/curriculum-transversal-skills/blob/main/documentation/articles/professional_repo_rules.md).

### Preparation (0.5h)

For this project you need special preparation. As the goal of this project is to solve some performance issue, first we need to introduce those issues.
In order to do that, you will populate your database with a significant number of data.

Please complete the following steps:

1. Make sure that you have your database set up with the schema and data from your previous projects.
    - If you transitioned from 1.0 and you haven't complete the entire Ruby+Databases module, _you do not have the database ready._ In that case, please use the [schema.sql](./images/schema.sql) to create tables and [data.sql](./images/data.sql) to populate tables with the initial data.
3. Run the following query to add an extra column to the owners table:
  ``` sql
  -- Add an email column to your owners table
  ALTER TABLE owners ADD COLUMN email VARCHAR(120);
  ```
3. Run the following statements to add data to your database (**executing them might take a few minutes**):
  ```sql

  -- This will add 3.594.280 visits considering you have 10 animals, 4 vets, and it will use around ~87.000 timestamps (~4min approx.)
  INSERT INTO visits (animal_id, vet_id, date_of_visit) SELECT * FROM (SELECT id FROM animals) animal_ids, (SELECT id FROM vets) vets_ids, generate_series('1980-01-01'::timestamp, '2021-01-01', '4 hours') visit_timestamp;

  -- This will add 2.500.000 owners with full_name = 'Owner <X>' and email = 'owner_<X>@email.com' (~2min approx.)
  insert into owners (full_name, email) select 'Owner ' || generate_series(1,2500000), 'owner_' || generate_series(1,2500000) || '@mail.com';
  ```
4 Depending on your machine speed, it might be enough or not. Check that by running `explain analyze SELECT COUNT(*) FROM visits where animal_id = 4`:
     - If you get `Execution time: X ms` and X >= 1000: that should be enough, you can continue to the project requirements.
     - If you get `Execution time: X ms` and X < 1000: please go back to point 3. and repeat until you get a value bigger than 1000ms.

### Project requirements (1h)

- The following queries are taking too much time (**1 sec = 1000ms can be considered as too much time for database query**). Try them on your machine to confirm it:
  - `SELECT COUNT(*) FROM visits where animal_id = 4;`
  - `SELECT * FROM visits where vet_id = 2;`
  - `SELECT * FROM owners where email = 'owner_18327@mail.com';`
- Use `EXPLAIN ANALYZE` on the previous queries to check what is happening. Take screenshots of them - they will be necessary later.
- Find a way to decrease the execution time of the first query. Look for hints in the previous lessons.
- Find a way to improve execution time of the other two queries.
- While you are making changes, check if they help by running `EXPLAIN ANALYZE`. Once you succeed, take a screenshot of the `EXPLAIN ANALYZE` result showing that time actually decreased.
- Any changes you made to your database schema should be added to the schema.sql file and commited in a new pull request.
- If you decide to commit any `INSERT INTO` queries - remember to add the **m** to the data.sql file. It is important to keep only the queries that change the database structure in the schema.sql file.
- In your pull request description include screenshots with `EXPLAIN ANALYZE` results (before and after you improve the speed) for each of the 3 problematic queries.

- **_NOTE: once you are done with this task feel free to remove your database in order to free up some space on your computer. With database schema you will be able to re-create it at any point of time._**

### Need a big picture?

Remind me about [the big picture of this project](./sneak_peek.md).


## Work and submission mode

- You should implement the above requirements only in **one repository** in your pair-programming group.
- You should ask for a review and submit this activity **on behalf of your pair-programming group.**

## Code review

Follow [these steps](https://github.com/microverseinc/curriculum-transversal-skills/blob/main/code-review/articles/how_to_ask_for_a_code_review.md) to request a code review of your project.

## Submit your project

After the final approval from a code reviewer, you need to submit your project.
[Read this FAQ for a reminder on how to submit your project.](https://microverse.zendesk.com/hc/en-us/articles/360061344234)
Now go to your Student Dashboard and submit your project.

# Vet clinic database: query and update animals table

## Learning objectives
- Use database transactions.
- Modify and delete data in SQL.
- Prepare complex queries that answer analytical questions.

### Estimated time: 2.5h

## Description
In this project, you will use transactions to update and delete records. You will also use your knowledge of aggregate functions and `GROUP BY` to answer analytical questions.

*IMPORTANT NOTE: Read **all** requirements before you start building your project.*

### General requirements

- Make sure that you used the correct [Gitflow](https://github.com/microverseinc/curriculum-transversal-skills/blob/main/git-github/articles/gitflow.md).
- Make sure that you documented your work [in a professional way](https://github.com/microverseinc/curriculum-transversal-skills/blob/main/documentation/articles/professional_repo_rules.md).

### Project requirements
- Add a column `species` of type `string` to your `animals` table. Modify your `schema.sql` file.
- Insert the following data:
  - Animal: His name is Charmander. He was born on Feb 8th, 2020, and currently weighs -11kg. He is not neutered and he has never tried to escape.
  - Animal: Her name is Plantmon. She was born on Nov 15th, 2021, and currently weighs -5.7kg. She is neutered and she has tried to escape 2 times.
  - Animal: His name is Squirtle. He was born on Apr 2nd, 1993, and currently weighs -12.13kg. He was not neutered and he has tried to escape 3 times.
  - Animal: His name is Angemon. He was born on Jun 12th, 2005, and currently weighs -45kg. He is neutered and he has tried to escape once.
  - Animal: His name is Boarmon. He was born on Jun 7th, 2005, and currently weighs 20.4kg. He is neutered and he has tried to escape 7 times.
  - Animal: Her name is Blossom. She was born on Oct 13th, 1998, and currently weighs 17kg. She is neutered and she has tried to escape 3 times.
  - Animal: His name is Ditto. He was born on May 14th, 2022, and currently weighs 22kg. He is neutered and he has tried to escape 4 times.
- Remember to add these insertions to your `data.sql` file.

----

- Inside a transaction update the `animals` table by setting the `species` column to `unspecified`. Verify that change was made. Then roll back the change and verify that the `species` columns went back to the state before the transaction.
- Inside a transaction:
  - Update the `animals` table by setting the `species` column to `digimon` for all animals that have a name ending in `mon`.
  - Update the `animals` table by setting the `species` column to `pokemon` for all animals that don't have `species` already set.
  - Verify that changes were made.
  - Commit the transaction.
  - Verify that changes persist after commit.
- **Take a screenshot of the results of your actions.**
- Now, take a deep breath and... **Inside a transaction** delete all records in the `animals` table, then roll back the transaction.
- After the rollback verify if all records in the `animals` table still exists. After that, you can start breathing as usual ;) 
- **Take a screenshot of the results of your actions.**
- Inside a transaction:
  - Delete all animals born after Jan 1st, 2022.
  - Create a savepoint for the transaction.
  - Update all animals' weight to be their weight multiplied by -1.
  - Rollback to the savepoint
  - Update all animals' weights that are negative to be their weight multiplied by -1.
  - Commit transaction
- **Take a screenshot of the results of your actions.**
- Remember to add all these transactions to your `queries.sql` file.

----
- Write queries to answer the following questions:
  - How many animals are there?
  - How many animals have never tried to escape?
  - What is the average weight of animals?
  - Who escapes the most, neutered or not neutered animals?
  - What is the minimum and maximum weight of each type of animal?
  - What is the average number of escape attempts per animal type of those born between 1990 and 2000?
- **Take a screenshot of the results of your queries.**
- Remember to add these queries to your `queries.sql` file.
- Remember to add screenshots with the results of your queries and with the results of your play with transactions to your Pull Request description.

### Need a big picture?

Remind me about [the big picture of this project](./sneak_peek.md).


## Work and submission mode

- You should submit this activity **individually.**

## Code review

Follow [these steps](https://github.com/microverseinc/curriculum-transversal-skills/blob/main/code-review/articles/how_to_ask_for_a_code_review.md) to request a code review of your project.

## Submit your project

After the final approval from a code reviewer, you need to submit your project.
[Read this FAQ for a reminder on how to submit your project.](https://microverse.zendesk.com/hc/en-us/articles/360061344234)
Now go to your Student Dashboard and submit your project.

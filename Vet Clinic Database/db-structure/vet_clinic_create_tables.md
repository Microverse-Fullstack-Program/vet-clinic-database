# Vet clinic database: create animals table

## Learning objectives
- Create tables in SQL.
- Insert and query data in SQL.

### Estimated time: 1.25h

## Description
In this project, you will use a relational database to create the initial data structure for a vet clinic. You will create a table to store animals' information, insert some data into it, and query it.

*IMPORTANT NOTE: Read **all** requirements before you start building your project.*

### General requirements

- Make sure that you used the correct [Gitflow](https://github.com/microverseinc/curriculum-transversal-skills/blob/main/git-github/articles/gitflow.md).
- Make sure that you documented your work [in a professional way](https://github.com/microverseinc/curriculum-transversal-skills/blob/main/documentation/articles/professional_repo_rules.md).

### Project requirements
- Use [this template](https://github.com/microverseinc/curriculum-template-databases) to generate your repo.
- Create a database named `vet_clinic`.
- Create a table named `animals` with the following columns:
  - `id`: integer
  - `name`: string
  - `date_of_birth`: date
  - `escape_attempts`: integer
  - `neutered`: boolean
  - `weight_kg`: decimal
- Copy the SQL you used in the previous point into the `schema.sql` file in the generated repository.
- Insert the following data:
  - Animal: His name is Agumon. He was born on Feb 3rd, 2020, and currently weighs 10.23kg. He was neutered and he has never tried to escape.
  - Animal: Her name is Gabumon. She was born on Nov 15th, 2018, and currently weighs 8kg. She is neutered and she has tried to escape 2 times.
  - Animal: His name is Pikachu. He was born on Jan 7th, 2021, and currently weighs 15.04kg. He was not neutered and he has tried to escape once.
  - Animal: Her name is Devimon. She was born on May 12th, 2017, and currently weighs 11kg. She is neutered and she has tried to escape 5 times.
- Copy the SQL you used in the previous point into the `data.sql` file in the generated repository.
- Write queries for the following quests:
  - Find all animals whose name ends in "mon".
  - List the name of all animals born between 2016 and 2019.
  - List the name of all animals that are neutered and have less than 3 escape attempts.
  - List the date of birth of all animals named either "Agumon" or "Pikachu".
  - List name and escape attempts of animals that weigh more than 10.5kg
  - Find all animals that are neutered.
  - Find all animals not named Gabumon.
  - Find all animals with a weight between 10.4kg and 17.3kg (including the animals with the weights that equals precisely 10.4kg or 17.3kg)
- **Take a screenshot of the results of your queries.**
- Copy the SQL you used in the previous point into the `queries.sql` file in the generated repository.
- Remember to add the screenshot with the results of your queries to your Pull Request description.

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

# Vet clinic database: query multiple tables

## Learning objectives
- Use primary key & foreign key mechanism for joining tables.
- Query multiple tables.
- Prepare complex queries that answer analytical questions.

### Estimated time: 3h

## Description
In this project you will add some new tables and add foreign key columns to your existing `animals` table to model **one-to-many** relationships. Afterward, you will use `JOIN` to query the data.

*IMPORTANT NOTE: Read **all** requirements before you start building your project.*

### General requirements

- Make sure that you used correct ([Gitflow](https://github.com/microverseinc/curriculum-transversal-skills/blob/main/git-github/articles/gitflow.md)).
- Make sure that you documented your work [in a professional way](https://github.com/microverseinc/curriculum-transversal-skills/blob/main/documentation/articles/professional_repo_rules.md).

### Project requirements
- Create a table named `owners` with the following columns:
  - `id`: integer (set it as autoincremented PRIMARY KEY)
  - `full_name`: string
  - `age`: integer
- Create a table named `species` with the following columns:
  - `id`: integer (set it as autoincremented PRIMARY KEY)
  - `name`: string
- Modify `animals` table:
  - Make sure that id is set as autoincremented PRIMARY KEY
  - Remove column `species`
  - Add column `species_id` which is a foreign key referencing `species` table
  - Add column `owner_id` which is a foreign key referencing the `owners` table
- Remember all this goes in `schema.sql` file.
- Insert the following data into the `owners` table:
  - Sam Smith 34 years old.
  - Jennifer Orwell 19 years old.
  - Bob 45 years old.
  - Melody Pond 77 years old.
  - Dean Winchester 14 years old.
  - Jodie Whittaker 38 years old.
- Insert the following data into the `species` table:
  - Pokemon
  - Digimon
- Modify your inserted animals so it includes the `species_id` value:
  - If the name ends in "mon" it will be Digimon
  - All other animals are Pokemon
- Modify your inserted animals to include owner information (`owner_id`):
  - Sam Smith owns Agumon.
  - Jennifer Orwell owns Gabumon and Pikachu.
  - Bob owns Devimon and Plantmon.
  - Melody Pond owns Charmander, Squirtle, and Blossom.
  - Dean Winchester owns Angemon and Boarmon.
- Remember these insertions and modifications happen in `data.sql` file.
- Write queries (using `JOIN`) to answer the following questions:
  - What animals belong to Melody Pond?
  - List of all animals that are pokemon (their type is Pokemon).
  - List all owners and their animals, remember to include those that don't own any animal.
  - How many animals are there per species?
  - List all Digimon owned by Jennifer Orwell.
  - List all animals owned by Dean Winchester that haven't tried to escape.
  - Who owns the most animals?
- Remember all these should be written in `queries.sql` file.
- **Take a screenshot of the results of your queries.**
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

# Project 10: Web Scraping and Data Cleaning

**Points:** 25 | **Estimated time:** 2.5–3.5 hours

Scrape the Wikipedia **Highest-grossing films** table, clean its text and
numeric values, and prepare a tibble for analysis.

## Get started

- Accept Project 10 through the **Classroom 50 link in Blackboard**.
- On your assignment repository's GitHub page, choose **Code → HTTPS** and copy the repository URL.
- In RStudio Desktop, choose **File → New Project → Version Control → Git**.
  Paste the URL, choose your usual course folder, and create the project.
- Open **Project10.R** and complete every TODO. Review the rubric before coding.

Required packages: **tidyverse**, **rvest**, and **janitor**. Install missing
packages in the Console; keep installation commands out of your submitted script.

## Your work

- Read the [Wikipedia page](https://en.wikipedia.org/wiki/List_of_highest-grossing_films).
- Identify and extract the table in the **Highest-grossing films** section.
- Use rvest, janitor, dplyr, and stringr to clean it. Inspect failed numeric
  conversions before deciding whether a row should be removed.
- Create **movies_clean_final** with exactly these columns, in this order:

| Column | Requirement |
| --- | --- |
| `rank` | Film ranking from the source table |
| `title` | Readable title without unwanted annotations |
| `year` | Release year |
| `worldwide_gross` | Numeric amount in US dollars |
| `peak` | Highest position reached in this ranking; annotations removed; text or numeric |

- Inspect the intermediate data as directed in the script and confirm that
  `worldwide_gross` is numeric. Investigate conversion warnings or unexpected
  missing gross values, and explain any rows you remove.
- Display the first 10 rows and answer **all five reflection questions** in the script.
- Include brief comments explaining the main scraping and cleaning decisions.

Use the demo and DataCamp exercises as references. The live page can change:
inspect the table and column names rather than copying a table number blindly.
`html_elements()` is the current name for the older `html_nodes()`; either is
acceptable. Use `html_table()` without `fill = TRUE`.

## Submit

- Restart R and run your completed script from top to bottom.
- In RStudio's Git tab, stage **Project10.R**, commit it with a meaningful
  message, and push. Verify that the completed file appears on GitHub.
- Submit your **GitHub assignment repository URL** in Blackboard.

See Blackboard for the due date and rubric. If you get stuck, commit and push
your current work, then contact your instructor with the error and repository link.

###############################################
# Week 10 Project: Web Scraping with rvest + tidyverse
# Dataset: Highest-Grossing Films (Wikipedia)
#
# URL:
# https://en.wikipedia.org/wiki/List_of_highest-grossing_films
#
# Your job:
# 1. Scrape the "highest-grossing films" table from Wikipedia
# 2. Clean it into an analysis-ready tibble
# 3. Return a final data frame with cleaned columns:
#    - rank
#    - title
#    - year
#    - worldwide_gross  (numeric)
#    - peak             (cleaned)
#
# You are expected to:
# - Use rvest (read_html, html_nodes, html_table)
#   html_elements() is the current name for html_nodes(); either is fine.
# - Add brief comments explaining your main cleaning steps.
# - Use janitor::clean_names()
# - Use dplyr (filter, mutate, select)
# - Use stringr::str_replace_all() to remove junk like [1] and "$"
###############################################


#############################
# 0. Load packages
#############################

library(tidyverse)  # dplyr, stringr, pipes, etc.
library(rvest)      # web scraping

# janitor::clean_names() will turn messy column names like
# "Worldwide gross" into world_friendly versions like "worldwide_gross".
# This lets you refer to columns with snake_case instead of spaces.
library(janitor)


#############################
# 1. Read the web page
#############################

# TODO:
# - Save the URL of the Wikipedia page as a variable called `url`
# - Use read_html() to download the page into an object called `page`




#############################
# 2. Extract the table
#############################

# The page contains multiple HTML tables. You only want the one
# with the worldwide grosses for individual films, under the heading
# "Highest-grossing films" (not the inflation-adjusted table).
#
# TODO:
# - Use html_nodes() to grab all tables with the CSS class "wikitable"
#   Hint: Use the CSS selector "table.wikitable".
#
# - Store that list in a variable called `tables`
#
# - Check how many tables were found:
#   length(tables)
#
# - Pick the correct table and convert it to a data frame:
#   html_table()
#
# - Immediately pipe that into clean_names() from janitor
#
# - Store the result in a tibble called `raw_movies`
#
# - Use head(raw_movies) to inspect it in the console
#
# QUESTIONS (answer in comments):
# - Which column is the movie title?
# - Which column is the worldwide gross revenue?
# - Which column is the year?
# - Which column is "peak"?
#   (This tells you how high the movie ever ranked at the worldwide box office.)
#
# NOTE:
# The exact column names depend on what clean_names() does.
# You must look at them and use those names in your code below.
# Do NOT assume the names from class will match exactly.


#############################
# 3. Clean rows and text
#############################

# GOAL:
# Build an intermediate tibble called movies_clean_step1
# where you have:
# - only real film rows (no blank rows / notes)
# - cleaned text columns (no [1] style citations)
#
# REQUIRED CLEANUP:
#   A. Keep only rows where the film title column is not missing
#      and not just "".
#
#   B. Inspect and remove citation/annotation markers, such as [1],
#      [N 1], or †, where they occur in:
#      - the film title column
#      - the worldwide gross column
#      - the peak column
#
#
#      Preserve the actual title text and numeric values. Marker formats
#      can vary, so inspect your scraped data before choosing a pattern.
#
#   C. Trim extra spaces with str_trim().
#
# TODO:
# - Create movies_clean_step1 from raw_movies.
# - Use filter() and mutate() to apply the cleaning requirements above.
#
# - After you create movies_clean_step1, run head(movies_clean_step1)
#   to verify that:
#   - titles look clean (no [1])
#   - peak looks clean (no [2])
#   - worldwide_gross still has $ and commas for now (we'll fix next)


#############################
# 4. Clean numeric money
#############################

# GOAL:
# Create movies_clean_step2 where the worldwide gross column is usable
# as a number.
#
# REQUIRED CLEANUP FOR worldwide_gross:
#   - Remove "$" and "," characters
#     Hint: Use str_replace_all() with a pattern you write.
#
#   - Convert worldwide gross to numeric
#     Hint: as.numeric()
#
#   - If conversion produces NA, inspect the original value first.
#     Correct any remaining text-cleaning problems. Remove a row only
#     if you confirm it is a note/header rather than a film; explain why.
#
# TODO:
# - Start from movies_clean_step1
# - Use mutate() to:
#     1. strip $ and , out of worldwide_gross,
#     2. convert it to numeric.
# - Investigate any conversion warnings or NA values before continuing.
#
# - Save the result as movies_clean_step2
#
# - After you create movies_clean_step2,
#   run summary(movies_clean_step2$worldwide_gross)
#   to inspect the values. Use is.numeric(movies_clean_step2$worldwide_gross)
#   to confirm the column is numeric.


#############################
# 5. Final select / rename
#############################

# GOAL:
# Produce your final cleaned tibble called movies_clean_final.
#
# REQUIREMENTS:
# - movies_clean_final MUST include ALL of the following columns,
#   cleaned and human-readable:
#
#   - rank                (the film ranking; rename to rank if needed)
#   - title               (movie title)
#   - year                (release year)
#   - worldwide_gross     (numeric, no "$", no ",", no [1])
#   - peak                (text or numeric, but cleaned of [1] etc.)
#
# NOTE: You may need to rename columns here to match those exact names.
# For example, if the scraped data uses `worldwide_gross_usd` or `worldwide`, 
# rename it to `worldwide_gross` in this step.
#
# HINTS:
# - Use select() to keep only the columns you want.
# - select() can also rename columns as you select them.
#
# - If "peak" came through as something like `peak` or `peak_pos`,
#   make sure you include it and it's already cleaned of [1] etc.
#
# TODO:
# - Create movies_clean_final from movies_clean_step2
# - Use mutate() if you still need to final-clean `peak`
#   (for example, trim whitespace, remove footnotes)
# - Then select()/rename the 5 required columns
#
# - After you create movies_clean_final:
#   head(movies_clean_final, 10)


#############################
# 6. Reflection / Short Answers
#############################

# In comments below, answer ALL of the following based on movies_clean_final:
#
# 1. Which film has the highest worldwide gross?
# 2. What year was that film released?
# 3. What is its worldwide gross value (as a number)?
#
# 4. In your own words: what does the "peak" column represent?
#   
#
# 5. Name one remaining data-quality concern.

#
# ↓ Your answers here ↓







###############################################
# END OF ASSIGNMENT
#
# When you submit:
# - Your script should run top-to-bottom with no errors.
# - By the end, you must have an object called movies_clean_final.
# - Display head(movies_clean_final, 10) and answer all five questions.
# - Commit and push Project10.R; submit the repository URL in Blackboard.
# - Review the rubric before submitting. Live rankings/totals may change.
###############################################

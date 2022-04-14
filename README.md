# Bookmark Challenge

## Task

We have been tasked to create a Bookmark Manager that will allow users to manage their own bookmarks by creating, adding, deleting or updating them. 

## User Stories
```
As a user
So that I can easily access the websites I use regularly
I would like to see a list of bookmarks

As a user
So that I can easily save the websites I use regularly
I would like to add to my list of bookmarks

As a user
So that I am able to remove websites I no longer use
I would like to delete from my list of bookmarks
```

## Domain Model

![Screenshot](https://i.imgur.com/orPPPo0.png)          


## Database Setup

Connect to `psql` in terminal, then use the command `CREATE DATABASE bookmark_manager;`. Connect to the database using `\c bookmark_manager;` and finally run the query that is saved in the file `01_create_bookmarks_table.sql`. Then, run the query in the file `02_add_title_to_bookmarks.sql` in order to add the title column to the table.

## Test Database Setup

Connect to `psql` in terminal, then use the command `CREATE DATABASE bookmark_manager_test;`. Connect to the database using `\c bookmark_manager_test;` and finally run the query that is saved in the file `01_create_bookmarks_table.sql`. Then, run the query in the file `02_add_title_to_bookmarks.sql` in order to add the title column to the table.


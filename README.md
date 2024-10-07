# README

It's [dinner time](https://dinnertime-red-grass-2479.fly.dev/) ! This application helps users find the most relevant recipes that they can prepare with the ingredients that they have at home. Created as part of a job interview at PENNYLANE 😎


# USER STORIES
*   As a user, I seek results that are presented in a clear and accessible manner, avoiding overwhelming numbers
*   As a user I want to get recipes that include the ingredients: bananas, apples, flour
*   As a user I want inspiration from random recipes

# Local Setup
* Ruby version ruby-3.3.1
* run rails db:seed from terminal

# DB Structure
  This app contains only one table, `recipes` which has the following columns:
    `string "title",
    integer "cook_time",
    integer "prep_time",
    integer "rating",
    string "image",
    datetime "created_at",
    datetime "updated_at",
    string "ingredients"`

    
    `
  





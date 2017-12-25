# README

# Routes
|HTTP Verb|Path|Controller#Action|Used for|
|---|---|---|---|
|GET|/books|books#index|display a list of all books|
|GET|/books/new|books#new|return an HTML form for creating a new book|
|POST|/books|books#create|create a new book|
|GET|/books/:id|books#show|display a specific book|
|GET|/books/:id/edit|books#edit|return an HTML form for editing a book|
|PUT|/books/:id|books#update|update a specific book|
|DELETE|/books/:id|books#destroy|delete a specific book|

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

# Ceylon + jOOQ example

This sample project shows how you can use jOOQ in your Ceylon project.

## Requirements

- [Ceylon 1.3.2](https://ceylon-lang.org/download/)
- A MySQL database named `sakila`, that you can create using [these SQL files](http://downloads.mysql.com/docs/sakila-db.zip)

## Structure

jOOQ's [code generator](https://www.jooq.org/doc/3.9/manual/code-generation/codegen-configuration/) was
used to create a Java model representing all the tables. This model is stored in
a Ceylon module under `gen-source/gen.example.jooq`.

The actual demo is located under `source/example.jooq`. It uses jOOQ's generated classes
to query the `sakila` database, then prints the result in the console.

## Building and running

* `ceylon compile`
* `ceylon run example.jooq`
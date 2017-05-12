# Ceylon + jOOQ example

This sample project shows how you can use jOOQ in your Ceylon 
project.

## Requirements

- [Ceylon 1.3.2][] and Java 8.
- A MySQL database named `sakila`, that you can create using 
  these [SQL files][].
  
[Ceylon 1.3.2]: https://ceylon-lang.org/download/
[SQL files]: http://downloads.mysql.com/docs/sakila-db.zip

## Structure

jOOQ's [code generator][] was used to create a Java model 
representing all the tables. The model was generated into 
the Ceylon module `gen.example.jooq` in the `gen-source`
directory.

The actual demo module `example.jooq` is located in the
directory `source/`. It uses jOOQ's generated classes to 
query the `sakila` database, then prints the result.

[code generator]: https://www.jooq.org/doc/3.9/manual/code-generation/codegen-configuration/

## Building and running

Compile the code by typing:

    ceylon compile

Then run the example with:

    ceylon run example.jooq
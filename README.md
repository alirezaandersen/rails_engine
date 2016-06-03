# Rails Engine

The Rails Engine project takes in CSV data from the [Black Thursday repo](https://github.com/turingschool/curriculum/blob/master/source/projects/black_thursday.markdown)
and creates a RESTful Rails API that includes record endpoints, relationship endpoints,
and business intelligence endpoints.

## Getting Started

Clone down the repo:

```bash
  $ git clone https://github.com/alirezaandersen/rails_engine.git
```

Then change into the project directory:

```bash
  $ cd rails_engine
```

### Installing

Let's go ahead and get the database setup:

```bash
  $ rake db:setup
```

Then import the CSV data:

```bash
  $ rake import:all
```

There is also the option to import only specific subsets of the CSV data:

```bash
$ rake import:customers
$ rake import:invoice_items
$ rake import:invoices
$ rake import:items
$ rake import:merchants
$ rake import:transactions
```

Once the rake task is complete, go ahead and run the test suite to confirm that setup was completed successfully:

```bash
  $ rspec
```

To hit our API endpoints let us start up a server:

```bash
  $ rails s
```

## Running the tests

Rails Engine uses RSpec for its test suite. To run the tests:

```bash
  $ rspec
```

## Authors

* **Alireza Andersen** - *Initial work* - [Ali Andersen](https://github.com/alirezaandersen)

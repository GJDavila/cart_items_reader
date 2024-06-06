# Cart Items

## Overview

This project is a Ruby application that reads input files containing shopping cart items, processes them, and calculates the total cost of the items along with the total amount of sales taxes paid.

## Dependencies

- Ruby (version 3.2.2 recommended)
- Mocha gem for running unit tests (`gem install mocha`)

## Project Structure

The project follows a structured organization:

- **classes:** Contains the `Item` and `CartItems` classes, which manage the information of individual items and the shopping cart, respectively.
- **services:** Includes the `CartItemsReaderService` class, responsible for reading input files, creating items, and adding them to the cart.
- **tests:** Contains the unit tests for the `CartItemsReaderService` class to validate specific scenarios outlined in the challenge.
- **app.rb:** Entry point for executing the challenge cases and testing different use cases.

## Usage

To use the application:

1. Make sure Ruby and the Mocha gem are installed.
2. Run the following command to execute the challenge cases:

```bash
ruby app.rb
```
3. Run the following command to execute the unit tets:
```bash 
ruby tests/cart_items_reader_service_test.rb
```

# Inventory Management System

## Overview

This project implements an Inventory Management System with a focus on sales tracking, inventory monitoring, and automated notifications for restocking products.

## Features

- **Product Management:** Includes product details (name, price).
- **Sales Tracking:** Tracks orders and calculates the total quantity sold per month per product.
- **Inventory Management:** Monitors stock levels for each product.
- **Restock Notification:** Automatically logs a notification in the `restock_log` table when inventory falls below a threshold.
- **Triggers:** Includes triggers to prevent negative stock levels and log restock notifications.

## Table Schemas

The system includes the following tables:

- **products**: Stores information about products.
- **orders**: Records each order placed for products.
- **inventory**: Tracks the stock levels of products.
- **restock_log**: Logs notifications when a product’s stock level is below a threshold.

## Setup

To set up the database, execute the SQL scripts in the following order:

1. `create_tables.sql`: Creates the database schema.
2. `insert_sample_data.sql`: Inserts sample data into the tables.
3. `create_triggers.sql`: Creates triggers for stock management and restock notifications.
4. `queries.sql`: Contains queries for monthly sales data.

## How to Run the Queries

After setting up the database, you can run the queries to fetch sales data, monitor inventory levels, and receive restock notifications. Use the provided `queries.sql` for calculating monthly sales, viewing inventory details, and generating reports.

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for more details.

# Database Design
## This repo is setup so that we can test our database

This document outlines the database design for the SaaS backend project. The database schema consists of four main tables: `User`, `Merchant`, `Service`, and `Booking`.


## Prerequisites

1. Install PostgreSQL on your system. Follow the installation instructions for your platform:
   - [macOS](https://www.postgresql.org/download/macosx/)
   - [Windows](https://www.postgresql.org/download/windows/)
   - [Linux](https://www.postgresql.org/download/linux/)
2. Install a PostgreSQL client to interact with the database, such as [pgAdmin](https://www.pgadmin.org/download/) or [DBeaver](https://dbeaver.io/download/).

## Creating a PostgreSQL Database

1. Open a terminal or command prompt.
2. Start the PostgreSQL interactive terminal by running the following command:


## Table Descriptions

### User

The `User` table stores information about the users of the application. 

| Column          | Type   | Description                        |
|-----------------|--------|------------------------------------|
| id              | int    | Primary key for the user           |
| first_name      | string | First name of the user             |
| last_name       | string | Last name of the user              |
| email_address   | string | Email address of the user          |
| current_address | string | Current address of the user        |
| identity_number | string | Unique identity number of the user |
| hashed_password | string | Hashed password of the user        |

### Merchant

The `Merchant` table stores information about the merchants that provide services in the application.

| Column      | Type   | Description                            |
|-------------|--------|----------------------------------------|
| id          | int    | Primary key for the merchant           |
| name        | string | Name of the merchant                   |
| description | string | Description of the merchant's services |
| address     | string | Address of the merchant                |

### Service

The `Service` table stores information about the individual services provided by merchants.

| Column      | Type   | Description                       |
|-------------|--------|-----------------------------------|
| id          | int    | Primary key for the service       |
| name        | string | Name of the service               |
| description | string | Description of the service        |
| price       | float  | Price of the service              |
| merchant_id | int    | Foreign key referencing Merchant  |

### Booking

The `Booking` table stores information about bookings made by users for specific services.

| Column     | Type  | Description                        |
|------------|-------|------------------------------------|
| id         | int   | Primary key for the booking        |
| user_id    | int   | Foreign key referencing User       |
| service_id | int   | Foreign key referencing Service    |
| start_time | datetime | Start time of the booked service |
| end_time   | datetime | End time of the booked service   |
| status     | string | Status of the booking             |

## Relationships

- A `User` can have multiple `Booking` records.
- A `Merchant` can have multiple `Service` records.
- A `Service` can have multiple `Booking` records.
- A `Booking` is associated with one `User` and one `Service`.

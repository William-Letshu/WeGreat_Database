# Database Design
## This repo is setup so that we can test our database

This document outlines the database design for the SaaS backend project. The database schema consists of several tables including `users`, `merchants`, `services`, `bookings`, `conversations`, `messages`, `stories`, `skills`, `merchant_skills`, and `service_images`.

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

### Users

The `Users` table stores information about the users of the application. 

| Column | Type | Description |
|---|---|---|
| id | SERIAL | Primary key for the user |
| username | VARCHAR | Username of the user |
| email | VARCHAR | Email address of the user |
| password | VARCHAR | Hashed password of the user |
| first_name | VARCHAR | First name of the user |
| second_names | VARCHAR | Middle name(s) of the user |
| surname | VARCHAR | Last name of the user |
| identity_document | VARCHAR | Unique identity document of the user |
| verified | BOOLEAN | Verification status of the user |
| dob | DATE | Date of birth of the user |
| phone_number | VARCHAR | Phone number of the user |
| verification_code | VARCHAR | User's verification code |
| password_reset_code | VARCHAR | User's password reset code |
| disabled | BOOLEAN | Whether the user account is disabled |
| profile_picture | VARCHAR | URL to the user's profile picture |
| merchant_id | INTEGER | ID of the merchant related to the user|

### Merchants

The `Merchants` table stores information about the merchants that provide services in the application.

| Column | Type | Description |
|---|---|---|
| id | SERIAL | Primary key for the merchant |
| username | VARCHAR | Username of the merchant |
| email | VARCHAR | Email address of the merchant |
| password | VARCHAR | Hashed password of the merchant |
| first_name | VARCHAR | First name of the merchant |
| second_names | VARCHAR | Middle name(s) of the merchant |
| surname | VARCHAR | Last name of the merchant |
| description | TEXT | Description of the merchant's services |
| police_clearance | BOOLEAN | Whether the merchant has police clearance |
| verified | BOOLEAN | Verification status of the merchant |
| dob | DATE | Date of birth of the merchant |
| phone_number | VARCHAR | Phone number of the merchant |
| verification_code | VARCHAR | Merchant's verification code |
| password_reset_code | VARCHAR | Merchant's password reset code |
| profile_picture | VARCHAR | URL to the merchant's profile picture |
| user_id | INTEGER | ID of the user related to the merchant |
| location | VARCHAR | Location of the merchant |

### Services

The `Services` table stores information about the individual services provided by merchants.

| Column | Type | Description |
|---|---|---|
| id | SERIAL | Primary key for the service |
| merchant_id | INTEGER | ID of the merchant that provides the service |
| service_name | VARCHAR | Name of the service |
| description | TEXT | Description of the service |
| price | DECIMAL | Price of the


## Docker Container

Once you've started Docker then run the following commands:

```bash

docker build -t saas_db_image .
docker run --name saas_db_container -d saas_db_image

```

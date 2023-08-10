# School Donations

School Donations is an academic project for the course [SOEN 363: Data Systems for Software Engineers](https://www.concordia.ca/academics/undergraduate/calendar/current/section-71-gina-cody-school-of-engineering-and-computer-science/section-71-70-department-of-computer-science-and-software-engineering/section-71-70-10-computer-science-and-software-engineering-courses.html#3708). Worked in a team of 4 to create a PostgreSQL and a BigQuery database. 

## Introduction
The goal of this project is to test the efficiency of SQL (PostgreSQL) and NoSQL (BigQuery). We created two databases, a PostgreSQL database, and a BigQuery database, and used the same dataset for both of them.

Tables needed for this project:
- Schools
- Teachers
- Donors
- Projects
- Donations
- Resources


## What is Big Query?
Google BigQuery has a good balance between availability and consistency. It is an enterprise data warehouse that:
- Helps manage and analyze data with built-in features
- Uses SQL queries
- Separates data from storage to maximize flexibility

You can find more about BigQuery [here](https://cloud.google.com/bigquery).

## Data
We have created an ER diagram to represent the attributes and connections between tables.
![ER diagram](https://github.com/Abdullah1tani/School-donations/assets/98557354/6154fe71-85ea-40b3-9921-4affd3d5fdf3)

In order to get the data that was used to test out these queries:
1  -  Visit [Kaggle School Donations dataset](https://www.kaggle.com/datasets/perkymaster/school-donations).
2  -  Scroll down until you reach the `Donations.csv` table
3  -  Choose which table you would like to download its data
<img width="676" alt="Donations csv" src="https://github.com/Abdullah1tani/School-donations/assets/98557354/507bdf45-c54b-4d3b-aae4-435328238c43">
4  -  Click on the download icon to download the data for the specified table
<img width="676" alt="Donations csv (download icon)" src="https://github.com/Abdullah1tani/School-donations/assets/98557354/10facf18-07fb-4c41-bd7c-c12ea2f7798a">



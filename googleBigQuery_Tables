CREATE TABLE civil-being-370801.donors(
donor_id string(50),
city string(50),
state string(50),
is_teacher string(10),
zip int
);

CREATE TABLE civil-being-370801.tables.teachers(
teacher_id string(50),
prefix string(50),
first_project_date DATE
);

CREATE TABLE civil-being-370801.tables.Schools(
school_id string(50),
name string(100),
metro_type string(50),
free_lunch_percent int,
state string(50),
zip string(10),
city string(50),
county string(50),
district string(100)
);

CREATE TABLE civil-being-370801.tables.projects(
project_id string(50),
school_id string(50) NOT NULL,
teacher_id string(50) NOT NULL,
teacher_project_seq INT,
type string(50),
title string(100),
essay string,
description string,
need_statement string,
subject_category_tree string(50),
subject_subcategory_tree string(50),
grade_level_category string(50),
resource_category string(50),
cost numeric,
date_posted DATE,
expiration_date DATE,
status string(50),
fully_funded_date DATE
);

CREATE TABLE civil-being-370801.tables.donations(
project_id string(50) NOT NULL,
donation_id string(50),
donor_id string(50) NOT NULL,
includes_optional string(10),
amount numeric,
donor_cart_seq int,
received_on TIMESTAMP,
);

CREATE TABLE civil-being-370801.tables.resources(
  	project_id string(50),
  	name string(500),
  	Quantity int,
unit_price numeric,
vendor_name string(100)
);

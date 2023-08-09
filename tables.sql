CREATE TABLE Donors(donor_id CHAR(50),
          	city CHAR(50),
          	state CHAR(50),
          	is_teacher CHAR(10),zip INT,PRIMARY KEY (donor_id)
);

CREATE TABLE Teachers(
          	teacher_id CHAR(50),
          	prefix CHAR(50),
          	first_project_date DATE,
          	PRIMARY KEY (teacher_id)
);

CREATE TABLE Schools (
          	school_id CHAR(50),
          	name CHAR(100),
          	metro_type CHAR(50),
          	free_lunch_percent INT,
          	state CHAR(50),
          	zip CHAR(10),
          	city CHAR(50),
          	county CHAR(50),
          	district CHAR(100),
          	PRIMARY KEY (school_id)
);

CREATE TABLE Projects(
          	project_id CHAR(50),
          	school_id CHAR(50) NOT NULL,
          	teacher_id CHAR(50) NOT NULL,
          	teacher_project_seq INT,
          	type CHAR(50),
          	title CHAR(100),
          	essay VARCHAR,
          	description VARCHAR,
          	need_statement VARCHAR,
          	subject_category_tree CHAR(50),
          	subject_subcategory_tree CHAR(50),
          	grade_level_category CHAR(50),
          	resource_category CHAR(50),
          	cost REAL,
          	date_posted DATE,
          	expiration_date DATE,
          	status CHAR(50),
          	fully_funded_date DATE,
          	PRIMARY KEY (project_id),
          	FOREIGN KEY (school_id) REFERENCES Schools
ON DELETE CASCADE,
          	FOREIGN KEY (teacher_id) REFERENCES Teachers
                                       	ON DELETE CASCADE
);
 
CREATE TABLE Donations(
	project_id CHAR(50) NOT NULL,
	donation_id CHAR(50),
	donor_id CHAR(50) NOT NULL,
	includes_optional CHAR(10),
	amount REAL,
	donor_cart_seq INT,
	received_on TIMESTAMP,
	PRIMARY KEY (donation_id),
	FOREIGN KEY (project_id) REFERENCES Projects
                      ON DELETE CASCADE,
	FOREIGN KEY (donor_id) REFERENCES Donors
                      ON DELETE CASCADE
);

CREATE TABLE Resources(
	project_id CHAR(50),
	name CHAR(500),
	quantity INT,
	unit_price REAL,
	vendor_name CHAR(100),
	PRIMARY KEY (project_id, name),
	FOREIGN KEY (project_id) REFERENCES projects
                      ON DELETE CASCADE
);

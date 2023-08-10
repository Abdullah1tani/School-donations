-- Find out which projects required the greatest number of distinct resources (top 10)
SELECT P.project_id, P.title, COUNT(DISTINCT R.name) AS nbr_resources
FROM tables.projects P, tables.resources R
WHERE P.project_id = R.project_id
GROUP BY P.project_id, P.title
ORDER BY nbr_resources DESC
LIMIT 10;
  
--Highest cost per category
SELECT P.subject_category_tree, max(P.cost) AS cost
FROM tables.projects P
GROUP BY P.subject_category_tree
ORDER BY cost DESC;

--Which category has the highest donations
SELECT P.subject_category_tree, SUM(D.amount) AS DonationAmount
FROM tables.projects P, tables.donations D
WHERE P.project_ID=D.project_ID
GROUP BY P.subject_category_tree
ORDER BY DonationAmount DESC;

--Donor who has donated to the most projects
SELECT d.donor_id, COUNT(D.donor_id) AS Donations
FROM tables.donations D
GROUP BY D.donor_id
ORDER BY Donations DESC;

--Amount of donors who are also a teacher by state
SELECT d.state, COUNT(d.donor_id) AS Teachers
FROM tables.donors d
WHERE d.is_teacher='Yes'
GROUP BY d.state
ORDER BY Teachers DESC;

--Subject category with the most resources
SELECT P.subject_category_tree, SUM(R.quantity) AS Resources
FROM tables.projects P, tables.resources R
WHERE P.project_ID=R.project_id
GROUP BY P.subject_category_tree
ORDER BY Resources DESC;

--Fully funded projects and their profits
SELECT P.project_id, SUM(D.amount) AS Donations, P.cost
FROM tables.projects P, tables.donations D
WHERE P.status='Fully Funded' AND P.project_ID=D.project_id
GROUP BY P.project_id, P.cost
ORDER BY Donations DESC;

--Teachers that manages the most projects
SELECT P.Teacher_ID, COUNT(P.project_ID) AS Projects
FROM tables.projects P
GROUP BY P.Teacher_ID
HAVING COUNT(P.project_ID) > 1
ORDER BY Projects DESC;

--Donations received in 2013 at Schools in California
SELECT D.donation_id, D.received_on
FROM tables.donations D
WHERE D.received_on >= '2013-01-01' AND D.received_on < '2014-01-01' AND 
D.project_id IN (SELECT P.project_ID
                    FROM tables.projects P
                    WHERE P.school_id IN (SELECT S.school_id
                                          FROM tables.schools S
                                          WHERE S.state = 'California'))
ORDER BY D.received_on ASC;

--Fully funded projects and the amount of donations received compared to the length of the project
SELECT P.project_id, P.expiration_date - P.date_posted AS project_length, D.amount
FROM tables.projects P INNER JOIN tables.donations D ON P.project_ID=D.project_id
WHERE P.status = 'Fully Funded'
GROUP BY P.project_ID, P.expiration_date, P.date_posted, D.amount
ORDER BY D.amount DESC NULLS LAST;

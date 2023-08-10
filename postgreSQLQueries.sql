-- Goal: Find out which states have the most generous donors (top 5).
SELECT G.state, SUM(D.amount) AS total_donation
FROM Donors G, Donations D
WHERE G.donor_id = D.donor_id
GROUP BY G.state
ORDER BY total_donation DESC
LIMIT 5;

-- Goal: Find out the average donation amount for different donor types (teacher/not teacher)
SELECT G.is_teacher, AVG(D.amount) AS avg_donation
FROM Donors G, Donations D
WHERE G.donor_id = D.donor_id
GROUP BY G.is_teacher;

-- Goal: Find out which states have most of their teachers identifying as women.
CREATE VIEW women_teachers_per_state AS
	SELECT S.state, COUNT(T.teacher_id) AS nbr_teachers
	FROM Schools S, Projects P, Teachers T
	WHERE T.prefix = 'Mrs.' AND
      	T.teacher_id = P.teacher_id AND
      	P.school_id = S.school_id
	GROUP BY S.state;
CREATE VIEW non_women_teachers_per_state AS
	SELECT S.state, COUNT(T.teacher_id) AS nbr_teachers
	FROM Schools S, Projects P, Teachers T
	WHERE T.prefix <> 'Mrs.' AND
      	T.teacher_id = P.teacher_id AND
      	P.school_id = S.school_id
	GROUP BY S.state;
SELECT W.state, W.nbr_teachers AS women_teachers, NW.nbr_teachers AS non_women_teachers
FROM women_teachers_per_state W, non_women_teachers_per_state NW
WHERE W.state = NW.state AND
  	W.nbr_teachers > NW.nbr_teachers
ORDER BY W.nbr_teachers DESC;

-- Goal: Find out which states have the most expensive projects in average(top 5).
SELECT S.state, AVG(P.cost) AS total_cost
FROM Schools S, Projects P
WHERE S.school_id = P.school_id
GROUP BY S.state
ORDER BY total_cost DESC
LIMIT 5;

-- Goal: Find out which states have their projects expire the most before they are fully funded (top 5).
SELECT S.state, COUNT(P.project_id) AS nbr_expired_projects
FROM Schools S, Projects P
WHERE P.status = ‘Expired’ AND S.school_id = P.school_id
GROUP BY S.state
ORDER BY nbr_expired_projects DESC
LIMIT 5;

-- Goal: Find out which projects required the greatest number of distinct resources (top 10).
SELECT P.project_id, P.title, COUNT(DISTINCT R.name) AS nbr_resources
FROM Projects P, Resources R
WHERE P.project_id = R.project_id
GROUP BY P.project_id, P.title
ORDER BY nbr_resources DESC
LIMIT 10;

-- Goal: Find out which schools received the most money in total from donations (top 10).
SELECT S.school_id, S.name, SUM(D.amount) AS total_donations
FROM Schools S, Projects P, Donations D
WHERE D.project_id = P.project_id AND
        	P.school_id = S.school_id
GROUP BY S.school_id, S.name
ORDER BY total_donations DESC
LIMIT 10;

-- Goal: Find out what is the price of the most expensive resource for each state that their schools required for a project.
SELECT S.state, MAX(R.unit_price) AS max_cost
FROM Schools S, Projects P, Resources R
WHERE S.school_id = P.school_id AND P.project_id = R.project_id
GROUP BY S.state
ORDER BY max_cost DESC;

-- Goal: Find out which projects had the biggest number of donors (top 10).
SELECT P.project_id, P.title, Count(G.donor_id) AS nbr_donors
FROM Projects P, Donations D, Donors G
WHERE P.project_id = D.project_id AND D.donor_id = G.donor_id
GROUP BY P.project_id, P.title
ORDER BY nbr_donors DESC
LIMIT 10;

-- Goal: Find out top 10 projects that lasted the longest but still expired. (top 10)
SELECT P.project_id, P.title, P.expiration_date - P.date_posted AS project_length
FROM Projects P
WHERE P.status = 'Expired'
ORDER BY project_length DESC NULLS LAST, P.title
LIMIT 10;

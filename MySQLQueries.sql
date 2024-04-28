-- QUERY 1 Retrieve all authors in questions that have a specific sequence of characters in their ID → Starts with the letter ‘a’
SELECT questions_author_id 
FROM `first schema`.questions
WHERE questions_author_id LIKE 'a%';

-- QUERY 2 Return all the professionals that belong the industry “Information Technology and Services”
SELECT *
FROM `first schema`.professionals
WHERE professionals_industry = 'Information Technology and Services';

-- QUERY 3 Return all the students that are in a common location → Atlanta, Georgia
SELECT * 
FROM `first schema`.students
WHERE students_location='Atlanta, Georgia';

-- QUERY 4 Looking for the questions with answers recursively many times?
WITH RECURSIVE answer_replies AS(
SELECT answers_id, answers_author_id,
answers_question_id, answers_date_added,
answers_body
FROM answers WHERE answers_question_id
IS not null UNION all
SELECT a.answers_id, a.answers_author_id,
a.answers_question_id, a.answers_date_added,
a.answers_body
FROM answers a
INNER JOIN answer_replies ar ON ar.answers_id =
a.answers_question_id )
SELECT * FROM answer_replies ar
LEFT JOIN questions q ON ar.answers_question_id =
q.questions_id;

-- QUERY 5 Looking for questions with answers recursively twice?
WITH RECURSIVE answer_replies AS(
SELECT 1 as level,answers_id, answers_author_id,
answers_question_id, answers_date_added,
answers_body
FROM answers WHERE answers_question_id
IS not null UNION all
SELECT level+1, a.answers_id,
a.answers_author_id, a.answers_question_id,
a.answers_date_added, a.answers_body
FROM answers a
INNER JOIN answer_replies ar ON
ar.answers_id = a.answers_question_id
WHERE level <=2)
SELECT * FROM answer_replies ar
LEFT JOIN questions q ON
ar.answers_question_id = q.questions_id;

-- QUERY 6 Looking for questions with answers recursively 3 times?
WITH RECURSIVE answer_replies AS(
SELECT 1 as level,answers_id, answers_author_id,
answers_question_id, answers_date_added,
answers_body
FROM answers WHERE answers_question_id
IS not null UNION all
SELECT level+1, a.answers_id,
a.answers_author_id, a.answers_question_id,
a.answers_date_added, a.answers_body
FROM answers a
INNER JOIN answer_replies ar ON
ar.answers_id = a.answers_question_id
WHERE level <=3)
SELECT * FROM answer_replies ar
LEFT JOIN questions q ON
ar.answers_question_id = q.questions_id;

-- QUERY 7 Count the number of professionals who answered the questions.
SELECT count(professionals_id)
FROM professionals p JOIN answers a ON p.professionals_id = a.answers_author_id;

-- QUERY 8 Find the user who has given the most answers and retrieve the count of how many answers.
SELECT answers_author_id AS author_id, COUNT(*) AS num_answers
FROM `first schema`.answers
GROUP BY answers_author_id
ORDER BY num_answers DESC
LIMIT 1;

-- QUERY 9 Count the number of professionals belong to the industry “Information Technology and Services”
SELECT COUNT(*) AS num_professionals
FROM `first schema`.professionals
WHERE professionals_industry = 'Information Technology and Services';

-- QUERY 10 Looking for students and professionals in the same location
SELECT professionals_location as location, 
       				'professional' AS category,
       				professionals_id AS id
FROM professionals
UNION ALL
SELECT students_location as location, 
      				'student' AS category,
students_id AS id
FROM students
ORDER BY location;

-- QUERY 11 Looking for students and professionals with the same group
SELECT g.groups_id, professionals_id, students_id
FROM `first schema`.groups g
JOIN group_memberships gm ON g.groups_id =
gm.group_memberships_group_id
JOIN (SELECT group_memberships_group_id
AS group_id, professionals_id
FROM professionals p
JOIN group_memberships gm1
ON gm1.group_memberships_user_id =
p.professionals_id) pg ON pg.group_id =
gm.group_memberships_group_id
JOIN (SELECT group_memberships_group_id
AS group_id, students_id
FROM students s JOIN group_memberships gm2 ON
s.students_id = gm2.group_memberships_user_id) sg
ON sg.group_id= gm.group_memberships_group_id;

-- QUERY 12 Looking for comments and questions that have the same author
SELECT
    c.comments_author_id AS CommentAuthor,
    GROUP_CONCAT(DISTINCT c.comments_id) AS comments,
    GROUP_CONCAT(DISTINCT q.questions_id) AS questions
FROM
    `first schema`.comments c
JOIN
    `first schema`.questions q ON c.comments_author_id = q.questions_author_id
GROUP BY
    C.comments_author_id;

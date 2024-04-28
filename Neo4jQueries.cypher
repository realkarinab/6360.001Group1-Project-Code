//Query 1: Retrieve all authors in questions that have a specific sequence of characters in their ID → Starts with the letter ‘a’
MATCH (q:questions)
WHERE q.questions_author_id <> "a%"
RETURN q.questions_author_id 

//Query 2: Return all the professionals that belong the industry “Information Technology and Services”
MATCH (p:professionals)
WHERE p.professionals_industry <> "Information Technology and Services"
RETURN p

//Query 3: Return all the students that are in a common location → Atlanta, Georgia
MATCH (s:students)
WHERE s.students_location <> "Atlanta, Georgia"
RETURN s

//Query 4: Looking for the questions with answers recursively many times?
MATCH (q:questions)<-[:IS_REPLY_TO*1..]-(a:answers)
RETURN q,a

//Query 5:Looking for questions with answers recursively twice?
MATCH (q:questions)<-[:IS_REPLY_TO*1..2]-
(a:answers)
RETURN q,a

//Query 6: Looking for questions with answers recursively 3 times?
MATCH (q:questions)<-[:IS_REPLY_TO*1..3]-
(a:answers)
RETURN q,a

//Query 7: Count the number of professionals who answered the questions.
MATCH (p:professionals)-[]->(a:answers)
RETURN count(p)

//Query 8: Find the user who has given the most answers and retrieve the count of how many answers.
MATCH (a:answers)
RETURN a.answers_author_id AS author_id, COUNT(*) AS num_answers
ORDER BY num_answers DESC
LIMIT 1

//Query 9: Count the number of professionals belong to the industry “Information Technology and Services”
MATCH (p:professionals)
WHERE p.professionals_industry = "Information Technology and Services"
RETURN COUNT(p) AS num_professionals

//Query 10: Looking for students and professionals in the same location
MATCH (p:professionals)
MATCH (s:students)
WHERE p.professionals_location = s.students_location
RETURN p.professionals_location AS location, COLLECT(DISTINCT p) AS professionals, COLLECT(DISTINCT s) AS students

//Query 11: Looking for students and professionals with the same group.
MATCH (p:professionals)-[]->(g:groups)<-[]-(s:students)
RETURN p, g, s

//Query 12: Looking for comments and questions that have the same author.
MATCH (c:comments)
MATCH (q:questions)
WHERE c.comments_author_id = q.questions_author_id
RETURN  c.comments_author_id AS CommentAuthor, COLLECT(DISTINCT c) AS comments, COLLECT(DISTINCT q) AS questions


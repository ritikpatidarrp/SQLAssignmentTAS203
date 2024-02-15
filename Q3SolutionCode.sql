-- Create CandidateMarks table
CREATE TABLE CandidateMarks (
    Candidate_ID INT PRIMARY KEY,
    Marks INT
);

-- Insert data into the CandidateMarks table
INSERT INTO CandidateMarks (Candidate_ID, Marks) VALUES
(1, 98),
(2, 78),
(3, 87),
(4, 98),
(5, 78);


-- 3. Given the marks obtained by candidates in a test, rank them in proper order.
WITH 
	mark_rnk AS
	(
		SELECT DISTINCT Marks, 
        DENSE_RANK() OVER(ORDER BY Marks DESC) AS rnk 
        FROM CandidateMarks
	)
SELECT C1.Marks, C1.rnk AS "Rank", 
(
	SELECT GROUP_CONCAT(Candidate_ID) 
    FROM CandidateMarks C2 
    WHERE C2.Marks=C1.Marks
) AS Candidate_ID
FROM mark_rnk C1
ORDER BY 1 DESC;

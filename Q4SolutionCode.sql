-- Create CandidateEmails table
CREATE TABLE CandidateEmails (
    Candidate_ID INT PRIMARY KEY,
    Email VARCHAR(255)
);

-- Insert data into the CandidateEmails table
INSERT INTO CandidateEmails (Candidate_ID, Email) VALUES
(45, 'abc@gmail.com'),
(23, 'def@yahoo.com'),
(34, 'abc@gmail.com'),
(21, 'bcf@gmail.com'),
(94, 'def@yahoo.com');

-- 4. If same value is repeated for different id, then keep the value that has smallest id and delete all the other rows having same value:

SET SQL_SAFE_UPDATES = 0;

CREATE TEMPORARY TABLE TempToRemain AS
    SELECT MIN(Candidate_ID) AS Candidate_ID, Email
    FROM CandidateEmails
    GROUP BY Email;

-- Delete rows from CandidateEmails which are not present in temporary table
DELETE
FROM CandidateEmails
WHERE (Candidate_ID,Email) != ALL
(
	SELECT * FROM TempToRemain
);

-- Drop the temporary table
DROP TEMPORARY TABLE IF EXISTS TempToRemain;

-- Display the updated CandidateEmails table
SELECT * FROM CandidateEmails ORDER BY Candidate_ID DESC;


SET SQL_SAFE_UPDATES = 1;

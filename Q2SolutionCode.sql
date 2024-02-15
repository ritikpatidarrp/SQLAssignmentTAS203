-- Create MonthlyData table
CREATE TABLE MonthlyData (
    Name VARCHAR(50),
    Jan INT,
    Feb INT,
    Mar INT
);

-- Insert data into the MonthlyData table
INSERT INTO MonthlyData (Name, Jan, Feb, Mar) VALUES
('X', 5200, 9093, 3832),
('Y', 9023, 8942, 4000),
('Z', 9834, 8197, 9903),
('W', 3244, 4321, 0293);

-- 2. Given a table with salaries of employees for different month, find the max amount from the rows with month name:
SELECT Name,( CASE WHEN Jan>=Feb and Feb>=Mar Then Jan
					WHEN Feb>=Jan and Feb>=Mar Then Feb
                    ELSE Mar
                    END
			) As Value,
            ( CASE WHEN Jan>=Feb and Feb>=Mar Then 'Jan'
					WHEN Feb>=Jan and Feb>=Mar Then 'Feb'
                    ELSE 'Mar'
                    END
			) As Month
FROM MonthlyData;


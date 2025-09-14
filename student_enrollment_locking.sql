-- ===================================================
-- Table Creation with Unique Constraint
-- ===================================================
DROP TABLE IF EXISTS StudentEnrollments;

CREATE TABLE StudentEnrollments (
    enrollment_id INT PRIMARY KEY,
    student_name VARCHAR(100) NOT NULL,
    course_id VARCHAR(10) NOT NULL,
    enrollment_date DATE NOT NULL,
    UNIQUE(student_name, course_id)  -- Prevent duplicate enrollments
);

-- Sample Data
INSERT INTO StudentEnrollments VALUES
(1, 'Ashish', 'CSE101', '2024-07-01'),
(2, 'Smaran', 'CSE102', '2024-07-01'),
(3, 'Vaibhav', 'CSE101', '2024-07-01');

-- ================= Part A: Prevent Duplicate Enrollments =================
START TRANSACTION;
INSERT INTO StudentEnrollments(enrollment_id, student_name, course_id, enrollment_date)
VALUES (4, 'Ashish', 'CSE101', '2024-07-02')
ON DUPLICATE KEY UPDATE enrollment_date = enrollment_date;
COMMIT;

-- ================= Part B: SELECT FOR UPDATE to Lock Student Record =================
START TRANSACTION;
SELECT * FROM StudentEnrollments
WHERE student_name='Ashish' AND course_id='CSE101'
FOR UPDATE;
UPDATE StudentEnrollments
SET enrollment_date='2024-07-03'
WHERE student_name='Ashish' AND course_id='CSE101';
COMMIT;

-- ================= Part C: Demonstrate Locking Preserves Consistency =================
START TRANSACTION;
SELECT * FROM StudentEnrollments
WHERE student_name='Ashish' AND course_id='CSE101'
FOR UPDATE;
UPDATE StudentEnrollments
SET enrollment_date='2024-07-05'
WHERE student_name='Ashish' AND course_id='CSE101';
COMMIT;

-- Verify Final Table State
SELECT * FROM StudentEnrollments;
CREATE TABLE STUDENTS (
    student_id INT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    date_of_birth DATE,
    group_id VARCHAR(10) NOT NULL,
    email VARCHAR(100) UNIQUE,
    enrollment_year INT
);

CREATE TABLE TEACHERS (
    teacher_id INT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    department VARCHAR(100),
    email VARCHAR(100) UNIQUE,
    title VARCHAR(50)
);

CREATE TABLE SUBJECTS (
    subject_id INT PRIMARY KEY,
    subject_name VARCHAR(100) NOT NULL,
    credits INT CHECK (credits > 0),
    semester INT,
    description TEXT
);

CREATE TABLE EXAM_SCHEDULE (
    schedule_id INT PRIMARY KEY,
    subject_id INT,
    teacher_id INT,
    exam_date DATETIME NOT NULL,
    room_number VARCHAR(20),
    exam_type VARCHAR(20) CHECK (exam_type IN ('Midterm', 'Final', 'Retake')),
    FOREIGN KEY (subject_id) REFERENCES SUBJECTS(subject_id),
    FOREIGN KEY (teacher_id) REFERENCES TEACHERS(teacher_id)
);

CREATE TABLE GRADES (
    grade_id INT PRIMARY KEY,
    student_id INT,
    subject_id INT,
    score INT CHECK (score >= 0 AND score <= 100),
    grade_date DATE,
    comments TEXT,
    FOREIGN KEY (student_id) REFERENCES STUDENTS(student_id),
    FOREIGN KEY (subject_id) REFERENCES SUBJECTS(subject_id)
);

CREATE TABLE APPEALS (
    appeal_id INT PRIMARY KEY,
    student_id INT,
    subject_id INT,
    appeal_date DATE DEFAULT CURRENT_DATE,
    reason TEXT,
    status VARCHAR(20) CHECK (status IN ('Pending', 'Approved', 'Rejected')),
    FOREIGN KEY (student_id) REFERENCES STUDENTS(student_id),
    FOREIGN KEY (subject_id) REFERENCES SUBJECTS(subject_id)
);

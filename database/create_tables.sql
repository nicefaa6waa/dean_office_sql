CREATE TABLE STUDENTS (
    telebe_id INT PRIMARY KEY,
    ad VARCHAR(50) NOT NULL,
    soyad VARCHAR(50) NOT NULL,
    dogum_tarixi DATE,
    qrup_id VARCHAR(10) NOT NULL,
    email VARCHAR(100) UNIQUE,
    qebul_ili INT
);

CREATE TABLE TEACHERS (
    muellim_id INT PRIMARY KEY,
    ad VARCHAR(50) NOT NULL,
    soyad VARCHAR(50) NOT NULL,
    kafedra VARCHAR(100),
    email VARCHAR(100) UNIQUE,
    elmi_derece VARCHAR(50)
);

CREATE TABLE SUBJECTS (
    fenn_id INT PRIMARY KEY,
    fenn_adi VARCHAR(100) NOT NULL,
    kreditler INT CHECK (kreditler > 0),
    semestr INT,
    tesvir TEXT
);

CREATE TABLE EXAM_SCHEDULE (
    cedvel_id INT PRIMARY KEY,
    fenn_id INT,
    muellim_id INT,
    imtahan_tarixi DATETIME NOT NULL,
    otaq_nomresi VARCHAR(20),
    imtahan_novu VARCHAR(20) CHECK (imtahan_novu IN ('Midterm', 'Final', 'Retake')),
    FOREIGN KEY (fenn_id) REFERENCES SUBJECTS(fenn_id),
    FOREIGN KEY (muellim_id) REFERENCES TEACHERS(muellim_id)
);

CREATE TABLE GRADES (
    qiymet_id INT PRIMARY KEY,
    telebe_id INT,
    fenn_id INT,
    bal INT CHECK (bal >= 0 AND bal <= 100),
    qiymet_tarixi DATE,
    sherh TEXT,
    FOREIGN KEY (telebe_id) REFERENCES STUDENTS(telebe_id),
    FOREIGN KEY (fenn_id) REFERENCES SUBJECTS(fenn_id)
);

CREATE TABLE APPEALS (
    muraciet_id INT PRIMARY KEY,
    telebe_id INT,
    fenn_id INT,
    muraciet_tarixi DATE DEFAULT CURRENT_DATE,
    sebeb TEXT,
    status VARCHAR(20) CHECK (status IN ('Pending', 'Approved', 'Rejected')),
    FOREIGN KEY (telebe_id) REFERENCES STUDENTS(telebe_id),
    FOREIGN KEY (fenn_id) REFERENCES SUBJECTS(fenn_id)
);

INSERT INTO STUDENTS (telebe_id, ad, soyad, dogum_tarixi, qrup_id, email, qebul_ili) VALUES
(101, 'Ali', 'Aliyev', '2003-05-15', 'CS-2101', 'ali.aliyev@uni.edu', 2021),
(102, 'Leyla', 'Mammadova', '2004-02-20', 'CS-2101', 'leyla.m@uni.edu', 2021),
(103, 'Murad', 'Hasanov', '2003-11-10', 'CS-2102', 'murad.h@uni.edu', 2021),
(104, 'Aysel', 'Guliyeva', '2004-07-05', 'IT-2103', 'aysel.g@uni.edu', 2021),
(105, 'Orkhan', 'Ismayilov', '2002-09-30', 'IT-2103', 'orkhan.i@uni.edu', 2020),
(106, 'Nigar', 'Rustamova', '2003-01-12', 'CS-2101', 'nigar.r@uni.edu', 2021),
(107, 'Farid', 'Qasimov', '2004-04-18', 'CS-2102', 'farid.q@uni.edu', 2021),
(108, 'Gunel', 'Jafarova', '2003-08-25', 'BA-2104', 'gunel.j@uni.edu', 2021),
(109, 'Elvin', 'Aslanov', '2002-12-05', 'BA-2104', 'elvin.a@uni.edu', 2020),
(110, 'Fidan', 'Karimova', '2004-03-22', 'CS-2101', 'fidan.k@uni.edu', 2021),
(111, 'Rashad', 'Huseynov', '2003-06-14', 'CS-2102', 'rashad.h@uni.edu', 2021),
(112, 'Zahra', 'Allahverdiyeva', '2004-10-01', 'IT-2103', 'zahra.a@uni.edu', 2021);

INSERT INTO TEACHERS (muellim_id, ad, soyad, kafedra, email, elmi_derece) VALUES
(1, 'Samir', 'Veliyev', 'Computer Science', 'samir.v@uni.edu', 'Professor'),
(2, 'Nargiz', 'Khalilova', 'Mathematics', 'nargiz.k@uni.edu', 'Docent'),
(3, 'Tural', 'Mustafayev', 'Information Technology', 'tural.m@uni.edu', 'Senior Lecturer'),
(4, 'Elnara', 'Rzayeva', 'Humanities', 'elnara.r@uni.edu', 'Lecturer'),
(5, 'Kamran', 'Taghiyev', 'Business Administration', 'kamran.t@uni.edu', 'Docent');

INSERT INTO SUBJECTS (fenn_id, fenn_adi, kreditler, semestr, tesvir) VALUES
(10, 'Verilənlər Bazası Sistemləri', 6, 4, 'Introduction to RDBMS, SQL, and normalization.'),
(20, 'Ali Riyaziyyat II', 6, 2, 'Advanced integration techniques and series.'),
(30, 'Veb Proqramlaşdırma', 5, 5, 'HTML, CSS, JS and backend frameworks.'),
(40, 'Azərbaycan Tarixi', 4, 1, 'Comprehensive history from ancient to modern times.'),
(50, 'Akademik Yazı', 3, 1, 'Principles of research and academic composition.'),
(60, 'Biznes Etikası', 4, 3, 'Ethical principles in the corporate world.');

INSERT INTO EXAM_SCHEDULE (cedvel_id, fenn_id, muellim_id, imtahan_tarixi, otaq_nomresi, imtahan_novu) VALUES
(1, 10, 1, '2024-06-10 10:00:00', 'Room 101', 'Final'),
(2, 20, 2, '2024-06-12 14:00:00', 'Room 205', 'Final'),
(3, 30, 3, '2024-06-15 09:00:00', 'Lab 3', 'Final'),
(4, 40, 4, '2024-06-18 11:00:00', 'Auditorium A', 'Final'),
(5, 10, 1, '2024-06-25 10:00:00', 'Room 101', 'Retake'),
(6, 60, 5, '2024-06-20 13:00:00', 'Room 304', 'Final');

INSERT INTO GRADES (qiymet_id, telebe_id, fenn_id, bal, qiymet_tarixi, sherh) VALUES
(1, 101, 10, 85, '2024-06-10', 'Good job'),
(2, 102, 10, 92, '2024-06-10', 'Excellent'),
(3, 103, 10, 45, '2024-06-10', 'Failed'),
(4, 104, 10, 78, '2024-06-10', 'Pass'),
(5, 105, 10, 55, '2024-06-10', 'Barely passed'),
(6, 106, 10, 30, '2024-06-10', 'Failed seriously'),
(7, 107, 10, 67, '2024-06-10', 'Satisfactory'),
(8, 108, 10, 88, '2024-06-10', 'Good'),
(9, 109, 10, 49, '2024-06-10', 'Failed by 1 point'),
(10, 110, 10, 95, '2024-06-10', 'Top of class'),
(11, 101, 20, 70, '2024-06-12', 'Pass'),
(12, 102, 20, 82, '2024-06-12', 'Good'),
(13, 103, 20, 60, '2024-06-12', 'Pass'),
(14, 104, 20, 40, '2024-06-12', 'Failed'),
(15, 105, 20, 50, '2024-06-12', 'Failed (threshold is 51)'),
(16, 111, 20, 75, '2024-06-12', 'Pass'),
(17, 112, 20, 90, '2024-06-12', 'Excellent'),
(18, 101, 30, 88, '2024-06-15', 'Great project'),
(19, 103, 30, 92, '2024-06-15', 'Full score on practical'),
(20, 106, 30, 55, '2024-06-15', 'Pass'),
(21, 107, 30, 65, '2024-06-15', 'Pass'),
(22, 109, 30, 48, '2024-06-15', 'Failed'),
(23, 102, 40, 95, '2024-06-18', 'Perfect'),
(24, 104, 40, 85, '2024-06-18', 'Good'),
(25, 105, 40, 75, '2024-06-18', 'Good'),
(26, 108, 40, 60, '2024-06-18', 'Pass'),
(27, 111, 40, 91, '2024-06-18', 'Excellent'),
(28, 101, 50, 77, '2024-01-20', 'Winter session'),
(29, 102, 50, 88, '2024-01-20', 'Winter session'),
(30, 103, 50, 66, '2024-01-20', 'Winter session'),
(31, 106, 50, 51, '2024-01-20', 'Just passed'),
(32, 110, 50, 99, '2024-01-20', 'Outstanding'),
(33, 108, 60, 82, '2024-06-20', 'Good essay'),
(34, 109, 60, 70, '2024-06-20', 'Pass'),
(35, 112, 60, 85, '2024-06-20', 'Pass'),
(36, 103, 10, 55, '2024-06-25', 'Retake Passed'),
(37, 106, 10, 40, '2024-06-25', 'Retake Failed again'),
(38, 109, 10, 52, '2024-06-25', 'Retake Passed'),
(39, 104, 20, 55, '2024-07-01', 'Summer school pass'),
(40, 105, 20, 58, '2024-07-01', 'Summer school pass'),
(41, 109, 30, 60, '2024-07-02', 'Summer school pass');

INSERT INTO APPEALS (muraciet_id, telebe_id, fenn_id, muraciet_tarixi, sebeb, status) VALUES
(1, 109, 10, '2024-06-11', 'I believe question 3 was graded incorrectly.', 'Rejected'),
(2, 105, 20, '2024-06-13', 'Calculation error in total score.', 'Approved'),
(3, 106, 10, '2024-06-26', 'Technical issue during retake.', 'Pending');

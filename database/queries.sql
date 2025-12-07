SELECT 
    s.first_name AS Ad, 
    s.last_name AS Soyad, 
    subj.subject_name AS Fənn, 
    g.score AS Bal,
    CASE 
        WHEN g.score >= 91 THEN 'A'
        WHEN g.score >= 81 THEN 'B'
        WHEN g.score >= 71 THEN 'C'
        WHEN g.score >= 61 THEN 'D'
        WHEN g.score >= 51 THEN 'E'
        ELSE 'F' 
    END AS Hərf_Qiyməti
FROM GRADES g
JOIN STUDENTS s ON g.student_id = s.student_id
JOIN SUBJECTS subj ON g.subject_id = subj.subject_id
ORDER BY s.last_name, subj.subject_name;

SELECT 
    subj.subject_name AS Fənn,
    t.last_name AS Müəllim,
    es.exam_date AS Tarix,
    es.room_number AS Otaq,
    es.exam_type AS Növ
FROM EXAM_SCHEDULE es
JOIN SUBJECTS subj ON es.subject_id = subj.subject_id
JOIN TEACHERS t ON es.teacher_id = t.teacher_id
ORDER BY es.exam_date;

SELECT 
    s.first_name AS Ad,
    s.last_name AS Soyad,
    subj.subject_name AS Fənn,
    g.score AS Bal,
    g.grade_date AS Tarix
FROM GRADES g
JOIN STUDENTS s ON g.student_id = s.student_id
JOIN SUBJECTS subj ON g.subject_id = subj.subject_id
WHERE g.score < 51
ORDER BY g.score ASC;

SELECT DISTINCT
    t.first_name AS Ad,
    t.last_name AS Soyad,
    subj.subject_name AS Fənn
FROM EXAM_SCHEDULE es
JOIN TEACHERS t ON es.teacher_id = t.teacher_id
JOIN SUBJECTS subj ON es.subject_id = subj.subject_id;

SELECT 
    s.first_name AS Ad,
    s.last_name AS Soyad,
    COUNT(g.grade_id) as İmtahan_Sayı,
    ROUND(AVG(g.score), 2) as Ortalama_Bal
FROM STUDENTS s
LEFT JOIN GRADES g ON s.student_id = g.student_id
GROUP BY s.student_id, s.first_name, s.last_name
HAVING COUNT(g.grade_id) > 0
ORDER BY Ortalama_Bal DESC;

SELECT 
    a.appeal_id,
    s.last_name AS Tələbə,
    subj.subject_name AS Fənn,
    a.reason AS Səbəb,
    a.status AS Status
FROM APPEALS a
JOIN STUDENTS s ON a.student_id = s.student_id
JOIN SUBJECTS subj ON a.subject_id = subj.subject_id;

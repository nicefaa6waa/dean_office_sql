SELECT 
    s.ad, 
    s.soyad, 
    subj.fenn_adi AS Fənn, 
    g.bal,
    CASE 
        WHEN g.bal >= 91 THEN 'A'
        WHEN g.bal >= 81 THEN 'B'
        WHEN g.bal >= 71 THEN 'C'
        WHEN g.bal >= 61 THEN 'D'
        WHEN g.bal >= 51 THEN 'E'
        ELSE 'F' 
    END AS Hərf_Qiyməti
FROM GRADES g
JOIN STUDENTS s ON g.telebe_id = s.telebe_id
JOIN SUBJECTS subj ON g.fenn_id = subj.fenn_id
ORDER BY s.soyad, subj.fenn_adi;

SELECT 
    subj.fenn_adi AS Fənn,
    t.soyad AS Müəllim,
    es.imtahan_tarixi AS Tarix,
    es.otaq_nomresi AS Otaq,
    es.imtahan_novu AS Növ
FROM EXAM_SCHEDULE es
JOIN SUBJECTS subj ON es.fenn_id = subj.fenn_id
JOIN TEACHERS t ON es.muellim_id = t.muellim_id
ORDER BY es.imtahan_tarixi;

SELECT 
    s.ad,
    s.soyad,
    subj.fenn_adi AS Fənn,
    g.bal,
    g.qiymet_tarixi AS Tarix
FROM GRADES g
JOIN STUDENTS s ON g.telebe_id = s.telebe_id
JOIN SUBJECTS subj ON g.fenn_id = subj.fenn_id
WHERE g.bal < 51
ORDER BY g.bal ASC;

SELECT DISTINCT
    t.ad,
    t.soyad,
    subj.fenn_adi AS Fənn
FROM EXAM_SCHEDULE es
JOIN TEACHERS t ON es.muellim_id = t.muellim_id
JOIN SUBJECTS subj ON es.fenn_id = subj.fenn_id;

SELECT 
    s.ad,
    s.soyad,
    COUNT(g.qiymet_id) as İmtahan_Sayı,
    ROUND(AVG(g.bal), 2) as Ortalama_Bal
FROM STUDENTS s
LEFT JOIN GRADES g ON s.telebe_id = g.telebe_id
GROUP BY s.telebe_id, s.ad, s.soyad
HAVING COUNT(g.qiymet_id) > 0
ORDER BY Ortalama_Bal DESC;

SELECT 
    a.muraciet_id,
    s.soyad AS Tələbə,
    subj.fenn_adi AS Fənn,
    a.sebeb AS Səbəb,
    a.status AS Status
FROM APPEALS a
JOIN STUDENTS s ON a.telebe_id = s.telebe_id
JOIN SUBJECTS subj ON a.fenn_id = subj.fenn_id;

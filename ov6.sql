-- 1 finn stoler

SELECT COUNT (*) AS antall_stolmodeller
From Stol
JOIN Standardstol
ON Standardstol.stol_id = Stol.stol_id



SELECT COUNT(*) AS antall_standardstoler
FROM Stol
INNER JOIN Standardstol ON Stol.stol_id = Standardstol.stol_id
INNER JOIN Bestilling ON Stol.bestilling_id = Bestilling.bestilling_id
LEFT JOIN Ordre ON Bestilling.ordre_id = Ordre.ordre_nr
WHERE Ordre.reell_lev_dato IS NULL;


SELECT Distinct COUNT(*) AS antall_stolmodeller
From Stol
JOIN Standardstol
ON Standardstol.stol_id = Stol.stol_id
JOIN Spesialstol
ON Spesialstol.stol_id = Stol.stol_id;

SELECT Stol.stol_type, COUNT(stol.stol_modell) AS antall_stolmodeller
From Stol GROUP BY Stol.stol_type

SELECT Stol.stol_type, AVG(Stol.antall) AS Gjennomsnittlig_antall
FROM Stol
JOIN Bestilling
ON Stol.bestilling_id = Bestilling.bestilling_id
JOIN Ordre ON Bestilling.ordre_id = Ordre.ordre_id
GROUP BY Stol.stol_type;

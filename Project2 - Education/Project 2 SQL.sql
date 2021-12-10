USE education;
SELECT * FROM 0_14_on_pop;

CREATE TABLE Countries2 as
SELECT id,name,capitalCity, Total_population FROM pop_total pop
LEFT JOIN education.country count ON pop.economy = count.id;

UPDATE Countries2 
LEFT JOIN 0_14_on_pop ON Countries2.id = 0_14_on_pop.economy;

SELECT * FROM Countries2 ;
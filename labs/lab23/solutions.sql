SELECT * FROM crime_scene_report
WHERE date is 20180115
AND type is 'murder'
AND city is 'SQL City';

-- WITNESS 2 Annabel 
SELECT * FROM person
WHERE address_street_name = 'Franklin Ave'
ORDER BY name ASC;

-- Witness 2 - last house on Northwestern DR
SELECT * FROM person
WHERE address_street_name = 'Northwestern Dr'
ORDER BY address_number DESC;

-- Check drivers license
SELECT * FROM drivers_license
WHERE ID = 490173
OR ID = 118009;

-- find witnesses in interviews
SELECT * FROM interview
WHERE person_id = 14887
OR person_id = 16371;

-- Check plate numbers containing H42W
SELECT * FROM drivers_license
WHERE plate_number LIKE '%H42W%'
OR plate_number LIKE '%H42W'
OR plate_number LIKE 'H42W%';
          
-- Check gym members with cards starting with 48Z--
SELECT * FROM get_fit_now_member
WHERE id Like '48Z%';

-- Check ppl at the gym on Jan 09Th
SELECT * FROM get_fit_now_check_in as checkin
JOIN get_fit_now_member as member
ON checkin.membership_id = member.id
WHERE check_in_date = 20180109;

-- view interviews of 2 ppl that were atthe gym (1 found)
SELECT * FROM interview
WHERE person_id = 28819
or person_id = 67318;

-- find relevant car owners
SELECT * FROM drivers_license
WHERE car_make = 'Tesla'
AND car_model = 'Model S'
AND gender = 'female'
AND hair_color = 'red';

-- Find ppl who attended concert 3 times in December
SELECT * FROM facebook_event_checkin
WHERE event_id = 1143
AND date Like '201712%'
GROUP BY person_id
HAVING count(person_id) =3;

-- check 2 ppl in person 
SELECT * FROM person
WHERE id = 24556
OR id = 99716;

-- MIRANDA PRIESTLY ! --







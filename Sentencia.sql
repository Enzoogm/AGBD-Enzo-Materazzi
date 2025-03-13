select * from inhabitant

select *from inhabitant where jod="butcher"

select * from inhabitant where state="friendly"  

select * from inhabitant where job LIKE '%smith' and state="friendly"  

select personid from INHABITANT where name="Stranger"

select gold from INHABITANT where name="Stranger"

select * from ITEM where owner IS NULL

UPDATE item SET owner = 20 WHERE owner IS NULL;

SELECT * FROM ITEM WHERE owner = 20

SELECT * FROM INHABITANT WHERE state="friendly" and job="dealer" or job="merchant" 

UPDATE item SET owner = 15 WHERE item = "ring" OR item = "teapot"

UPDATE inhabitant SET gold = gold + 120 WHERE personid = 20

UPDATE inhabitant SET name = "Elcausa" WHERE personid = 20

SELECT * FROM inhabitant WHERE job = "baker" ORDER BY gold DESC

SELECT * FROM inhabitant WHERE job = "pilot"

SELECT village.name FROM village, inhabitant WHERE village.villageid = inhabitant.villageid AND inhabitant.name = 'Dirty Dieter'

SELECT inhabitant.name FROM village, inhabitant WHERE village.chief = inhabitant.personid AND village.name = "Onionville"






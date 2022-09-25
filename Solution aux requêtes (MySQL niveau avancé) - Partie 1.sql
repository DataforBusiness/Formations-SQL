--Obtenir la liste des 10 villes les plus peuplées en 2012

SELECT * 
FROM `villes_france_free` 
ORDER BY `ville_population_2012` DESC 
LIMIT 10


--Obtenir la liste des 50 villes ayant la plus faible superficie

SELECT * 
FROM `villes_france_free` 
ORDER BY `ville_surface` ASC 
LIMIT 50

--Obtenir la liste des départements d’outres-mer, c’est-à-dire ceux dont le numéro de département commencent par “97”

SELECT * 
FROM `departement` 
WHERE `departement_code` LIKE '97%'

--Obtenir le nom des 10 villes les plus peuplées en 2012, ainsi que le nom du département associé

SELECT * 
FROM `villes_france_free` 
LEFT JOIN departement ON departement_code = ville_departement
ORDER BY `ville_population_2012` DESC 
LIMIT 10

--Obtenir la liste du nom de chaque département, associé à son code et du nombre de commune au sein de ces département, en triant afin d’obtenir en priorité les départements qui possèdent le plus de communes

SELECT departement_nom, ville_departement, COUNT(*) AS nbr_items 
FROM `villes_france_free` 
LEFT JOIN departement ON departement_code = ville_departement
GROUP BY ville_departement
ORDER BY `nbr_items` DESC




















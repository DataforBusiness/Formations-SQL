/* Obtenir la liste des 10 plus grands départements, en terme de superficie */

SELECT departement_nom, ville_departement, SUM(`ville_surface`) AS dpt_surface 
FROM `villes_france` 
LEFT JOIN departement ON departement_code = ville_departement
GROUP BY ville_departement  
ORDER BY dpt_surface  DESC
LIMIT 10;


/* Compter le nombre de villes dont le nom commence par “Saint” */
SELECT COUNT(*) 
FROM `villes_france` 
WHERE `ville_nom` LIKE 'saint%';


/* Obtenir la liste des villes qui ont un nom existants plusieurs fois, et trier afin d’obtenir en premier
 celles dont le nom est le plus souvent utilisé par plusieurs communes*/
SELECT ville_nom, COUNT(*) AS nbt_item 
FROM `villes_france` 
GROUP BY `ville_nom` 
ORDER BY nbt_item DESC;



/* Obtenir en une seule requête SQL la liste des villes dont la superficie est supérieur à la superficie moyenne */
SELECT * 
FROM `villes_france` 
WHERE `ville_surface` > (SELECT AVG(`ville_surface`) FROM `villes_france_free`);



/* Obtenir la liste des départements qui possèdent plus de 2 millions d’habitants */
SELECT ville_departement, SUM(`ville_population_2012`) AS population_2012
FROM `villes_france` 
GROUP BY `ville_departement`
HAVING population_2012 > 2000000
ORDER BY population_2012 DESC;



/* Remplacez les tirets par un espace vide, pour toutes les villes commençant par “SAINT-” 
(dans la colonne qui contient les noms en majuscule) */
UPDATE `villes_france` 
SET ville_nom = REPLACE(ville_nom, '-', ' ') 
WHERE `ville_nom` LIKE 'SAINT-%';

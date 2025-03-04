--INSERCIÓ DE LES DADES EN LES NOVES COLUMNES, A PARTIR DEL NOM DE COMARCA / INSERCIÓN DE LOS DATOS EN LAS NUEVAS COLUMNAS, A PARTIR DEL NOMBRE DE COMARCA 

UPDATE catalunya.limits_comarcals as c
SET naixements_2023 = n.total
FROM catalunya.naixements_2023 as n
WHERE nom_comarca = nomcomar;

UPDATE catalunya.limits_comarcals as c
SET defuncions_2023 = d.total
FROM catalunya.defuncions_2023 as d
WHERE nom_comarca = nomcomar;

UPDATE catalunya.limits_comarcals_estudis as c
SET poblacio_2023 = p.total
FROM catalunya.poblacio_2023 as p
WHERE nom_comarca = nomcomar;

--CÀLCUL DEL CREIXEMENT VEGETATIU PER CADA 1000 HABITANTS / CÁLCULO DEL CRECIMIENTO VEGETATIVO POR CADA 1000 HABITANTES 

UPDATE catalunya.limits_comarcals AS c
SET creixement_vegetatiu_1000h_2023 = ((naixements_2023 - defuncions_2023) / (poblacio_2023) * 1000)
WHERE poblacio_2023 IS NOT NULL;

--CÀLCUL DEL PERCENTATGE DE POBLACIÓ PER COMARCA RESPECTE EL TOTAL / CÁLCULO DEL PORCENTAJE DE POBLACIÓN POR COMARCA RESPECTO EL TOTAL

UPDATE catalunya.limits_comarcals AS c
SET poblacio_2023_percentatge = (poblacio_2023 / (SELECT SUM (poblacio_2023) FROM catalunya.limits_comarcals) * 100);

--CÀLCUL DEL PERCENTATGE DE POBLACIÓ PER COMARCA RESPECTE EL TOTAL

UPDATE catalunya.limits_comarcals AS c
SET poblacio_2023_percentatge = (poblacio_2023 / (SELECT SUM (poblacio_2023) FROM catalunya.limits_comarcals) * 100);

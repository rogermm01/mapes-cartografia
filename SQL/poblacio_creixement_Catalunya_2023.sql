**Les taules han estat processades abans de la seva importació a la base de dades (PostgreSQL) / Las tablas han sido procesadas antes de su importación a la base de datos (PostgreSQL).

--CREACIÓ DE LES COLUMNES AMB LES DADES DE NAIXEMENTS, DEFUNCIONS, POBLACIÓ I CREIXEMEN VEGETATIU / CREACIÓN DE LAS COLUMNAS CON LOS DATOS DE NACIMIENTOS, DEFUNCIONES, POBLACIÓN I CRECIMIENTO VEGETATIVO

ALTER TABLE catalunya.limits_comarcals ADD COLUMN naixements_2023 NUMERIC;

ALTER TABLE catalunya.limits_comarcals ADD COLUMN defuncions_2023 NUMERIC;

ALTER TABLE catalunya.limits_comarcals ADD COLUMN poblacio_2023 NUMERIC;

ALTER TABLE catalunya.limits_comarcals ADD COLUMN creixement_vegetatiu_1000h_2023 NUMERIC;

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

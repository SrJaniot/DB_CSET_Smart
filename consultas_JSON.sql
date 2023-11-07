SELECT equipos_ambiente->'desktop' FROM tab_ambientes;
INSERT INTO tab_ambientes VALUES('B1-304','Sala de Contabilidad',68,9309,1,FALSE,FALSE,FALSE,ROW(TRUE,33,TRUE,TRUE,TRUE,TRUE,33),
                                 '{"desktop": 1,"portatil": 30}');

SELECT json_build_object() FROM tab_ambientes;

SELECT json_build_object('id',id_ambiente, 'nombre', nom_ambiente,'regional', nom_regional,
						 'centro',nom_centro), 'sede',nom_sede, 
						 'equipos', equipos_ambiente->'desktop'
FROM tab_ambientes a, tab_regionales b, tab_centros c, tab_sedes d
WHERE a.id_regional = b.id_regional AND
	  a.id_centro 	= c.id_centro	AND
	  a.id_sede 	= d.id_sede;

SELECT to_json(ARRAY_AGG(tab_ambientes)) FROM tab_ambientes;

SELECT json_agg(a.equipos_ambiente)::jsonb FROM tab_ambientes a;

SELECT a.id_ambiente,a.nom_ambiente,a.equipos_ambiente FROM tab_ambientes a;

SELECT a.id_ambiente,a.nom_ambiente,a.equipos_ambiente->'impresora',a.equipos_ambiente->'sonido'
FROM tab_ambientes a;


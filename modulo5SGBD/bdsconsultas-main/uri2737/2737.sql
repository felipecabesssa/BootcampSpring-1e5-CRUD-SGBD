CREATE TABLE lawyers(
  register INTEGER PRIMARY KEY,
  name VARCHAR(255),
  customers_number INTEGER
 );
  
  
 INSERT INTO lawyers(register, name, customers_number)
 VALUES (1648, 'Marty M. Harrison', 5),
	(2427, 'Jonathan J. Blevins', 15),
	(3365, 'Chelsey D. Sanders', 20),
	(4153, 'Dorothy W. Ford', 16),
	(5525, 'Penny J. Cormier', 6);
	
SELECT * FROM lawyers

(SELECT name, customers_number
FROM lawyers
ORDER BY customers_number DESC
LIMIT 1)

UNION ALL

-- Só o union ele concatena, o union all traz os 2 resultados.

(SELECT name, customers_number
FROM lawyers
ORDER BY customers_number ASC
LIMIT 1)

UNION ALL 

-- Esse 'Average' na frente do SELECT, insere essa palavra na linha abaixo (nova linha)

(SELECT 'Average', ROUND(AVG(customers_number), 0)
FROM lawyers)

-- ---------- Solução alternativa sem usar o ORDER BY -------------- --


(SELECT name, customers_number
FROM lawyers
WHERE customers_number = (
	SELECT MAX(customers_number)
	FROM lawyers
))

UNION ALL

(SELECT name, customers_number
FROM lawyers
WHERE customers_number = (
	SELECT MIN(customers_number)
	FROM lawyers
))

UNION ALL 

(SELECT 'Average', ROUND(AVG(customers_number), 0)
FROM lawyers)


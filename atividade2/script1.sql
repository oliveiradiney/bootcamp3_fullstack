create table Estoque(
	
	ID_NF INTEGER,
  	ID_ITEM INTEGER,
  	COD_PROD INTEGER,
  	VALOR_UNIT NUMERIC(5,2),
  	QUANTIDADE INTEGER,
  	DESCONTO INTEGER
);



INSERT INTO estoque VALUES
    (1, 1, 1, 25, 10, 5),
    (1,2,2,13.50,3,NULL),
    (1, 3, 3, 15, 2,NULL),
    (1,4,4,10,1,NULL),
    (1,5,5,30,1,NULL),
    (2,1,3,15,4,NULL),
    (2,2,4,10,5,NULL),
    (2,3,5,30,7,NULL),
    (3,1,1,25,5,NULL),
    (3,2,4,10,4,NULL),
    (3,3,5,30,5,NULL),
    (3,4,2,13.5,7,NULL),
    (4,1,5,30,10,15),
    (4,2,4,10,12,5),
    (4,3,1,25,13,5),
    (4,4,2,13.5,15,5),
    (5,1,3,15,3,NULL),
    (5,2,5,30,6,NULL),
    (6,1,1,25,22,15),
    (6,2,3,15,25,20),
    (7,1,1,25,10,3),
    (7,2,2,13.5,10,4),
    (7,3,3,15,10,4),
    (7,4,5,30,10,1);













USE PRIMEIRO_BD

INSERT INTO CLIENTES
(
	 [ID_CLIENTE]
    ,[NOME]
    ,[DATA_CADASTRO]
    ,[EMAIL]
)
VALUES
(
	2
	,'PEDRO CAIQUE'
	,GETDATE()
	,'pedro@reservatorio.com.br'
)

SELECT
	   ID_CLIENTE
      ,NOME
      ,DATA_CADASTRO
      ,EMAIL
FROM CLIENTES
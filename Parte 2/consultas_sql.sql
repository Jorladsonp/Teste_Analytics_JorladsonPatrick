-- Consulta 1: Listar o nome do produto, categoria e a soma total de vendas (Quantidade * Preço) para cada produto mostrando de forma ordenada por ordem decrescente

SELECT 
    Categoria,
    Produto,
    SUM (Quantidade * Preço) AS Total_de_Vendas
FROM 
    data_clean
GROUP BY 
    Produto
ORDER BY 
    Total_de_Vendas DESC;

-- Consulta 2: Identificar os produtos que venderam menos no mês de junho de 2023

SELECT 
    Categoria,
    Produto,
    SUM (Quantidade) AS Total_de_Quantidade
FROM 
    data_clean
WHERE 
    strftime ('%Y-%m', Data) = '2023-06'
GROUP BY 
    Produto
ORDER BY 
    Total_de_Quantidade ASC;

-- Explicação lógica consulta 1:
-- O objetivo é: Calcular o total de vendas para cada produto, classificar e ordenar
-- Utilizei o SELECT em Categoria, Produto pois eles precisam ser listados e criei uma coluna ao lado chamado Total_de_Vendas que é o resultado da multiplicação de Quantidade x Preço, assim cada linha vai representar o valor total de vendas por cada produto 
-- o FROM é para pegar a tabela criada
-- Agrupo as linhas por produto, como produto tem mais "variaveis" que categoria, é o suficiente para poder combinar as linhas do mesmo produto e os valores dentro da sua categoria
-- Ordeno como pedido o total_de_Vendas de forma decrescente, para mostrar os maiores valores em cima da tabela

-- Explicação Lógica consulta 2:
-- O objetivo é: Identificar os produtos que venderam menos em uma determinada data
-- Uso o SELECT em Categoria, Produto e crio uma outra coluna chamada Total_de_Quantidade que é a soma de todas as quantidades vendidas para cada produto dentro de sua categoria
-- O From é para pegar a tabela criada
-- Uso o WHERE para filtar os registros dentro da data que foi solicitada, para filtar apenas os registros realizadas no mes de junho de 2023
-- Agrupo as linhas por produto pois, produto tem mais "variaveis" que "categoria", segue a mesma logica da consulta 1, terei combinado as linhas do mesmo produto e a quantidade dentro de sua categoria
-- Ordeno de forma Crescente para mostrar os menores valores por cima na tabela 

-- Obs: em Group by, nao faz diferença pro codigo colocar "Categoria, Produto" mas dizem que no PostgreSQL tem q ser assim, fica ai de aviso
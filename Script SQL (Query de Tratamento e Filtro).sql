/* PROJETO: Otimização de Produtividade - Logística Reversa
   OBJETIVO: Filtrar métricas de esforço para análise de gargalos
*/

SELECT 
    dia_analisado,
    -- Calculando a média de esforço para garantir precisão no Power BI
    AVG(esforço_por_unidade) AS media_esforco,
    SUM(volume_bipado) AS volume_total,
    -- Criando uma flag para destacar o dia crítico na análise
    CASE 
        WHEN dia_analisado = 'Quinta (Sobrecarga)' THEN 'ALERTA: Pico de Esforço'
        WHEN dia_analisado = 'Sexta (Minha Solução)' THEN 'OTIMIZADO'
        ELSE 'Fluxo Normal'
    END AS status_operacional
FROM 
    SuaTabelaLogistica -- Nome da tabela que você criou no banco
WHERE 
    volume_bipado > 0 -- Filtro de segurança
GROUP BY 
    dia_analisado
ORDER BY 
    media_esforco DESC;

SELECT 
    t1.Name,
    CAST(t2.revenue_eur AS FLOAT) AS Revenue_EUR,
    CAST(t1.market_cap_eur AS FLOAT) AS Market_Cap_EUR,
    CAST(t2.revenue_usd AS FLOAT) AS Revenue_USD,
    CAST(t1.market_cap_usd AS FLOAT) AS Market_Cap_USD,
    ROUND(CAST(t2.revenue_eur AS FLOAT) / NULLIF(CAST(t1.market_cap_eur AS FLOAT), 0), 2) AS RATIO,
    t2.Headquarters AS HQ,
    t2.Industry
FROM 
    [filipedb].[dbo].[companies_marketcap] AS t1
    JOIN [filipedb].[dbo].[companies_revenue] AS t2 ON t1.NAME = t2.NAME
ORDER BY RATIO DESC;
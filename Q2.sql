SELECT
to_char(deal.closed_won_date,'YYYY_Month') AS Closed_Won_Month,
SUM(deal.deal_value_usd)
FROM deal
WHERE deal.closed_won_date IS NOT NULL
GROUP BY 1,extract(month from deal.closed_won_date)
ORDER BY 2 DESC

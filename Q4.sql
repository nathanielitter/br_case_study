SELECT
to_char(deal.closed_won_date,'YYYY_Q') AS Closed_Won_Month,
contact.property_utm_source AS UTM_Source,
SUM(deal.deal_value_usd)
FROM deal
INNER JOIN deal_contact
ON deal_contact.deal_id = deal.deal_id
INNER JOIN contact
ON contact.contact_id = deal_contact.contact_id
WHERE deal.closed_won_date IS NOT NULL AND
contact.property_utm_source IS NOT NULL
GROUP BY 1,2,extract(month from deal.closed_won_date)
ORDER BY 1 DESC

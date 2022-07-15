SELECT UPPER(contact.property_city) as City_Name,
count(*) as Deals_Won,
count(*) * 100.0/sum(count(*)) over () as Closed_Won_Percentage
FROM deal
INNER JOIN deal_contact
ON deal_contact.deal_id = deal.deal_id
INNER JOIN contact
ON contact.contact_id = deal_contact.contact_id
INNER JOIN email
ON email.user_id = contact.user_id
WHERE RIGHT(email.hashed_email,19) !='blockrenovation.com' AND
contact.first_name NOT LIKE '%test%'AND
contact.first_name NOT LIKE '%Test%'AND
contact.last_name NOT LIKE '%test%'AND
contact.last_name NOT LIKE '%Test%' AND
deal.closed_won_date IS NOT NULL AND
contact.property_city IS NOT NULL
GROUP BY UPPER(contact.property_city)
ORDER BY 3 DESC

SELECT
to_char(block_user.create_date,'Month') as month,
count(*) as count
FROM block_user
INNER JOIN email
ON block_user.user_id = email.user_id
INNER JOIN contact
ON block_user.user_id = contact.user_id
WHERE RIGHT(email.hashed_email,19) !='blockrenovation.com' AND
contact.first_name NOT LIKE '%test%'AND
contact.first_name NOT LIKE '%Test%'AND
contact.last_name NOT LIKE '%test%'AND
contact.last_name NOT LIKE '%Test%'
GROUP BY 1,extract(month from block_user.create_date)
ORDER BY count DESC


/*
===
Second Version of the script groping statistics by Year and Month.
===

SELECT
to_char(block_user.create_date,'YYYY_Month') as month,
count(*) as count
FROM block_user
INNER JOIN email
ON block_user.user_id = email.user_id
INNER JOIN contact
ON block_user.user_id = contact.user_id
WHERE RIGHT(email.hashed_email,19) !='blockrenovation.com' AND
contact.first_name NOT LIKE '%test%'AND
contact.first_name NOT LIKE '%Test%'AND
contact.last_name NOT LIKE '%test%'AND
contact.last_name NOT LIKE '%Test%'
GROUP BY 1,extract(month from block_user.create_date)
ORDER BY count DESC
*/

SELECT reservations.*, properties.*, avg(rating) as average_rating
FROM users
JOIN properties ON owner_id = users.id
JOIN reservations ON property_id = properties.id
JOIN property_reviews ON reservation_id = reservations.id
WHERE users.id = 1 AND reservations.end_date < now()::date
GROUP BY properties.id, reservations.id
ORDER BY reservations.start_date
LIMIT 10;
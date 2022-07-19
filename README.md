# College ARCH matching
College ARCH mentor and mentee matching using linear simplex method written in matlab by paula zhu


## TODO
- after frontend/backend addition, account for mentee's importance ratings
- account for essay length

## SQL Queries
- For mentors: SELECT id, display_name, email, school, interests, backgrounds, location, city, dream_colleges, LENGTH(essay), multi_mentees
FROM users
WHERE account_type = 'Mentor'
- For mentees: SELECT id, display_name, email, school, interests, backgrounds, location, city, dream_colleges, LENGTH(essay)
FROM users
WHERE account_type = 'Mentee'
# College ARCH matching
College ARCH mentor and mentee matching using linear simplex method written in matlab by paula zhu


## TODO

## SQL Queries
- For mentors: SELECT id, display_name, email, school, interests, backgrounds, location, city, dream_colleges, LENGTH(essay), importance, multi_mentees
FROM users
WHERE account_type = 'Mentor' AND status = 'applied'
- For mentees: SELECT id, display_name, email, school, interests, backgrounds, location, city, dream_colleges, LENGTH(essay), importance
FROM users
WHERE account_type = 'Mentee' AND status = 'applied'
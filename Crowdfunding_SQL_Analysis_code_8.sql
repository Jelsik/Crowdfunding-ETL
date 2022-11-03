-- Challenge Bonus queries.
-- 1. (2.5 pts)
-- Retrieve all the number of backer_counts in descending order for each `cf_id` for the "live" campaigns. 
SELECT backers_count, outcome, cf_id
FROM campaign
WHERE outcome = 'live'
ORDER BY backers_count DESC;


-- 2. (2.5 pts)
-- Using the "backers" table confirm the results in the first query.
SELECT COUNT(backer_id), cf_id
FROM backers
GROUP BY cf_id
ORDER BY COUNT(backer_id) DESC;

-- 3. (5 pts)
-- Create a table that has the first and last name, and email address of each contact.
-- and the amount left to reach the goal for all "live" projects in descending order. 

SELECT  contacts.first_name,
contacts.last_name,
contacts.email,(cam.goal - cam.pledged) AS "Remaining Goal Amount"
INTO email_contacts_remaining_goal_amount
FROM campaign as cam
INNER JOIN contacts 
ON cam.contact_id = contacts.contact_id
WHERE cam.outcome = 'live'
ORDER BY "Remaining Goal Amount" DESC;


-- Check the table
SELECT * FROM email_contacts_remaining_goal_amount;

-- 4. (5 pts)
-- Create a table, "email_backers_remaining_goal_amount" that contains the email address of each backer in descending order, 
-- and has the first and last name of each backer, the cf_id, company name, description, 
-- end date of the campaign, and the remaining amount of the campaign goal as "Left of Goal". 
SELECT back.email,
back.first_name,
back.last_name,
cam.cf_id,
cam.company_name,
cam.description,
cam.end_date,
(cam.goal - cam.pledged) AS "Left of Goal"
INTO email_backers_remaining_goal_amount
FROM campaign as cam
INNER JOIN backers as back
ON cam.cf_id = back.cf_id
WHERE cam.outcome = 'live'
ORDER BY  back.last_name, back.first_name;


-- Check the table
SELECT * FROM email_backers_remaining_goal_amount;


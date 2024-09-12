/*
Steps:
Join Submissions, Challenges, and Difficulty tables**:

First, we'll join the Submissions table with the Challenges and Difficulty tables to find out which submissions achieved a full score. A full score is defined as the submission's score being equal to the maximum score associated with the difficulty level of the challenge.
Group by Hacker:

Once we know which hackers achieved full scores for specific challenges, we will group by hacker_id and count the number of challenges for which they earned full scores.
Filter Hackers with Full Scores in More than One Challenge:

We will then filter out hackers who earned full scores for fewer than two challenges.
Order by Total Challenges and hacker_id:

Finally, we will sort the hackers first by the total number of challenges in which they earned full scores, and then by their hacker_id in case of a tie.
*/
SELECT h.hacker_id, h.name
FROM Hackers h
JOIN Submissions s ON h.hacker_id = s.hacker_id
JOIN Challenges c ON s.challenge_id = c.challenge_id
JOIN Difficulty d ON c.difficulty_level = d.difficulty_level
WHERE s.score = d.score  -- Earned full score
GROUP BY h.hacker_id, h.name
HAVING COUNT(DISTINCT s.challenge_id) > 1  -- More than one challenge
ORDER BY COUNT(DISTINCT s.challenge_id) DESC, h.hacker_id ASC;
/*
Explanation:
Joins:

We join the Hackers table with Submissions, Challenges, and Difficulty to get the relevant details of each hacker's submissions.
The Difficulty table helps us determine the full score for each challenge based on its difficulty level.
WHERE Clause:

The WHERE s.score = d.score condition ensures that we only consider submissions where the hacker earned a full score.
GROUP BY and HAVING:

We group by hacker_id and name to count how many challenges each hacker earned a full score in.
The HAVING COUNT(DISTINCT s.challenge_id) > 1 filters out hackers who did not earn full scores in more than one challenge.
ORDER BY:

We order by the count of challenges in descending order (COUNT(DISTINCT s.challenge_id) DESC).
If two hackers achieved full scores in the same number of challenges, they are sorted by hacker_id in ascending order (h.hacker_id ASC).
*/

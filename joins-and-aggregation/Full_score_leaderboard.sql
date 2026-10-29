 SELECT
    h.hacker_id,
    h.name 
FROM Hackers h
JOIN (
    SELECT
        s.hacker_id,
        s.challenge_id 
    FROM Submissions s 
    JOIN Challenges c
        ON s.challenge_id = c.challenge_id
    JOIN Difficulty d
        ON c.difficulty_level = d.difficulty_level
    WHERE s.score = d.score
    GROUP BY s.hacker_id, s.challenge_id
) AS full_scores
    ON h.hacker_id = full_scores.hacker_id
GROUP BY h.hacker_id, h.name
HAVING COUNT(*) > 1
ORDER BY COUNT(*) DESC, h.hacker_id ASC;

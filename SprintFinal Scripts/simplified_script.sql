-- Complex Query

SELECT 
    ua.username, 
    g.title, 
    b.priority_q,
    backlog_counts.total_games
FROM 
    UserAccount ua
JOIN 
    Backlog b ON ua.user_id = b.user_id
JOIN 
    Games g ON b.game_id = g.game_id
JOIN 
    (
        SELECT 
            user_id, 
            COUNT(game_id) AS total_games
        FROM 
            Backlog
        GROUP BY 
            user_id
        HAVING 
            COUNT(game_id) > 0
    ) AS backlog_counts ON ua.user_id = backlog_counts.user_id
ORDER BY 
   username desc,
   b.priority_q;
    
   
   -- Simplified To
   
SELECT 
    ua.username, 
    g.title, 
    b.priority_q,
    COUNT(b.game_id) OVER (PARTITION BY ua.user_id) AS total_games
FROM 
    useraccount ua
JOIN 
    backlog b ON ua.user_id = b.user_id
JOIN 
    games g ON b.game_id = g.game_id
WHERE 
    (SELECT COUNT(game_id) FROM backlog WHERE user_id = ua.user_id) > 0
ORDER BY 
    username DESC, 
    b.priority_q;
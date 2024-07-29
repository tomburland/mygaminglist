SELECT 
    ua.user_id, 
    ua.username,
    COALESCE(g.Title, 'Unknown Game') AS game_title, 
    COALESCE(b.priority_q, 0) AS priority_q
FROM 
    useraccount ua
LEFT JOIN 
    backlog b ON ua.user_id = b.user_id
LEFT JOIN 
    games g ON b.game_id = g.game_id; 
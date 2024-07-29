-- Query 1: Select usernames and titles of all games in their backlog, sorted by priority
SELECT 
    ua.username, 
    g.title, 
    b.priority_q
FROM 
    UserAccount ua
JOIN 
    Backlog b ON ua.user_id = b.user_id
JOIN 
    Games g ON b.game_id = g.game_id
ORDER BY 
    ua.username, 
    b.priority_q;

/*
   Logical Query Plan # 1
   
1. Table Scans:

- Scan the UserAccount table.
- Scan the Backlog table.
- Scan the Games table.

2. Join Operations:

Perform an inner join between UserAccount (ua) and Backlog (b) on ua.user_id = b.user_id.
Join the result with Games (g) on b.game_id = g.game_id.

3. Projection:

Select username, title, and priority_q.

4. Sort Operation:

Sort the results by priority_q
   
*/ 
   
-- Query 2: Select usernames and the count of games in their backlog
SELECT 
    ua.username, 
    COUNT(b.game_id) AS game_count
FROM 
    UserAccount ua
JOIN 
    Backlog b ON ua.user_id = b.user_id
GROUP BY 
    ua.username;
    
/*
   Logical Query Plan #2
   
1. Table Scans:

	Scan the UserAccount table.
	Scan the Backlog table.

2. Join Operation:

	Perform an inner join between UserAccount (ua) and Backlog (b) on ua.user_id = b.user_id.

3. Aggregation:

	Group by username.
	Calculate COUNT(b.game_id) for each group.

4. Projection:

	Select username and game_count.
*/
   
 /*
   COST ESTIMATION
   
	Query 2 is likely to have the lowest cost to implement because it involves fewer table scans,
	fewer join operations, and an aggregation operation that can be efficiently handled with appropriate indexes.
	
	Query 1 has higher cost due to the additional join with the much larger Games table and the sorting operation.
	
	Thus, Query 2 is more efficient and has a lower cost to implement compared to Query 1.
   
*/
-- Merges user information with backlog or mygamelist
select * from useraccount
natural join backlog;

select * from backlog;
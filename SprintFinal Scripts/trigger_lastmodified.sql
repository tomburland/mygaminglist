create trigger if not exists update_backlog_timestamp
before update on backlog
for each row
set new.lastmodified = CURRENT_TIMESTAMP; 

create trigger if not exists update_mygamelist_timestamp
before update on mygamelist
for each row
set new.lastmodified = CURRENT_TIMESTAMP;

/*
update backlog
set game_id = 74
where title = 'Super Metroid';

select * from backlog;
*/

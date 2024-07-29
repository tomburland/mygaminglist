alter table backlog
add constraint check_priority_q
check (priority_q > 0);

/* 
update backlog 
set priority_q = -1
where title = 'Doom'; 
*/
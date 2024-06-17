create table useraccount (user_id int, username VARCHAR(20));

create table mygamelist (
	user_id int,
	Title varchar(100),
	playstate ENUM('Playing', 'Finished', 'Dropped'),
	rating int,
	Genres varchar(128)
);


create table backlog (
	user_id int,
	priority_q int,
	Title varchar(100),
	Genres varchar(128),
);
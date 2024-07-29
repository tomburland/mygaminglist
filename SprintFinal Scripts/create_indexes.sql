-- Creating indexes on attributes that would be commonly read but not commonly written in order to improve search performance

create index idx_username on useraccount(username);

create index idx_gametitle on games(Title);

create index idx_game_releasedate on games(`Release Date`);


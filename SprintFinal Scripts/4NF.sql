
-- Reduced to 4th Normal Form

-- UserAccount table
CREATE TABLE UserAccount (
    user_id INT PRIMARY KEY,
    username VARCHAR(255) NOT NULL,
    -- Other attributes
);


-- MyGameList table
CREATE TABLE MyGameList (
    user_id INT,
    game_id INT,
    PRIMARY KEY (user_id, game_id),
    FOREIGN KEY (user_id) REFERENCES UserAccount(user_id),
    FOREIGN KEY (game_id) REFERENCES Games(game_id)
    -- Other attributes
);

-- Backlog table
CREATE TABLE Backlog (
    user_id INT,
    game_id INT,
    priority_q INT NOT NULL,
    PRIMARY KEY (user_id, game_id),
    FOREIGN KEY (user_id) REFERENCES UserAccount(user_id),
    FOREIGN KEY (game_id) REFERENCES Games(game_id)
    -- Other attributes
);
-- Users following and followers sub table connecting to user table
CREATE TABLE user_followers (
    user_id INT PRIMARY KEY,
    follower_count INT DEFAULT 0,
    following_count INT DEFAULT 0,
    FOREIGN KEY (user_id) REFERENCES users(id)
);

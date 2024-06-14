-- Neeve User data
INSERT INTO users (first_name, last_name, username, mobile, email, 
    password_hash, country, bio, profile_picture_path, rider_type) 
    VALUES
    ('Neeve', 'Kadosh', 'mrneeve', '9086931931', 'neevekadosh@gmail.com', 
    '12345678', 'United States', 'Snowboarding is lyfe, simple as that.',
    '/path/to/aws/s3/user_id/profile.png', TRUE);

-- Add empty following entry for Neeve
INSERT INTO user_followers (user_id, follower_count, following_count) VALUES
    (1, 150000, 1);

-- Sagi User data
INSERT INTO users (first_name, last_name, username, 
                   mobile, email, password_hash, 
                   country, bio, profile_picture_path,
                   rider_type
                   ) VALUES
            ('Sagi', 'Kadosh', 'swagi', 
            '9084368391', 'sagikadosh@gmail.com', 
            '87654321', 'United States', 'I am loser.',
            '/path/to/aws/s3/user_id/profile.png', FALSE);

-- Add empty following entry for Neeve
INSERT INTO user_followers (user_id, follower_count, following_count) VALUES
    (2, 0, 21);

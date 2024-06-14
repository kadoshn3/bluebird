-- Users table containing main user information, credentials
CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    -- Basic content
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    username VARCHAR(50) NOT NULL,
    mobile VARCHAR(15) NOT NULL,
    email VARCHAR(50) NOT NULL,
    password_hash VARCHAR(32) NOT NULL,
    country VARCHAR(80) NOT NULL,       -- Show flag location
    bio VARCHAR(100),                   -- Can be empty, optional
    profile_picture_path VARCHAR(255),  -- Image will start as default
    rider_type BOOLEAN,                 -- skier (FALSE), snowboarder (TRUE)
    registered_at_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    last_active_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

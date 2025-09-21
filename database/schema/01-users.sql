-- ============================================================================
-- User Management Schema
-- ============================================================================
-- This file contains tables related to user management and authentication
-- Run this after setup.sql

-- ============================================================================
-- Users Table
-- ============================================================================

CREATE TABLE users (
    id BIGINT PRIMARY KEY,
    email VARCHAR(255) NOT NULL UNIQUE,
    username VARCHAR(50) NOT NULL UNIQUE,
    password_hash VARCHAR(255) NOT NULL,
    first_name VARCHAR(100),
    last_name VARCHAR(100),
    avatar_url VARCHAR(500),
    email_verified BOOLEAN DEFAULT FALSE,
    email_verified_at TIMESTAMP,
    is_active BOOLEAN DEFAULT TRUE,
    last_login_at TIMESTAMP,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

-- PostgreSQL: Use SERIAL or uuid_generate_v4()
-- Uncomment one of the following for PostgreSQL:
-- ALTER TABLE users ALTER COLUMN id SET DEFAULT nextval('users_id_seq');
-- ALTER TABLE users ALTER COLUMN id SET DEFAULT uuid_generate_v4();

-- MySQL: Use AUTO_INCREMENT
-- Uncomment for MySQL:
-- ALTER TABLE users MODIFY id BIGINT AUTO_INCREMENT;

-- ============================================================================
-- User Profiles Table
-- ============================================================================

CREATE TABLE user_profiles (
    id BIGINT PRIMARY KEY,
    user_id BIGINT NOT NULL,
    bio TEXT,
    website VARCHAR(500),
    location VARCHAR(100),
    timezone VARCHAR(50) DEFAULT 'UTC',
    language VARCHAR(10) DEFAULT 'en',
    date_of_birth DATE,
    phone_number VARCHAR(20),
    phone_verified BOOLEAN DEFAULT FALSE,
    notification_preferences JSON, -- PostgreSQL: JSONB, MySQL: JSON, SQLite: TEXT
    privacy_settings JSON,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,

    -- Foreign key constraint
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE
);

-- PostgreSQL: Use SERIAL or uuid_generate_v4()
-- Uncomment one of the following for PostgreSQL:
-- ALTER TABLE user_profiles ALTER COLUMN id SET DEFAULT nextval('user_profiles_id_seq');
-- ALTER TABLE user_profiles ALTER COLUMN id SET DEFAULT uuid_generate_v4();

-- MySQL: Use AUTO_INCREMENT
-- Uncomment for MySQL:
-- ALTER TABLE user_profiles MODIFY id BIGINT AUTO_INCREMENT;

-- ============================================================================
-- User Sessions Table (for session management)
-- ============================================================================

CREATE TABLE user_sessions (
    id VARCHAR(255) PRIMARY KEY,
    user_id BIGINT NOT NULL,
    ip_address VARCHAR(45), -- Supports both IPv4 and IPv6
    user_agent TEXT,
    expires_at TIMESTAMP NOT NULL,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,

    -- Foreign key constraint
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE
);

-- ============================================================================
-- Password Reset Tokens Table
-- ============================================================================

CREATE TABLE password_reset_tokens (
    id BIGINT PRIMARY KEY,
    user_id BIGINT NOT NULL,
    token VARCHAR(255) NOT NULL UNIQUE,
    expires_at TIMESTAMP NOT NULL,
    used_at TIMESTAMP,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,

    -- Foreign key constraint
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE
);

-- PostgreSQL: Use SERIAL
-- Uncomment for PostgreSQL:
-- ALTER TABLE password_reset_tokens ALTER COLUMN id SET DEFAULT nextval('password_reset_tokens_id_seq');

-- MySQL: Use AUTO_INCREMENT
-- Uncomment for MySQL:
-- ALTER TABLE password_reset_tokens MODIFY id BIGINT AUTO_INCREMENT;

-- ============================================================================
-- Email Verification Tokens Table
-- ============================================================================

CREATE TABLE email_verification_tokens (
    id BIGINT PRIMARY KEY,
    user_id BIGINT NOT NULL,
    token VARCHAR(255) NOT NULL UNIQUE,
    expires_at TIMESTAMP NOT NULL,
    verified_at TIMESTAMP,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,

    -- Foreign key constraint
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE
);

-- PostgreSQL: Use SERIAL
-- Uncomment for PostgreSQL:
-- ALTER TABLE email_verification_tokens ALTER COLUMN id SET DEFAULT nextval('email_verification_tokens_id_seq');

-- MySQL: Use AUTO_INCREMENT
-- Uncomment for MySQL:
-- ALTER TABLE email_verification_tokens MODIFY id BIGINT AUTO_INCREMENT;

-- ============================================================================
-- User Roles and Permissions (Simple RBAC)
-- ============================================================================

CREATE TABLE roles (
    id BIGINT PRIMARY KEY,
    name VARCHAR(50) NOT NULL UNIQUE,
    description TEXT,
    permissions JSON, -- Store permissions as JSON for flexibility
    is_active BOOLEAN DEFAULT TRUE,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

-- PostgreSQL/MySQL: Use AUTO_INCREMENT or SERIAL
-- Uncomment one of the following:
-- ALTER TABLE roles ALTER COLUMN id SET DEFAULT nextval('roles_id_seq'); -- PostgreSQL
-- ALTER TABLE roles MODIFY id BIGINT AUTO_INCREMENT; -- MySQL

CREATE TABLE user_roles (
    user_id BIGINT NOT NULL,
    role_id BIGINT NOT NULL,
    assigned_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    assigned_by BIGINT, -- User who assigned the role

    PRIMARY KEY (user_id, role_id),
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE,
    FOREIGN KEY (role_id) REFERENCES roles(id) ON DELETE CASCADE,
    FOREIGN KEY (assigned_by) REFERENCES users(id) ON DELETE SET NULL
);

-- ============================================================================
-- PostgreSQL: Create triggers for updated_at
-- ============================================================================

-- Uncomment for PostgreSQL:
/*
CREATE TRIGGER set_timestamp_users
    BEFORE UPDATE ON users
    FOR EACH ROW
    EXECUTE FUNCTION trigger_set_timestamp();

CREATE TRIGGER set_timestamp_user_profiles
    BEFORE UPDATE ON user_profiles
    FOR EACH ROW
    EXECUTE FUNCTION trigger_set_timestamp();

CREATE TRIGGER set_timestamp_user_sessions
    BEFORE UPDATE ON user_sessions
    FOR EACH ROW
    EXECUTE FUNCTION trigger_set_timestamp();

CREATE TRIGGER set_timestamp_roles
    BEFORE UPDATE ON roles
    FOR EACH ROW
    EXECUTE FUNCTION trigger_set_timestamp();
*/

-- ============================================================================
-- MySQL: Create triggers for updated_at
-- ============================================================================

-- Uncomment for MySQL:
/*
DELIMITER $$

CREATE TRIGGER users_updated_at
    BEFORE UPDATE ON users
    FOR EACH ROW
BEGIN
    SET NEW.updated_at = CURRENT_TIMESTAMP;
END$$

CREATE TRIGGER user_profiles_updated_at
    BEFORE UPDATE ON user_profiles
    FOR EACH ROW
BEGIN
    SET NEW.updated_at = CURRENT_TIMESTAMP;
END$$

CREATE TRIGGER user_sessions_updated_at
    BEFORE UPDATE ON user_sessions
    FOR EACH ROW
BEGIN
    SET NEW.updated_at = CURRENT_TIMESTAMP;
END$$

CREATE TRIGGER roles_updated_at
    BEFORE UPDATE ON roles
    FOR EACH ROW
BEGIN
    SET NEW.updated_at = CURRENT_TIMESTAMP;
END$$

DELIMITER ;
*/

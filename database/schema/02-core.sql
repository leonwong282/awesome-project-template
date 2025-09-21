-- ============================================================================
-- Core Application Schema
-- ============================================================================
-- This file contains core application tables and business logic
-- Run this after 01-users.sql

-- ============================================================================
-- Posts/Content Table
-- ============================================================================

CREATE TABLE posts (
    id BIGINT PRIMARY KEY,
    user_id BIGINT NOT NULL,
    title VARCHAR(255) NOT NULL,
    slug VARCHAR(255) NOT NULL UNIQUE,
    content TEXT,
    excerpt VARCHAR(500),
    featured_image VARCHAR(500),
    status VARCHAR(20) DEFAULT 'draft', -- draft, published, archived
    visibility VARCHAR(20) DEFAULT 'public', -- public, private, unlisted
    published_at TIMESTAMP,
    view_count INTEGER DEFAULT 0,
    like_count INTEGER DEFAULT 0,
    comment_count INTEGER DEFAULT 0,
    metadata JSON, -- Store additional metadata as JSON
    seo_title VARCHAR(255),
    seo_description VARCHAR(500),
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,

    -- Foreign key constraint
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE
);

-- PostgreSQL: Use SERIAL or uuid_generate_v4()
-- Uncomment one of the following for PostgreSQL:
-- ALTER TABLE posts ALTER COLUMN id SET DEFAULT nextval('posts_id_seq');
-- ALTER TABLE posts ALTER COLUMN id SET DEFAULT uuid_generate_v4();

-- MySQL: Use AUTO_INCREMENT
-- Uncomment for MySQL:
-- ALTER TABLE posts MODIFY id BIGINT AUTO_INCREMENT;

-- ============================================================================
-- Categories Table
-- ============================================================================

CREATE TABLE categories (
    id BIGINT PRIMARY KEY,
    name VARCHAR(100) NOT NULL UNIQUE,
    slug VARCHAR(100) NOT NULL UNIQUE,
    description TEXT,
    parent_id BIGINT, -- For hierarchical categories
    sort_order INTEGER DEFAULT 0,
    is_active BOOLEAN DEFAULT TRUE,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,

    -- Self-referencing foreign key for parent-child relationships
    FOREIGN KEY (parent_id) REFERENCES categories(id) ON DELETE SET NULL
);

-- PostgreSQL/MySQL: Use AUTO_INCREMENT or SERIAL
-- Uncomment one of the following:
-- ALTER TABLE categories ALTER COLUMN id SET DEFAULT nextval('categories_id_seq'); -- PostgreSQL
-- ALTER TABLE categories MODIFY id BIGINT AUTO_INCREMENT; -- MySQL

-- ============================================================================
-- Post Categories Junction Table (Many-to-Many)
-- ============================================================================

CREATE TABLE post_categories (
    post_id BIGINT NOT NULL,
    category_id BIGINT NOT NULL,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,

    PRIMARY KEY (post_id, category_id),
    FOREIGN KEY (post_id) REFERENCES posts(id) ON DELETE CASCADE,
    FOREIGN KEY (category_id) REFERENCES categories(id) ON DELETE CASCADE
);

-- ============================================================================
-- Tags Table
-- ============================================================================

CREATE TABLE tags (
    id BIGINT PRIMARY KEY,
    name VARCHAR(50) NOT NULL UNIQUE,
    slug VARCHAR(50) NOT NULL UNIQUE,
    description TEXT,
    color VARCHAR(7), -- Hex color code
    usage_count INTEGER DEFAULT 0,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

-- PostgreSQL/MySQL: Use AUTO_INCREMENT or SERIAL
-- Uncomment one of the following:
-- ALTER TABLE tags ALTER COLUMN id SET DEFAULT nextval('tags_id_seq'); -- PostgreSQL
-- ALTER TABLE tags MODIFY id BIGINT AUTO_INCREMENT; -- MySQL

-- ============================================================================
-- Post Tags Junction Table (Many-to-Many)
-- ============================================================================

CREATE TABLE post_tags (
    post_id BIGINT NOT NULL,
    tag_id BIGINT NOT NULL,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,

    PRIMARY KEY (post_id, tag_id),
    FOREIGN KEY (post_id) REFERENCES posts(id) ON DELETE CASCADE,
    FOREIGN KEY (tag_id) REFERENCES tags(id) ON DELETE CASCADE
);

-- ============================================================================
-- Comments Table
-- ============================================================================

CREATE TABLE comments (
    id BIGINT PRIMARY KEY,
    post_id BIGINT NOT NULL,
    user_id BIGINT,
    parent_id BIGINT, -- For nested comments
    author_name VARCHAR(100), -- For guest comments
    author_email VARCHAR(255), -- For guest comments
    content TEXT NOT NULL,
    status VARCHAR(20) DEFAULT 'pending', -- pending, approved, rejected, spam
    ip_address VARCHAR(45),
    user_agent TEXT,
    like_count INTEGER DEFAULT 0,
    is_pinned BOOLEAN DEFAULT FALSE,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,

    -- Foreign key constraints
    FOREIGN KEY (post_id) REFERENCES posts(id) ON DELETE CASCADE,
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE SET NULL,
    FOREIGN KEY (parent_id) REFERENCES comments(id) ON DELETE CASCADE
);

-- PostgreSQL/MySQL: Use AUTO_INCREMENT or SERIAL
-- Uncomment one of the following:
-- ALTER TABLE comments ALTER COLUMN id SET DEFAULT nextval('comments_id_seq'); -- PostgreSQL
-- ALTER TABLE comments MODIFY id BIGINT AUTO_INCREMENT; -- MySQL

-- ============================================================================
-- File Uploads Table
-- ============================================================================

CREATE TABLE file_uploads (
    id BIGINT PRIMARY KEY,
    user_id BIGINT,
    original_name VARCHAR(255) NOT NULL,
    file_name VARCHAR(255) NOT NULL UNIQUE,
    file_path VARCHAR(500) NOT NULL,
    file_size BIGINT NOT NULL, -- Size in bytes
    mime_type VARCHAR(100) NOT NULL,
    file_extension VARCHAR(10),
    alt_text VARCHAR(255), -- For accessibility
    caption TEXT,
    upload_type VARCHAR(50) DEFAULT 'general', -- avatar, post_image, document, etc.
    is_public BOOLEAN DEFAULT FALSE,
    download_count INTEGER DEFAULT 0,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,

    -- Foreign key constraint
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE SET NULL
);

-- PostgreSQL/MySQL: Use AUTO_INCREMENT or SERIAL
-- Uncomment one of the following:
-- ALTER TABLE file_uploads ALTER COLUMN id SET DEFAULT nextval('file_uploads_id_seq'); -- PostgreSQL
-- ALTER TABLE file_uploads MODIFY id BIGINT AUTO_INCREMENT; -- MySQL

-- ============================================================================
-- Settings Table (Application Configuration)
-- ============================================================================

CREATE TABLE settings (
    id BIGINT PRIMARY KEY,
    key_name VARCHAR(100) NOT NULL UNIQUE,
    value_text TEXT,
    value_json JSON, -- For complex settings
    data_type VARCHAR(20) DEFAULT 'string', -- string, number, boolean, json, array
    category VARCHAR(50) DEFAULT 'general',
    description TEXT,
    is_public BOOLEAN DEFAULT FALSE, -- Whether setting can be accessed via API
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

-- PostgreSQL/MySQL: Use AUTO_INCREMENT or SERIAL
-- Uncomment one of the following:
-- ALTER TABLE settings ALTER COLUMN id SET DEFAULT nextval('settings_id_seq'); -- PostgreSQL
-- ALTER TABLE settings MODIFY id BIGINT AUTO_INCREMENT; -- MySQL

-- ============================================================================
-- Activity Log Table (Audit Trail)
-- ============================================================================

CREATE TABLE activity_logs (
    id BIGINT PRIMARY KEY,
    user_id BIGINT,
    action VARCHAR(100) NOT NULL,
    resource_type VARCHAR(50), -- posts, users, comments, etc.
    resource_id BIGINT,
    old_values JSON,
    new_values JSON,
    ip_address VARCHAR(45),
    user_agent TEXT,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

-- PostgreSQL/MySQL: Use AUTO_INCREMENT or SERIAL
-- Uncomment one of the following:
-- ALTER TABLE activity_logs ALTER COLUMN id SET DEFAULT nextval('activity_logs_id_seq'); -- PostgreSQL
-- ALTER TABLE activity_logs MODIFY id BIGINT AUTO_INCREMENT; -- MySQL

-- ============================================================================
-- PostgreSQL: Create triggers for updated_at
-- ============================================================================

-- Uncomment for PostgreSQL:
/*
CREATE TRIGGER set_timestamp_posts
    BEFORE UPDATE ON posts
    FOR EACH ROW
    EXECUTE FUNCTION trigger_set_timestamp();

CREATE TRIGGER set_timestamp_categories
    BEFORE UPDATE ON categories
    FOR EACH ROW
    EXECUTE FUNCTION trigger_set_timestamp();

CREATE TRIGGER set_timestamp_tags
    BEFORE UPDATE ON tags
    FOR EACH ROW
    EXECUTE FUNCTION trigger_set_timestamp();

CREATE TRIGGER set_timestamp_comments
    BEFORE UPDATE ON comments
    FOR EACH ROW
    EXECUTE FUNCTION trigger_set_timestamp();

CREATE TRIGGER set_timestamp_file_uploads
    BEFORE UPDATE ON file_uploads
    FOR EACH ROW
    EXECUTE FUNCTION trigger_set_timestamp();

CREATE TRIGGER set_timestamp_settings
    BEFORE UPDATE ON settings
    FOR EACH ROW
    EXECUTE FUNCTION trigger_set_timestamp();
*/

-- ============================================================================
-- MySQL: Create triggers for updated_at
-- ============================================================================

-- Uncomment for MySQL:
/*
DELIMITER $$

CREATE TRIGGER posts_updated_at
    BEFORE UPDATE ON posts
    FOR EACH ROW
BEGIN
    SET NEW.updated_at = CURRENT_TIMESTAMP;
END$$

CREATE TRIGGER categories_updated_at
    BEFORE UPDATE ON categories
    FOR EACH ROW
BEGIN
    SET NEW.updated_at = CURRENT_TIMESTAMP;
END$$

CREATE TRIGGER tags_updated_at
    BEFORE UPDATE ON tags
    FOR EACH ROW
BEGIN
    SET NEW.updated_at = CURRENT_TIMESTAMP;
END$$

CREATE TRIGGER comments_updated_at
    BEFORE UPDATE ON comments
    FOR EACH ROW
BEGIN
    SET NEW.updated_at = CURRENT_TIMESTAMP;
END$$

CREATE TRIGGER file_uploads_updated_at
    BEFORE UPDATE ON file_uploads
    FOR EACH ROW
BEGIN
    SET NEW.updated_at = CURRENT_TIMESTAMP;
END$$

CREATE TRIGGER settings_updated_at
    BEFORE UPDATE ON settings
    FOR EACH ROW
BEGIN
    SET NEW.updated_at = CURRENT_TIMESTAMP;
END$$

DELIMITER ;
*/

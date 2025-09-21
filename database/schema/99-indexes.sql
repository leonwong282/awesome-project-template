-- ============================================================================
-- Database Indexes and Constraints
-- ============================================================================
-- This file creates indexes for optimal query performance
-- Run this after all schema files (01-users.sql, 02-core.sql)

-- ============================================================================
-- Users Table Indexes
-- ============================================================================

-- Email lookup (login, uniqueness)
CREATE INDEX idx_users_email ON users(email);

-- Username lookup (profile pages, mentions)
CREATE INDEX idx_users_username ON users(username);

-- Active users filtering
CREATE INDEX idx_users_is_active ON users(is_active);

-- Email verification status
CREATE INDEX idx_users_email_verified ON users(email_verified);

-- User creation date (admin queries, analytics)
CREATE INDEX idx_users_created_at ON users(created_at);

-- Last login tracking
CREATE INDEX idx_users_last_login_at ON users(last_login_at);

-- ============================================================================
-- User Profiles Table Indexes
-- ============================================================================

-- Foreign key index for user profiles
CREATE INDEX idx_user_profiles_user_id ON user_profiles(user_id);

-- Location-based searches
CREATE INDEX idx_user_profiles_location ON user_profiles(location);

-- Timezone grouping
CREATE INDEX idx_user_profiles_timezone ON user_profiles(timezone);

-- ============================================================================
-- User Sessions Table Indexes
-- ============================================================================

-- Session lookup by user
CREATE INDEX idx_user_sessions_user_id ON user_sessions(user_id);

-- Session expiration cleanup
CREATE INDEX idx_user_sessions_expires_at ON user_sessions(expires_at);

-- IP address tracking (security)
CREATE INDEX idx_user_sessions_ip_address ON user_sessions(ip_address);

-- ============================================================================
-- Authentication Tokens Indexes
-- ============================================================================

-- Password reset token lookups
CREATE INDEX idx_password_reset_tokens_user_id ON password_reset_tokens(user_id);
CREATE INDEX idx_password_reset_tokens_token ON password_reset_tokens(token);
CREATE INDEX idx_password_reset_tokens_expires_at ON password_reset_tokens(expires_at);

-- Email verification token lookups
CREATE INDEX idx_email_verification_tokens_user_id ON email_verification_tokens(user_id);
CREATE INDEX idx_email_verification_tokens_token ON email_verification_tokens(token);
CREATE INDEX idx_email_verification_tokens_expires_at ON email_verification_tokens(expires_at);

-- ============================================================================
-- Roles and Permissions Indexes
-- ============================================================================

-- Role name lookup
CREATE INDEX idx_roles_name ON roles(name);

-- Active roles filtering
CREATE INDEX idx_roles_is_active ON roles(is_active);

-- User roles junction table
CREATE INDEX idx_user_roles_user_id ON user_roles(user_id);
CREATE INDEX idx_user_roles_role_id ON user_roles(role_id);
CREATE INDEX idx_user_roles_assigned_at ON user_roles(assigned_at);

-- ============================================================================
-- Posts Table Indexes
-- ============================================================================

-- Author lookup
CREATE INDEX idx_posts_user_id ON posts(user_id);

-- Slug lookup (SEO URLs)
CREATE INDEX idx_posts_slug ON posts(slug);

-- Status and visibility filtering
CREATE INDEX idx_posts_status ON posts(status);
CREATE INDEX idx_posts_visibility ON posts(visibility);

-- Published posts ordering
CREATE INDEX idx_posts_published_at ON posts(published_at);

-- Post creation date
CREATE INDEX idx_posts_created_at ON posts(created_at);

-- Popular posts (view count)
CREATE INDEX idx_posts_view_count ON posts(view_count);

-- Most liked posts
CREATE INDEX idx_posts_like_count ON posts(like_count);

-- Composite index for published posts by date
CREATE INDEX idx_posts_published_status_date ON posts(status, published_at DESC) WHERE status = 'published';

-- ============================================================================
-- Categories Table Indexes
-- ============================================================================

-- Category name and slug lookup
CREATE INDEX idx_categories_name ON categories(name);
CREATE INDEX idx_categories_slug ON categories(slug);

-- Hierarchical category structure
CREATE INDEX idx_categories_parent_id ON categories(parent_id);

-- Active categories
CREATE INDEX idx_categories_is_active ON categories(is_active);

-- Category ordering
CREATE INDEX idx_categories_sort_order ON categories(sort_order);

-- ============================================================================
-- Post Categories Junction Table Indexes
-- ============================================================================

-- Already has PRIMARY KEY on (post_id, category_id)
-- Additional indexes for reverse lookups
CREATE INDEX idx_post_categories_category_id ON post_categories(category_id);
CREATE INDEX idx_post_categories_created_at ON post_categories(created_at);

-- ============================================================================
-- Tags Table Indexes
-- ============================================================================

-- Tag name and slug lookup
CREATE INDEX idx_tags_name ON tags(name);
CREATE INDEX idx_tags_slug ON tags(slug);

-- Popular tags (usage count)
CREATE INDEX idx_tags_usage_count ON tags(usage_count DESC);

-- ============================================================================
-- Post Tags Junction Table Indexes
-- ============================================================================

-- Already has PRIMARY KEY on (post_id, tag_id)
-- Additional indexes for reverse lookups
CREATE INDEX idx_post_tags_tag_id ON post_tags(tag_id);
CREATE INDEX idx_post_tags_created_at ON post_tags(created_at);

-- ============================================================================
-- Comments Table Indexes
-- ============================================================================

-- Comments by post
CREATE INDEX idx_comments_post_id ON comments(post_id);

-- Comments by user
CREATE INDEX idx_comments_user_id ON comments(user_id);

-- Hierarchical comments (replies)
CREATE INDEX idx_comments_parent_id ON comments(parent_id);

-- Comment status filtering
CREATE INDEX idx_comments_status ON comments(status);

-- Comment creation date
CREATE INDEX idx_comments_created_at ON comments(created_at);

-- Popular comments
CREATE INDEX idx_comments_like_count ON comments(like_count DESC);

-- Pinned comments
CREATE INDEX idx_comments_is_pinned ON comments(is_pinned);

-- Composite index for approved comments by post and date
CREATE INDEX idx_comments_post_status_date ON comments(post_id, status, created_at DESC) WHERE status = 'approved';

-- ============================================================================
-- File Uploads Table Indexes
-- ============================================================================

-- Files by uploader
CREATE INDEX idx_file_uploads_user_id ON file_uploads(user_id);

-- File name lookups
CREATE INDEX idx_file_uploads_file_name ON file_uploads(file_name);

-- MIME type filtering
CREATE INDEX idx_file_uploads_mime_type ON file_uploads(mime_type);

-- Upload type categorization
CREATE INDEX idx_file_uploads_upload_type ON file_uploads(upload_type);

-- Public files filtering
CREATE INDEX idx_file_uploads_is_public ON file_uploads(is_public);

-- Upload date
CREATE INDEX idx_file_uploads_created_at ON file_uploads(created_at);

-- File size for storage analytics
CREATE INDEX idx_file_uploads_file_size ON file_uploads(file_size);

-- ============================================================================
-- Settings Table Indexes
-- ============================================================================

-- Setting key lookup (primary access pattern)
CREATE INDEX idx_settings_key_name ON settings(key_name);

-- Settings by category
CREATE INDEX idx_settings_category ON settings(category);

-- Public settings (API access)
CREATE INDEX idx_settings_is_public ON settings(is_public);

-- Data type filtering
CREATE INDEX idx_settings_data_type ON settings(data_type);

-- ============================================================================
-- Activity Logs Table Indexes
-- ============================================================================

-- Activity by user
CREATE INDEX idx_activity_logs_user_id ON activity_logs(user_id);

-- Activity by action type
CREATE INDEX idx_activity_logs_action ON activity_logs(action);

-- Activity by resource
CREATE INDEX idx_activity_logs_resource_type ON activity_logs(resource_type);
CREATE INDEX idx_activity_logs_resource_id ON activity_logs(resource_id);

-- Activity timeline
CREATE INDEX idx_activity_logs_created_at ON activity_logs(created_at DESC);

-- Composite index for resource activity
CREATE INDEX idx_activity_logs_resource ON activity_logs(resource_type, resource_id, created_at DESC);

-- User activity timeline
CREATE INDEX idx_activity_logs_user_timeline ON activity_logs(user_id, created_at DESC);

-- ============================================================================
-- Full-Text Search Indexes (PostgreSQL)
-- ============================================================================

-- Uncomment for PostgreSQL full-text search:
/*
-- Create GIN indexes for full-text search
CREATE INDEX idx_posts_fulltext ON posts USING gin(to_tsvector('english', title || ' ' || COALESCE(content, '')));
CREATE INDEX idx_comments_fulltext ON comments USING gin(to_tsvector('english', content));
CREATE INDEX idx_users_fulltext ON users USING gin(to_tsvector('english', username || ' ' || COALESCE(first_name, '') || ' ' || COALESCE(last_name, '')));
*/

-- ============================================================================
-- Full-Text Search Indexes (MySQL)
-- ============================================================================

-- Uncomment for MySQL full-text search:
/*
-- Create FULLTEXT indexes
ALTER TABLE posts ADD FULLTEXT(title, content);
ALTER TABLE comments ADD FULLTEXT(content);
ALTER TABLE users ADD FULLTEXT(username, first_name, last_name);
*/

-- ============================================================================
-- Partial Indexes (PostgreSQL) - For better performance
-- ============================================================================

-- Uncomment for PostgreSQL partial indexes:
/*
-- Index only active users' emails
CREATE INDEX idx_users_active_email ON users(email) WHERE is_active = true;

-- Index only published posts
CREATE INDEX idx_posts_published_created_at ON posts(created_at DESC) WHERE status = 'published';

-- Index only approved comments
CREATE INDEX idx_comments_approved_post_date ON comments(post_id, created_at DESC) WHERE status = 'approved';

-- Index only unused password reset tokens
CREATE INDEX idx_password_reset_unused ON password_reset_tokens(expires_at) WHERE used_at IS NULL;

-- Index only unverified email tokens
CREATE INDEX idx_email_verification_pending ON email_verification_tokens(expires_at) WHERE verified_at IS NULL;
*/

-- ============================================================================
-- Check Constraints (Data Validation)
-- ============================================================================

-- Uncomment to add data validation constraints:
/*
-- Ensure valid email format (basic check)
ALTER TABLE users ADD CONSTRAINT chk_users_email_format
    CHECK (email ~* '^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$');

-- Ensure valid post status
ALTER TABLE posts ADD CONSTRAINT chk_posts_status
    CHECK (status IN ('draft', 'published', 'archived'));

-- Ensure valid post visibility
ALTER TABLE posts ADD CONSTRAINT chk_posts_visibility
    CHECK (visibility IN ('public', 'private', 'unlisted'));

-- Ensure valid comment status
ALTER TABLE comments ADD CONSTRAINT chk_comments_status
    CHECK (status IN ('pending', 'approved', 'rejected', 'spam'));

-- Ensure positive file size
ALTER TABLE file_uploads ADD CONSTRAINT chk_file_uploads_size_positive
    CHECK (file_size > 0);

-- Ensure view counts are non-negative
ALTER TABLE posts ADD CONSTRAINT chk_posts_view_count_positive
    CHECK (view_count >= 0);

-- Ensure like counts are non-negative
ALTER TABLE posts ADD CONSTRAINT chk_posts_like_count_positive
    CHECK (like_count >= 0);

ALTER TABLE comments ADD CONSTRAINT chk_comments_like_count_positive
    CHECK (like_count >= 0);
*/

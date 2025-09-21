-- ============================================================================
-- Test Environment Seed Data
-- ============================================================================
-- This file contains minimal sample data for automated testing
-- Designed to be fast and consistent for test suites

-- ============================================================================
-- Test Roles
-- ============================================================================

INSERT INTO roles (id, name, description, permissions, is_active) VALUES
(1, 'test_admin', 'Test Administrator', '{"all": true}', true),
(2, 'test_user', 'Test User', '{"posts": ["read"], "comments": ["create", "read"]}', true);

-- ============================================================================
-- Test Users
-- ============================================================================

INSERT INTO users (id, email, username, password_hash, first_name, last_name, email_verified, is_active) VALUES
(1, 'test.admin@test.com', 'testadmin', '$2y$10$test_hash_admin', 'Test', 'Admin', true, true),
(2, 'test.user@test.com', 'testuser', '$2y$10$test_hash_user', 'Test', 'User', true, true),
(3, 'test.unverified@test.com', 'testunverified', '$2y$10$test_hash_unverified', 'Test', 'Unverified', false, true),
(4, 'test.inactive@test.com', 'testinactive', '$2y$10$test_hash_inactive', 'Test', 'Inactive', true, false);

-- ============================================================================
-- Assign Test Roles
-- ============================================================================

INSERT INTO user_roles (user_id, role_id, assigned_by) VALUES
(1, 1, 1), -- Test admin gets admin role
(2, 2, 1), -- Test user gets user role
(3, 2, 1), -- Unverified user gets user role
(4, 2, 1); -- Inactive user gets user role

-- ============================================================================
-- Test User Profiles
-- ============================================================================

INSERT INTO user_profiles (id, user_id, bio, location, timezone, language) VALUES
(1, 1, 'Test administrator profile', 'Test City', 'UTC', 'en'),
(2, 2, 'Test user profile', 'Test City', 'UTC', 'en'),
(3, 3, 'Unverified user profile', 'Test City', 'UTC', 'en'),
(4, 4, 'Inactive user profile', 'Test City', 'UTC', 'en');

-- ============================================================================
-- Test Categories
-- ============================================================================

INSERT INTO categories (id, name, slug, description, is_active) VALUES
(1, 'Test Category 1', 'test-category-1', 'First test category', true),
(2, 'Test Category 2', 'test-category-2', 'Second test category', true),
(3, 'Inactive Category', 'inactive-category', 'Inactive test category', false);

-- ============================================================================
-- Test Tags
-- ============================================================================

INSERT INTO tags (id, name, slug, description, usage_count) VALUES
(1, 'Test Tag 1', 'test-tag-1', 'First test tag', 1),
(2, 'Test Tag 2', 'test-tag-2', 'Second test tag', 1),
(3, 'Unused Tag', 'unused-tag', 'Unused test tag', 0);

-- ============================================================================
-- Test Posts
-- ============================================================================

INSERT INTO posts (id, user_id, title, slug, content, excerpt, status, visibility, published_at, view_count, like_count) VALUES
(1, 1, 'Test Published Post', 'test-published-post',
 'This is a published test post content.',
 'Published test post excerpt',
 'published', 'public', '2024-01-01 12:00:00', 10, 2),

(2, 2, 'Test Draft Post', 'test-draft-post',
 'This is a draft test post content.',
 'Draft test post excerpt',
 'draft', 'private', null, 0, 0),

(3, 1, 'Test Private Post', 'test-private-post',
 'This is a private test post content.',
 'Private test post excerpt',
 'published', 'private', '2024-01-02 12:00:00', 5, 1);

-- ============================================================================
-- Associate Test Posts with Categories
-- ============================================================================

INSERT INTO post_categories (post_id, category_id) VALUES
(1, 1), -- Published post in category 1
(2, 2), -- Draft post in category 2
(3, 1); -- Private post in category 1

-- ============================================================================
-- Associate Test Posts with Tags
-- ============================================================================

INSERT INTO post_tags (post_id, tag_id) VALUES
(1, 1), (1, 2), -- Published post has both test tags
(2, 1),         -- Draft post has tag 1
(3, 2);         -- Private post has tag 2

-- ============================================================================
-- Test Comments
-- ============================================================================

INSERT INTO comments (id, post_id, user_id, content, status) VALUES
(1, 1, 2, 'This is an approved test comment.', 'approved'),
(2, 1, 1, 'This is a pending test comment.', 'pending'),
(3, 3, 2, 'This is a rejected test comment.', 'rejected');

-- ============================================================================
-- Test File Uploads
-- ============================================================================

INSERT INTO file_uploads (id, user_id, original_name, file_name, file_path, file_size, mime_type, upload_type, is_public) VALUES
(1, 1, 'test-image.jpg', 'test_123.jpg', '/test/uploads/test_123.jpg', 1024, 'image/jpeg', 'test', true),
(2, 2, 'test-private.pdf', 'test_456.pdf', '/test/uploads/test_456.pdf', 2048, 'application/pdf', 'test', false);

-- ============================================================================
-- Test Settings
-- ============================================================================

INSERT INTO settings (id, key_name, value_text, data_type, category, is_public) VALUES
(1, 'test_setting_string', 'test_value', 'string', 'test', true),
(2, 'test_setting_number', '42', 'number', 'test', true),
(3, 'test_setting_boolean', 'true', 'boolean', 'test', false),
(4, 'test_private_setting', 'private_value', 'string', 'test', false);

-- ============================================================================
-- Test Activity Logs
-- ============================================================================

INSERT INTO activity_logs (id, user_id, action, resource_type, resource_id, ip_address) VALUES
(1, 1, 'test_login', 'users', 1, '127.0.0.1'),
(2, 2, 'test_post_created', 'posts', 1, '127.0.0.1'),
(3, 1, 'test_comment_approved', 'comments', 1, '127.0.0.1');

-- ============================================================================
-- Test Authentication Tokens
-- ============================================================================

-- Password reset token (expires in 1 hour from now)
INSERT INTO password_reset_tokens (id, user_id, token, expires_at) VALUES
(1, 2, 'test_reset_token_123', datetime('now', '+1 hour')); -- SQLite
-- (1, 2, 'test_reset_token_123', NOW() + INTERVAL 1 HOUR); -- MySQL
-- (1, 2, 'test_reset_token_123', NOW() + INTERVAL '1 hour'); -- PostgreSQL

-- Email verification token (expires in 24 hours from now)
INSERT INTO email_verification_tokens (id, user_id, token, expires_at) VALUES
(1, 3, 'test_verify_token_456', datetime('now', '+1 day')); -- SQLite
-- (1, 3, 'test_verify_token_456', NOW() + INTERVAL 1 DAY); -- MySQL
-- (1, 3, 'test_verify_token_456', NOW() + INTERVAL '1 day'); -- PostgreSQL

-- ============================================================================
-- Update sequence counters (PostgreSQL)
-- ============================================================================

-- Uncomment for PostgreSQL:
/*
SELECT setval('users_id_seq', (SELECT MAX(id) FROM users));
SELECT setval('user_profiles_id_seq', (SELECT MAX(id) FROM user_profiles));
SELECT setval('posts_id_seq', (SELECT MAX(id) FROM posts));
SELECT setval('categories_id_seq', (SELECT MAX(id) FROM categories));
SELECT setval('tags_id_seq', (SELECT MAX(id) FROM tags));
SELECT setval('comments_id_seq', (SELECT MAX(id) FROM comments));
SELECT setval('file_uploads_id_seq', (SELECT MAX(id) FROM file_uploads));
SELECT setval('settings_id_seq', (SELECT MAX(id) FROM settings));
SELECT setval('roles_id_seq', (SELECT MAX(id) FROM roles));
SELECT setval('activity_logs_id_seq', (SELECT MAX(id) FROM activity_logs));
SELECT setval('password_reset_tokens_id_seq', (SELECT MAX(id) FROM password_reset_tokens));
SELECT setval('email_verification_tokens_id_seq', (SELECT MAX(id) FROM email_verification_tokens));
*/

-- ============================================================================
-- Test Data Verification
-- ============================================================================

-- Basic counts for test verification
-- SELECT 'Test data verification:' as message;
-- SELECT COUNT(*) as total_users FROM users;
-- SELECT COUNT(*) as total_posts FROM posts;
-- SELECT COUNT(*) as published_posts FROM posts WHERE status = 'published';
-- SELECT COUNT(*) as approved_comments FROM comments WHERE status = 'approved';

-- ============================================================================
-- Success Message
-- ============================================================================

-- PostgreSQL
-- DO $$
-- BEGIN
--   RAISE NOTICE 'Test seed data loaded successfully!';
--   RAISE NOTICE 'Test environment is ready for automated testing.';
-- END $$;

-- MySQL
-- SELECT 'Test seed data loaded successfully!' as message;

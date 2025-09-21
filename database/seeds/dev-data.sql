-- ============================================================================
-- Development Seed Data
-- ============================================================================
-- This file contains sample data for development and testing
-- WARNING: Do not run this in production!

-- ============================================================================
-- Clear existing data (development only)
-- ============================================================================

-- Disable foreign key checks temporarily (MySQL)
-- SET FOREIGN_KEY_CHECKS = 0;

-- PostgreSQL: Use CASCADE to handle foreign keys
-- TRUNCATE users, user_profiles, posts, categories, tags, comments, file_uploads, settings, roles CASCADE;

-- MySQL: Delete in dependency order
-- DELETE FROM activity_logs;
-- DELETE FROM user_sessions;
-- DELETE FROM password_reset_tokens;
-- DELETE FROM email_verification_tokens;
-- DELETE FROM user_roles;
-- DELETE FROM post_tags;
-- DELETE FROM post_categories;
-- DELETE FROM comments;
-- DELETE FROM file_uploads;
-- DELETE FROM posts;
-- DELETE FROM user_profiles;
-- DELETE FROM users;
-- DELETE FROM tags;
-- DELETE FROM categories;
-- DELETE FROM roles;
-- DELETE FROM settings;

-- Re-enable foreign key checks (MySQL)
-- SET FOREIGN_KEY_CHECKS = 1;

-- ============================================================================
-- Sample Roles
-- ============================================================================

INSERT INTO roles (id, name, description, permissions, is_active) VALUES
(1, 'admin', 'System Administrator', '{"all": true}', true),
(2, 'editor', 'Content Editor', '{"posts": ["create", "read", "update", "delete"], "comments": ["moderate"]}', true),
(3, 'author', 'Content Author', '{"posts": ["create", "read", "update"], "comments": ["read"]}', true),
(4, 'user', 'Regular User', '{"posts": ["read"], "comments": ["create", "read"]}', true);

-- ============================================================================
-- Sample Users
-- ============================================================================

INSERT INTO users (id, email, username, password_hash, first_name, last_name, email_verified, is_active) VALUES
(1, 'admin@example.com', 'admin', '$2y$10$example_hash_admin', 'System', 'Administrator', true, true),
(2, 'editor@example.com', 'editor', '$2y$10$example_hash_editor', 'Content', 'Editor', true, true),
(3, 'author@example.com', 'author', '$2y$10$example_hash_author', 'John', 'Author', true, true),
(4, 'user@example.com', 'user', '$2y$10$example_hash_user', 'Jane', 'User', true, true),
(5, 'inactive@example.com', 'inactive', '$2y$10$example_hash_inactive', 'Inactive', 'User', false, false);

-- ============================================================================
-- Assign Roles to Users
-- ============================================================================

INSERT INTO user_roles (user_id, role_id, assigned_by) VALUES
(1, 1, 1), -- Admin gets admin role
(2, 2, 1), -- Editor gets editor role
(3, 3, 1), -- Author gets author role
(4, 4, 1), -- User gets user role
(5, 4, 1); -- Inactive user gets user role

-- ============================================================================
-- Sample User Profiles
-- ============================================================================

INSERT INTO user_profiles (id, user_id, bio, website, location, timezone, language) VALUES
(1, 1, 'System administrator with 10+ years experience', 'https://admin.example.com', 'San Francisco, CA', 'America/Los_Angeles', 'en'),
(2, 2, 'Content editor passionate about technology and writing', 'https://editor.example.com', 'New York, NY', 'America/New_York', 'en'),
(3, 3, 'Freelance writer and blogger', 'https://author.example.com', 'Austin, TX', 'America/Chicago', 'en'),
(4, 4, 'Technology enthusiast and early adopter', null, 'Seattle, WA', 'America/Los_Angeles', 'en'),
(5, 5, 'Former user account - no longer active', null, 'Unknown', 'UTC', 'en');

-- ============================================================================
-- Sample Categories
-- ============================================================================

INSERT INTO categories (id, name, slug, description, parent_id, sort_order, is_active) VALUES
(1, 'Technology', 'technology', 'Latest in technology and innovation', null, 1, true),
(2, 'Web Development', 'web-development', 'Frontend and backend development', 1, 1, true),
(3, 'Mobile Development', 'mobile-development', 'iOS and Android development', 1, 2, true),
(4, 'Design', 'design', 'UI/UX and graphic design', null, 2, true),
(5, 'Business', 'business', 'Business and entrepreneurship', null, 3, true),
(6, 'Marketing', 'marketing', 'Digital marketing and growth', 5, 1, true),
(7, 'Lifestyle', 'lifestyle', 'Personal development and lifestyle', null, 4, true);

-- ============================================================================
-- Sample Tags
-- ============================================================================

INSERT INTO tags (id, name, slug, description, color, usage_count) VALUES
(1, 'React', 'react', 'React.js library and ecosystem', '#61DAFB', 15),
(2, 'TypeScript', 'typescript', 'TypeScript programming language', '#3178C6', 12),
(3, 'Node.js', 'nodejs', 'Node.js runtime environment', '#339933', 10),
(4, 'JavaScript', 'javascript', 'JavaScript programming language', '#F7DF1E', 20),
(5, 'CSS', 'css', 'Cascading Style Sheets', '#1572B6', 8),
(6, 'HTML', 'html', 'HyperText Markup Language', '#E34F26', 6),
(7, 'Database', 'database', 'Database design and management', '#336791', 5),
(8, 'API', 'api', 'Application Programming Interfaces', '#FF6B6B', 7),
(9, 'Tutorial', 'tutorial', 'Step-by-step tutorials', '#4ECDC4', 25),
(10, 'Tips', 'tips', 'Quick tips and tricks', '#45B7D1', 18);

-- ============================================================================
-- Sample Posts
-- ============================================================================

INSERT INTO posts (id, user_id, title, slug, content, excerpt, status, visibility, published_at, view_count, like_count) VALUES
(1, 3, 'Getting Started with React and TypeScript', 'getting-started-react-typescript',
 'In this comprehensive guide, we''ll explore how to set up a React project with TypeScript...',
 'Learn how to combine React with TypeScript for better development experience',
 'published', 'public', '2024-01-15 10:00:00', 150, 12),

(2, 3, 'Building RESTful APIs with Node.js', 'building-restful-apis-nodejs',
 'Creating robust and scalable APIs is essential for modern web applications...',
 'A complete guide to building REST APIs using Node.js and Express',
 'published', 'public', '2024-01-20 14:30:00', 89, 8),

(3, 2, 'CSS Grid vs Flexbox: When to Use Which', 'css-grid-vs-flexbox',
 'Understanding the differences between CSS Grid and Flexbox is crucial...',
 'Compare CSS Grid and Flexbox to choose the right layout method',
 'published', 'public', '2024-01-25 09:15:00', 234, 19),

(4, 3, 'Database Design Best Practices', 'database-design-best-practices',
 'Proper database design is the foundation of any successful application...',
 'Essential principles for designing efficient and scalable databases',
 'draft', 'private', null, 0, 0),

(5, 2, 'Modern JavaScript Features You Should Know', 'modern-javascript-features',
 'JavaScript has evolved significantly over the years. Let''s explore the latest features...',
 'Discover the most useful modern JavaScript features and how to use them',
 'published', 'public', '2024-02-01 11:45:00', 312, 25);

-- ============================================================================
-- Associate Posts with Categories
-- ============================================================================

INSERT INTO post_categories (post_id, category_id) VALUES
(1, 1), (1, 2), -- React/TypeScript post in Technology and Web Development
(2, 1), (2, 2), -- Node.js API post in Technology and Web Development
(3, 1), (3, 4), -- CSS post in Technology and Design
(4, 1),         -- Database post in Technology
(5, 1), (5, 2); -- JavaScript post in Technology and Web Development

-- ============================================================================
-- Associate Posts with Tags
-- ============================================================================

INSERT INTO post_tags (post_id, tag_id) VALUES
(1, 1), (1, 2), (1, 9), -- React, TypeScript, Tutorial
(2, 3), (2, 4), (2, 8), (2, 9), -- Node.js, JavaScript, API, Tutorial
(3, 5), (3, 10), -- CSS, Tips
(4, 7), (4, 10), -- Database, Tips
(5, 4), (5, 10); -- JavaScript, Tips

-- ============================================================================
-- Sample Comments
-- ============================================================================

INSERT INTO comments (id, post_id, user_id, content, status) VALUES
(1, 1, 4, 'Great tutorial! This helped me understand TypeScript with React much better.', 'approved'),
(2, 1, 2, 'Thanks for the detailed explanation. Could you add more examples?', 'approved'),
(3, 2, 4, 'Very helpful guide. I''m going to try this approach in my next project.', 'approved'),
(4, 3, 1, 'Excellent comparison! I always wondered when to use Grid vs Flexbox.', 'approved'),
(5, 5, 4, 'These JavaScript features are game-changers. Thanks for sharing!', 'approved'),
(6, 1, 5, 'This is spam content.', 'spam'); -- Example spam comment

-- ============================================================================
-- Sample File Uploads
-- ============================================================================

INSERT INTO file_uploads (id, user_id, original_name, file_name, file_path, file_size, mime_type, upload_type, is_public) VALUES
(1, 1, 'admin-avatar.jpg', 'admin_123456789.jpg', '/uploads/avatars/admin_123456789.jpg', 45678, 'image/jpeg', 'avatar', true),
(2, 2, 'editor-profile.png', 'editor_987654321.png', '/uploads/avatars/editor_987654321.png', 23456, 'image/png', 'avatar', true),
(3, 3, 'react-tutorial-banner.jpg', 'post_111111111.jpg', '/uploads/posts/post_111111111.jpg', 87654, 'image/jpeg', 'post_image', true),
(4, 3, 'api-diagram.png', 'post_222222222.png', '/uploads/posts/post_222222222.png', 56789, 'image/png', 'post_image', true),
(5, 4, 'private-document.pdf', 'doc_333333333.pdf', '/uploads/documents/doc_333333333.pdf', 123456, 'application/pdf', 'document', false);

-- ============================================================================
-- Sample Settings
-- ============================================================================

INSERT INTO settings (id, key_name, value_text, data_type, category, description, is_public) VALUES
(1, 'site_name', 'Awesome Project', 'string', 'general', 'Name of the website', true),
(2, 'site_description', 'A modern, beautiful, and well-structured project', 'string', 'general', 'Site description for SEO', true),
(3, 'posts_per_page', '10', 'number', 'display', 'Number of posts to show per page', true),
(4, 'allow_registration', 'true', 'boolean', 'user', 'Allow new user registration', false),
(5, 'email_verification_required', 'true', 'boolean', 'user', 'Require email verification for new accounts', false),
(6, 'max_file_upload_size', '5242880', 'number', 'upload', 'Maximum file upload size in bytes (5MB)', false),
(7, 'smtp_host', 'smtp.example.com', 'string', 'email', 'SMTP server hostname', false),
(8, 'maintenance_mode', 'false', 'boolean', 'system', 'Enable maintenance mode', false);

-- ============================================================================
-- Sample Activity Logs
-- ============================================================================

INSERT INTO activity_logs (id, user_id, action, resource_type, resource_id, ip_address) VALUES
(1, 1, 'user_login', 'users', 1, '192.168.1.100'),
(2, 2, 'user_login', 'users', 2, '192.168.1.101'),
(3, 3, 'post_created', 'posts', 1, '192.168.1.102'),
(4, 3, 'post_published', 'posts', 1, '192.168.1.102'),
(5, 4, 'comment_created', 'comments', 1, '192.168.1.103'),
(6, 2, 'comment_approved', 'comments', 1, '192.168.1.101'),
(7, 3, 'post_created', 'posts', 2, '192.168.1.102'),
(8, 1, 'user_role_assigned', 'users', 2, '192.168.1.100'),
(9, 4, 'file_uploaded', 'file_uploads', 5, '192.168.1.103'),
(10, 1, 'settings_updated', 'settings', 8, '192.168.1.100');

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
*/

-- ============================================================================
-- Success Message
-- ============================================================================

-- PostgreSQL
-- DO $$
-- BEGIN
--   RAISE NOTICE 'Development seed data loaded successfully!';
--   RAISE NOTICE 'Sample users, posts, and other data are now available.';
--   RAISE NOTICE 'You can now test the application with realistic data.';
-- END $$;

-- MySQL
-- SELECT 'Development seed data loaded successfully!' as message;

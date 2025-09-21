-- ============================================================================
-- Database Cleanup Script
-- ============================================================================
-- This script removes all tables and data - USE WITH CAUTION!
-- Only run this in development environments

-- ============================================================================
-- WARNING: This will delete all data!
-- ============================================================================
-- Uncomment the following line to confirm you want to run this script
-- SET @confirm_cleanup = 'YES_DELETE_ALL_DATA';

-- ============================================================================
-- Drop Tables (in reverse dependency order)
-- ============================================================================

-- Drop application tables first
-- DROP TABLE IF EXISTS posts CASCADE;
-- DROP TABLE IF EXISTS user_profiles CASCADE;
-- DROP TABLE IF EXISTS users CASCADE;

-- PostgreSQL: Drop custom functions
-- DROP FUNCTION IF EXISTS trigger_set_timestamp() CASCADE;

-- ============================================================================
-- Drop Indexes (if they exist independently)
-- ============================================================================

-- Example indexes (adjust based on your schema)
-- DROP INDEX IF EXISTS idx_users_email;
-- DROP INDEX IF EXISTS idx_users_created_at;
-- DROP INDEX IF EXISTS idx_posts_user_id;
-- DROP INDEX IF EXISTS idx_posts_published_at;

-- ============================================================================
-- Drop Sequences (PostgreSQL)
-- ============================================================================

-- DROP SEQUENCE IF EXISTS users_id_seq CASCADE;
-- DROP SEQUENCE IF EXISTS posts_id_seq CASCADE;

-- ============================================================================
-- Reset Auto Increment (MySQL)
-- ============================================================================

-- ALTER TABLE users AUTO_INCREMENT = 1;
-- ALTER TABLE posts AUTO_INCREMENT = 1;

-- ============================================================================
-- Drop Schema (PostgreSQL)
-- ============================================================================

-- DROP SCHEMA IF EXISTS app_schema CASCADE;

-- ============================================================================
-- Drop Database Users (Optional)
-- ============================================================================

-- PostgreSQL
-- DROP USER IF EXISTS app_user;

-- MySQL
-- DROP USER IF EXISTS 'app_user'@'localhost';
-- FLUSH PRIVILEGES;

-- ============================================================================
-- Completion Message
-- ============================================================================

-- PostgreSQL
-- DO $$
-- BEGIN
--   RAISE NOTICE 'Database cleanup completed!';
--   RAISE NOTICE 'All tables, functions, and data have been removed.';
--   RAISE NOTICE 'You can now run setup.sql to recreate the database structure.';
-- END $$;

-- MySQL
-- SELECT 'Database cleanup completed!' as message;
-- SELECT 'All tables and data have been removed.' as status;
-- SELECT 'Run setup.sql to recreate the database structure.' as next_step;

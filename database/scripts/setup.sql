-- ============================================================================
-- Initial Database Setup Script
-- ============================================================================
-- This script creates the initial database structure and configuration
-- Run this script first before executing any schema files

-- Create database (PostgreSQL)
-- Note: Run this command outside of a database context
-- CREATE DATABASE your_project_name WITH ENCODING 'UTF8' LC_COLLATE='en_US.UTF-8' LC_CTYPE='en_US.UTF-8';

-- Create database (MySQL)
-- CREATE DATABASE your_project_name CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- ============================================================================
-- Extensions and Features (PostgreSQL)
-- ============================================================================

-- Enable UUID extension for generating unique identifiers
-- Uncomment if using PostgreSQL
-- CREATE EXTENSION IF NOT EXISTS "uuid-ossp";
-- CREATE EXTENSION IF NOT EXISTS "pgcrypto";

-- ============================================================================
-- Database Configuration
-- ============================================================================

-- Set timezone (adjust as needed)
-- PostgreSQL
-- SET timezone = 'UTC';

-- MySQL
-- SET time_zone = '+00:00';

-- ============================================================================
-- Create Schema/Database
-- ============================================================================

-- PostgreSQL: Create schema if using schema-based organization
-- CREATE SCHEMA IF NOT EXISTS app_schema;
-- SET search_path TO app_schema, public;

-- ============================================================================
-- Initial Functions and Procedures
-- ============================================================================

-- PostgreSQL: Function to update updated_at timestamp
-- Uncomment if using PostgreSQL
/*
CREATE OR REPLACE FUNCTION trigger_set_timestamp()
RETURNS TRIGGER AS $$
BEGIN
  NEW.updated_at = NOW();
  RETURN NEW;
END;
$$ LANGUAGE plpgsql;
*/

-- ============================================================================
-- Database User Setup (Optional)
-- ============================================================================

-- Create application user with limited permissions
-- Uncomment and modify as needed

-- PostgreSQL
/*
CREATE USER app_user WITH PASSWORD 'secure_password_here';
GRANT CONNECT ON DATABASE your_project_name TO app_user;
GRANT USAGE ON SCHEMA app_schema TO app_user;
GRANT CREATE ON SCHEMA app_schema TO app_user;
*/

-- MySQL
/*
CREATE USER 'app_user'@'localhost' IDENTIFIED BY 'secure_password_here';
GRANT SELECT, INSERT, UPDATE, DELETE ON your_project_name.* TO 'app_user'@'localhost';
FLUSH PRIVILEGES;
*/

-- ============================================================================
-- Completion Message
-- ============================================================================

-- PostgreSQL
-- DO $$
-- BEGIN
--   RAISE NOTICE 'Database setup completed successfully!';
--   RAISE NOTICE 'Next steps:';
--   RAISE NOTICE '1. Run schema files: 01-users.sql, 02-core.sql';
--   RAISE NOTICE '2. Run indexes: 99-indexes.sql';
--   RAISE NOTICE '3. Load seed data if needed';
-- END $$;

-- MySQL
-- SELECT 'Database setup completed successfully!' as message;
-- SELECT 'Run schema files next: 01-users.sql, 02-core.sql, 99-indexes.sql' as next_steps;

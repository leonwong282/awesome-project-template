-- ============================================================================
-- Migration Template
-- ============================================================================
-- Migration Name: [DESCRIPTIVE_NAME]
-- Created: [YYYY-MM-DD]
-- Author: [AUTHOR_NAME]
-- Description: [DETAILED DESCRIPTION OF WHAT THIS MIGRATION DOES]
--
-- Dependencies: [LIST ANY PREREQUISITE MIGRATIONS]
-- Estimated Time: [EXPECTED EXECUTION TIME]
-- Impact: [HIGH/MEDIUM/LOW - DESCRIBE POTENTIAL IMPACT]
--
-- IMPORTANT: Test this migration in a development environment first!
-- ============================================================================

-- ============================================================================
-- BEGIN TRANSACTION (uncomment for databases that support it)
-- ============================================================================
-- BEGIN; -- PostgreSQL, SQLite
-- START TRANSACTION; -- MySQL

-- ============================================================================
-- MIGRATION UP - Apply Changes
-- ============================================================================

-- Example: Creating a new table
/*
CREATE TABLE example_table (
    id BIGINT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    description TEXT,
    status VARCHAR(20) DEFAULT 'active',
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

-- Add indexes
CREATE INDEX idx_example_table_name ON example_table(name);
CREATE INDEX idx_example_table_status ON example_table(status);
*/

-- Example: Adding a column to existing table
/*
ALTER TABLE users ADD COLUMN middle_name VARCHAR(100);
*/

-- Example: Creating an index
/*
CREATE INDEX idx_users_last_login ON users(last_login_at);
*/

-- Example: Data migration
/*
UPDATE users SET email_verified = TRUE WHERE email_verified_at IS NOT NULL;
*/

-- Example: Adding a constraint
/*
ALTER TABLE posts ADD CONSTRAINT chk_posts_status
    CHECK (status IN ('draft', 'published', 'archived'));
*/

-- ============================================================================
-- DATA VALIDATION (Optional)
-- ============================================================================

-- Verify the migration worked as expected
/*
-- Check that new table was created
SELECT COUNT(*) as table_exists
FROM information_schema.tables
WHERE table_name = 'example_table';

-- Verify data integrity
SELECT COUNT(*) as verified_users
FROM users
WHERE email_verified = TRUE AND email_verified_at IS NOT NULL;

-- Check constraint was added
SELECT COUNT(*) as constraint_exists
FROM information_schema.check_constraints
WHERE constraint_name = 'chk_posts_status';
*/

-- ============================================================================
-- ROLLBACK INSTRUCTIONS - How to undo these changes
-- ============================================================================

-- IMPORTANT: The following section shows how to rollback this migration
-- DO NOT EXECUTE the rollback section during normal migration!
-- This is for reference only and should be run separately if rollback is needed.

/*
-- ============================================================================
-- MIGRATION DOWN - Rollback Changes
-- ============================================================================

-- Example: Drop the table created above
DROP TABLE IF EXISTS example_table;

-- Example: Remove the column added above
ALTER TABLE users DROP COLUMN middle_name;

-- Example: Drop the index created above
DROP INDEX IF EXISTS idx_users_last_login;

-- Example: Revert data changes (if possible)
UPDATE users SET email_verified = FALSE WHERE email_verified_at IS NULL;

-- Example: Drop constraint
ALTER TABLE posts DROP CONSTRAINT IF EXISTS chk_posts_status;

-- ============================================================================
-- END ROLLBACK SECTION
-- ============================================================================
*/

-- ============================================================================
-- COMMIT TRANSACTION (uncomment for databases that support it)
-- ============================================================================
-- COMMIT; -- PostgreSQL, MySQL, SQLite

-- ============================================================================
-- MIGRATION TRACKING (if using manual tracking)
-- ============================================================================

-- Record this migration in the tracking table
/*
INSERT INTO schema_migrations (version, applied_at)
VALUES ('YYYYMMDDHHMMSS', CURRENT_TIMESTAMP);
*/

-- ============================================================================
-- POST-MIGRATION NOTES
-- ============================================================================
-- Add any important notes about this migration:
-- - Performance considerations
-- - Required application updates
-- - Monitoring recommendations
-- - Follow-up tasks
-- ============================================================================

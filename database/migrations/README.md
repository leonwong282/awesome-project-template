# 🔄 Database Migrations

This directory contains database migration templates and examples for managing database schema changes over time.

## 📁 Migration File Naming Convention

```
YYYYMMDDHHMMSS_descriptive_name.sql
```

Examples:
- `20241221120000_create_users_table.sql`
- `20241221130000_add_email_verification_to_users.sql`
- `20241221140000_create_posts_table.sql`

## 📋 Migration Template Structure

Each migration file should contain:
1. **Header comment** - Description and metadata
2. **UP section** - Forward migration (apply changes)
3. **DOWN section** - Rollback migration (undo changes)
4. **Validation** - Optional data validation after migration

## 🚀 Usage

### Running Migrations

```bash
# Apply all pending migrations
./scripts/migrate.sh up

# Apply specific migration
./scripts/migrate.sh up 20241221120000

# Rollback last migration
./scripts/migrate.sh down

# Rollback to specific migration
./scripts/migrate.sh down 20241221120000

# Show migration status
./scripts/migrate.sh status
```

### Creating New Migrations

1. Copy the `template.sql` file
2. Rename with current timestamp and descriptive name
3. Fill in the UP and DOWN sections
4. Test both directions thoroughly

## 📚 Migration Best Practices

### Do's ✅
- **Make migrations atomic** - Each migration should be a single, complete change
- **Always include rollback** - Every UP should have a corresponding DOWN
- **Test both directions** - Test applying and rolling back migrations
- **Use descriptive names** - Clear, concise description of what the migration does
- **Keep migrations small** - One logical change per migration
- **Add comments** - Explain complex operations

### Don'ts ❌
- **Don't modify existing migrations** - Once applied to production, treat as immutable
- **Don't delete data without backup** - Always backup before destructive operations
- **Don't skip dependency checks** - Ensure prerequisite migrations are applied
- **Don't use application code** - Migrations should be pure SQL
- **Don't ignore errors** - Handle and report migration failures properly

### Data Migration Guidelines
- **Backup first** - Always backup data before destructive operations
- **Use transactions** - Wrap migrations in transactions where possible
- **Handle large datasets** - Use batch processing for large data migrations
- **Validate results** - Include checks to verify migration success

## 🛠️ Migration Tools

### Manual SQL Execution
```bash
# PostgreSQL
psql -d database_name -f migration_file.sql

# MySQL
mysql -u username -p database_name < migration_file.sql
```

### Popular Migration Tools
- **Flyway** - Database migration tool for Java/JVM
- **Liquibase** - Database schema change management
- **migrate** - Go-based migration tool
- **Alembic** - SQLAlchemy database migration tool (Python)
- **Rails Migrations** - Ruby on Rails migration system

## 📊 Migration Tracking Table

Most migration systems use a tracking table:

```sql
-- Example migration tracking table
CREATE TABLE schema_migrations (
    version VARCHAR(255) PRIMARY KEY,
    applied_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    execution_time_ms INTEGER,
    checksum VARCHAR(64)
);
```

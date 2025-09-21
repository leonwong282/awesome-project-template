# 🗄️ Database Setup Guide

This guide will help you set up the database for your project using the provided SQL templates.

## 🚀 Quick Start

### 1. Choose Your Database System

This template supports three major database systems:

- **PostgreSQL** (Recommended for production)
- **MySQL/MariaDB** (Popular alternative)
- **SQLite** (Perfect for development and testing)

### 2. Create Database and User

#### PostgreSQL
```sql
-- Connect as superuser (postgres)
CREATE DATABASE your_project_name 
    WITH ENCODING 'UTF8' 
    LC_COLLATE='en_US.UTF-8' 
    LC_CTYPE='en_US.UTF-8';

-- Create application user
CREATE USER app_user WITH PASSWORD 'secure_password';
GRANT ALL PRIVILEGES ON DATABASE your_project_name TO app_user;
```

#### MySQL/MariaDB
```sql
-- Connect as root
CREATE DATABASE your_project_name 
    CHARACTER SET utf8mb4 
    COLLATE utf8mb4_unicode_ci;

-- Create application user
CREATE USER 'app_user'@'localhost' IDENTIFIED BY 'secure_password';
GRANT ALL PRIVILEGES ON your_project_name.* TO 'app_user'@'localhost';
FLUSH PRIVILEGES;
```

#### SQLite
```bash
# SQLite databases are created automatically
# Just specify the file path in your connection string
touch database/your_project.sqlite
```

### 3. Run Database Setup

Execute the SQL files in the correct order:

```bash
# 1. Initial setup (creates extensions, functions)
psql -d your_project_name -U app_user -f database/scripts/setup.sql

# 2. User management tables
psql -d your_project_name -U app_user -f database/schema/01-users.sql

# 3. Core application tables
psql -d your_project_name -U app_user -f database/schema/02-core.sql

# 4. Indexes and constraints
psql -d your_project_name -U app_user -f database/schema/99-indexes.sql

# 5. Load sample data (development only)
psql -d your_project_name -U app_user -f database/seeds/dev-data.sql
```

For MySQL, replace `psql` with `mysql`:
```bash
mysql -u app_user -p your_project_name < database/scripts/setup.sql
mysql -u app_user -p your_project_name < database/schema/01-users.sql
# ... continue with other files
```

## 🔧 Environment Configuration

Create a `.env.local` file with your database configuration:

```env
# Database Configuration
DATABASE_URL="postgresql://app_user:secure_password@localhost:5432/your_project_name"

# Individual connection parameters
DATABASE_HOST="localhost"
DATABASE_PORT="5432"
DATABASE_NAME="your_project_name"
DATABASE_USER="app_user"
DATABASE_PASSWORD="secure_password"

# Connection pool settings
DATABASE_POOL_MIN=2
DATABASE_POOL_MAX=10

# For MySQL
# DATABASE_URL="mysql://app_user:secure_password@localhost:3306/your_project_name"

# For SQLite (development)
# DATABASE_URL="sqlite:./database/your_project.sqlite"
```

## 📊 Database Schema Overview

### User Management (`01-users.sql`)
- **users** - Core user accounts and authentication
- **user_profiles** - Extended user information and preferences
- **user_sessions** - Session management and tracking
- **password_reset_tokens** - Password recovery functionality
- **email_verification_tokens** - Email verification system
- **roles** - Role-based access control (RBAC)
- **user_roles** - User-role assignments

### Core Application (`02-core.sql`)
- **posts** - Content management (articles, blogs, etc.)
- **categories** - Hierarchical content categorization
- **tags** - Flexible content tagging system
- **comments** - Nested comment system
- **file_uploads** - File and media management
- **settings** - Application configuration
- **activity_logs** - Audit trail and user activity

### Performance (`99-indexes.sql`)
- Comprehensive indexing strategy
- Full-text search indexes
- Partial indexes for better performance
- Data validation constraints

## 🔄 Database Migrations

### Setting Up Migrations

1. **Choose a migration tool**:
   - [Flyway](https://flywaydb.org/) - Java/JVM
   - [migrate](https://github.com/golang-migrate/migrate) - Go
   - [Alembic](https://alembic.sqlalchemy.org/) - Python
   - Manual SQL scripts

2. **Create migration tracking table**:
```sql
CREATE TABLE schema_migrations (
    version VARCHAR(255) PRIMARY KEY,
    applied_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    execution_time_ms INTEGER,
    checksum VARCHAR(64)
);
```

3. **Use the migration template**:
   - Copy `database/migrations/template.sql`
   - Follow the naming convention: `YYYYMMDDHHMMSS_description.sql`
   - Include both UP and DOWN sections

### Migration Best Practices

- **Test migrations** in development first
- **Backup production data** before running migrations
- **Use transactions** for atomic operations
- **Keep migrations small** and focused
- **Never modify existing migrations** once applied to production

## 🌱 Seed Data

### Development Data
```bash
# Load comprehensive development data
psql -d your_project_name -U app_user -f database/seeds/dev-data.sql
```

### Test Data
```bash
# Load minimal test data for automated testing
psql -d your_project_name -U app_user -f database/seeds/test-data.sql
```

## 🔍 Database Maintenance

### Regular Maintenance Tasks

#### PostgreSQL
```sql
-- Update table statistics
ANALYZE;

-- Rebuild indexes
REINDEX DATABASE your_project_name;

-- Clean up dead tuples
VACUUM;
```

#### MySQL
```sql
-- Optimize tables
OPTIMIZE TABLE users, posts, comments;

-- Update statistics
ANALYZE TABLE users, posts, comments;
```

### Performance Monitoring

Monitor these key metrics:
- Query execution times
- Index usage statistics
- Connection pool utilization
- Database size and growth

### Backup and Recovery

#### PostgreSQL
```bash
# Create backup
pg_dump -h localhost -U app_user your_project_name > backup.sql

# Restore backup
psql -h localhost -U app_user your_project_name < backup.sql
```

#### MySQL
```bash
# Create backup
mysqldump -u app_user -p your_project_name > backup.sql

# Restore backup
mysql -u app_user -p your_project_name < backup.sql
```

## 🛠️ Development Workflow

1. **Schema Changes**:
   - Modify schema files for new installations
   - Create migrations for existing databases
   - Update documentation

2. **Testing**:
   - Use test seed data for automated tests
   - Reset test database between test runs
   - Validate schema changes

3. **Deployment**:
   - Run migrations in production
   - Monitor for performance issues
   - Update application code accordingly

## 📚 Additional Resources

- [PostgreSQL Documentation](https://www.postgresql.org/docs/)
- [MySQL Documentation](https://dev.mysql.com/doc/)
- [Database Design Best Practices](https://www.ibm.com/topics/database-design)
- [SQL Style Guide](https://www.sqlstyle.guide/)

## 🆘 Troubleshooting

### Common Issues

**Connection refused**:
- Verify database server is running
- Check connection parameters
- Ensure user has proper permissions

**Migration failures**:
- Check syntax errors in SQL
- Verify table dependencies
- Ensure sufficient permissions

**Performance issues**:
- Review query execution plans
- Check index usage
- Monitor connection pool settings

### Getting Help

- Check the [database documentation](../database/)
- Review [migration examples](../database/migrations/)
- Open an issue in the project repository

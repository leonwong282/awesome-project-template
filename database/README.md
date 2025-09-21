# 🗄️ Database Templates

This directory contains database schema templates and migration scripts to help you quickly set up your project's data layer.

## 📁 Structure

```
database/
├── README.md                 # This file
├── schema/                   # Database schema definitions
│   ├── 01-users.sql         # User management tables
│   ├── 02-core.sql          # Core application tables
│   └── 99-indexes.sql       # Database indexes and constraints
├── migrations/              # Database migration templates
│   ├── README.md            # Migration guide
│   └── template.sql         # Migration template
├── seeds/                   # Sample data for development
│   ├── dev-data.sql         # Development seed data
│   └── test-data.sql        # Test environment data
└── scripts/                 # Database utility scripts
    ├── setup.sql            # Initial database setup
    └── cleanup.sql          # Database cleanup script
```

## 🚀 Quick Start

### 1. Choose Your Database

This template supports multiple database systems:
- **PostgreSQL** (recommended)
- **MySQL/MariaDB**
- **SQLite** (for development)

### 2. Run Schema Setup

```bash
# PostgreSQL
psql -d your_database -f database/scripts/setup.sql
psql -d your_database -f database/schema/01-users.sql
psql -d your_database -f database/schema/02-core.sql
psql -d your_database -f database/schema/99-indexes.sql

# MySQL
mysql -u username -p your_database < database/scripts/setup.sql
mysql -u username -p your_database < database/schema/01-users.sql
mysql -u username -p your_database < database/schema/02-core.sql
mysql -u username -p your_database < database/schema/99-indexes.sql
```

### 3. Load Sample Data (Optional)

```bash
# For development
psql -d your_database -f database/seeds/dev-data.sql

# For testing
psql -d your_database -f database/seeds/test-data.sql
```

## 📋 Usage Guidelines

### Schema Organization
- **Numbered prefixes**: Use `01-`, `02-`, etc. to control execution order
- **Logical grouping**: Group related tables in the same file
- **Indexes last**: Always create indexes after all tables are created

### Migration Best Practices
- **Incremental changes**: Each migration should be atomic
- **Rollback support**: Include both UP and DOWN migrations
- **Descriptive names**: Use clear, descriptive migration names

### Development Workflow
1. Modify schema files for structural changes
2. Create migrations for existing databases
3. Update seed data as needed
4. Test changes in development environment

## 🔧 Environment Configuration

Add these environment variables to your `.env.local`:

```env
# Database Configuration
DATABASE_URL="postgresql://username:password@localhost:5432/your_database"
DATABASE_HOST="localhost"
DATABASE_PORT="5432"
DATABASE_NAME="your_database"
DATABASE_USER="username"
DATABASE_PASSWORD="password"

# For MySQL
# DATABASE_URL="mysql://username:password@localhost:3306/your_database"

# For SQLite (development only)
# DATABASE_URL="sqlite:./database/dev.sqlite"
```

## 📚 Additional Resources

- [PostgreSQL Documentation](https://www.postgresql.org/docs/)
- [MySQL Documentation](https://dev.mysql.com/doc/)
- [SQLite Documentation](https://sqlite.org/docs.html)
- [Database Design Best Practices](https://docs.google.com/document/d/1example)

## 🤝 Contributing

When contributing database changes:
1. Update schema files for new tables/columns
2. Create corresponding migrations
3. Update seed data if needed
4. Test with all supported database systems
5. Update documentation

For more details, see [CONTRIBUTING.md](../CONTRIBUTING.md)

# ADR-040: Local Database Per Environment Architecture

**Status**: Accepted
**Date**: 2025-11-01
**Context**: Issue #280 CORE-ALPHA-DATA-LEAK
**Deciders**: Christian Crumlish (PM), Code Agent, Chief Architect (Claude Sonnet)

---

## Context and Problem Statement

During implementation of Issue #280 (data leak remediation), we discovered the need to make an explicit architectural decision about database management across development, alpha testing, and production environments.

### Questions That Arose

1. **Where do alpha_users records live?**
   - In the dev laptop database?
   - In each tester's local database?
   - In a shared database?

2. **Do databases merge across git branches?**
   - Does `main` branch have different database than `production` branch?
   - How do we maintain consistency?

3. **How does user data move between environments?**
   - From development to alpha testing?
   - From alpha to production?

4. **What security model applies?**
   - How is data isolated between alpha testers?
   - What happens when code is shared but data shouldn't be?

### The Confusion

The root confusion stemmed from treating databases like git branches - assuming they would merge or be shared. This is a category error: **code lives in git, data lives in PostgreSQL**, and they follow different rules.

---

## Decision

**We will use separate local databases for each environment, with no automatic synchronization between environments.**

### Architecture Overview

```
â”Œâ”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”
â”‚ GIT REPOSITORY (Code - Shared via git)              â”‚
â”œâ”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”¤
â”‚ main branch       â†’ Active development (PM)         â”‚
â”‚ production branch â†’ Stable releases (alpha testers) â”‚
â””â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”˜
                    â†“ git pull/clone
                    â†“ (code only)
â”Œâ”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”
â”‚ LOCAL ENVIRONMENTS (Code + Data - Never Merge)      â”‚
â”œâ”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”¤
â”‚                                                      â”‚
â”‚ Dev Laptop:                                          â”‚
â”‚   Branch: main                                       â”‚
â”‚   PostgreSQL DB #1: {xian: Christian's data}        â”‚
â”‚                                                      â”‚
â”‚ Alpha Laptop:                                        â”‚
â”‚   Branch: production                                 â”‚
â”‚   PostgreSQL DB #2: {alfy: generic/test data}       â”‚
â”‚                                                      â”‚
â”‚ External Tester:                                     â”‚
â”‚   Branch: production                                 â”‚
â”‚   PostgreSQL DB #3: {tester123: their data}         â”‚
â”‚                                                      â”‚
â””â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”˜

DB #1 â‰  DB #2 â‰  DB #3 (Never merge)
```

### Key Principles

1. **Code â‰  Data**
   - Code lives in git (shared)
   - Data lives in PostgreSQL (isolated per environment)

2. **Databases Never Merge**
   - Each environment has its own local PostgreSQL instance
   - User data stays in local database
   - No automatic sync between environments

3. **User Data Storage**
   - Personal data: `alpha_users.preferences` JSONB field
   - Generic config: `config/PIPER.md` (in git, shared)
   - User-specific overrides generic

4. **Environment Separation**
   - Development: PM's local database with real data
   - Alpha: Each tester's local database with their data
   - Production: Hosted database (future) with all real users

5. **Migration is Manual**
   - No automatic data migration between environments
   - Alpha â†’ Production requires explicit export/import per user
   - Gives users control over what data moves to production

---

## Rationale

### Why Local Databases?

**Security and Isolation:**
- Each alpha tester's data stays on their machine
- No risk of cross-user data contamination
- PM's personal data never exposed to testers
- Simple backup strategy (user controls their data)

**Simplicity:**
- No need for hosted alpha database
- No authentication/authorization complexity for alpha
- Easy rollback (just restore local database)
- Clear ownership (each tester owns their data)

**Development Velocity:**
- PM can experiment on `main` without breaking alpha testers
- Alpha testers pull stable `production` branch
- Database changes tested locally before release

### Why Not Shared Database?

We considered and rejected a shared development database because:

1. **Security Risk**: PM's personal data exposed to all testers
2. **Contamination Risk**: One tester's changes affect others
3. **Branch Conflicts**: `main` changes could break `production` users
4. **Cost**: Unnecessary infrastructure for 5-10 alpha testers
5. **Complexity**: Need multi-tenant isolation, backups, monitoring

### Why Manual Migration to Production?

We explicitly chose manual migration because:

1. **User Consent**: Testers decide if/when to migrate data
2. **Quality Control**: Review data before production import
3. **Selective Migration**: Not all alpha data needs production migration
4. **Simplicity**: No complex automated sync logic
5. **Safety**: Can't accidentally expose test data in production

---

## Implementation Details

### File Structure

**In Git (Shared):**
```
config/
  PIPER.md                          # Generic system config
  PIPER.md.backup-YYYYMMDD          # Historical backups

scripts/
  migrate_personal_data.py          # Flexible migration tool
  create_test_alpha_user.py         # User creation utility
  test_user_data_isolation.py       # Isolation verification

docs/
  ALPHA_DATABASE_ARCHITECTURE.md    # Operational guide
  adrs/adr-040-local-database.md    # This decision record

services/database/
  models.py                          # Table schemas
  connection.py                      # Database connection
```

**Not in Git (.gitignore):**
```
postgres_data/         # PostgreSQL data directory
*.db                   # SQLite files
.env                   # Environment variables
uploads/               # User-uploaded files
__pycache__/          # Python cache
```

### Migration Script Usage

```bash
# Migrate PM's data to xian account (dev laptop)
python scripts/migrate_personal_data.py --username xian

# Verify alfy user exists, no migration (alpha laptop)
python scripts/migrate_personal_data.py --username alfy --skip-migration

# Migrate custom data from JSON file (future testers)
python scripts/migrate_personal_data.py \
  --username tester123 \
  --data-file tester_data.json
```

### Branch Strategy

**`main` Branch:**
- Purpose: Active development by PM
- Stability: Experimental features allowed
- Database: PM's dev laptop PostgreSQL (xian user)
- Users: PM only

**`production` Branch:**
- Purpose: Stable releases for alpha testers
- Stability: Tested, documented, ready for use
- Database: Each tester's local PostgreSQL (their username)
- Users: All alpha testers

**Merge Flow:**
```
PM develops on main
  â†“
Test locally with xian account
  â†“
Merge main â†’ production when stable
  â†“
Alpha testers pull production branch
  â†“
Each tester runs on their local database
```

---

## Consequences

### Positive Consequences

âœ… **Security**: Strong data isolation, no cross-contamination risk
âœ… **Privacy**: PM's personal data never exposed to testers
âœ… **Simplicity**: No complex multi-tenant database infrastructure
âœ… **Control**: Each user controls their own data
âœ… **Rollback**: Easy to restore (just local database backup)
âœ… **Cost**: No hosting costs for alpha phase
âœ… **Development Speed**: PM can experiment without breaking testers

### Negative Consequences

âš ï¸ **Manual Migration**: Requires explicit work to move alpha â†’ production
âš ï¸ **Documentation**: Needs clear explanation (non-obvious to new developers)
âš ï¸ **Setup Complexity**: Each tester must set up local PostgreSQL
âš ï¸ **Backup Responsibility**: Users responsible for backing up local data
âš ï¸ **No Real-Time Sync**: Can't automatically propagate improvements

### Neutral Consequences

ðŸ“‹ **Requires Clear Documentation**: ALPHA_DATABASE_ARCHITECTURE.md created
ðŸ“‹ **Migration Scripts Must Be Flexible**: Added --username parameter
ðŸ“‹ **Setup Wizard Needed**: For alpha tester onboarding
ðŸ“‹ **Production Migration Plan**: Documented in architecture guide

---

## Alternatives Considered

### Alternative 1: Shared Development Database

**Architecture:**
- One PostgreSQL instance hosted on server
- All developers and alpha testers connect to it
- Multi-tenant isolation with row-level security

**Rejected Because:**
- âŒ Security risk: PM's personal data exposed to all
- âŒ Contamination risk: One user's changes affect others
- âŒ Branch confusion: How do `main` and `production` share database?
- âŒ Cost: Unnecessary infrastructure for alpha
- âŒ Complexity: Need authentication, authorization, backups

**When It Makes Sense:**
- Production phase with many users
- Need for real-time collaboration
- Centralized backup and monitoring required

### Alternative 2: Database Per Branch

**Architecture:**
- `main` branch has one database
- `production` branch has different database
- Databases stored in git somehow (LFS?)

**Rejected Because:**
- âŒ Conceptually wrong: Databases don't live in git
- âŒ Category error: Mixing code (git) and data (PostgreSQL)
- âŒ Unmanageable: Binary database files in version control
- âŒ No clear migration: How do databases merge?

**Why This Doesn't Work:**
- Git is for code, not data
- Binary files (database dumps) don't merge well
- Defeats purpose of version control

### Alternative 3: Cloud-Hosted Alpha Database

**Architecture:**
- PostgreSQL hosted on Render/Railway/Supabase
- All alpha testers connect to shared instance
- Multi-tenant with proper isolation

**Deferred to MVP Because:**
- â­ï¸ Overkill for 5-10 alpha testers
- â­ï¸ Cost unnecessary for alpha phase (~$20/month minimum)
- â­ï¸ Local testing sufficient for alpha validation
- â­ï¸ Can implement when scaling to larger user base

**When We'll Implement This:**
- MVP phase (50+ users)
- When hosting web application
- When need centralized backups
- When manual password reset becomes burden

### Alternative 4: No Database, Files Only

**Architecture:**
- Store user data in JSON files
- One file per user (e.g., `data/xian.json`)
- No PostgreSQL needed

**Rejected Because:**
- âŒ No querying capability
- âŒ No data integrity constraints
- âŒ Hard to implement relationships
- âŒ No ACID guarantees
- âŒ Doesn't scale to production

**Why We Need PostgreSQL:**
- Structured data with relationships
- ACID transactions for data integrity
- Prepared for production scaling
- Query capabilities for features

---

## Security Considerations

### Alpha Phase (Current)

**Security Model:**
- âœ… Data isolation: Each user sees only their data
- âœ… Local databases: No network exposure during development
- âœ… User context: UserContextService enforces data boundaries
- âš ï¸ No encryption at rest: Relies on OS-level disk encryption
- âš ï¸ No email verification: Users created manually via wizard
- âš ï¸ No password reset: Manual process for alpha phase

**Acceptable for Alpha Because:**
- Trusted users (5-10 known people)
- Local databases (not networked)
- Low risk (test data, not production)
- Manual assistance available

### MVP/Production Phase (Future)

**Required Security:**
- ðŸ” Multi-tenant database with row-level security
- ðŸ” Encrypted connections (SSL/TLS)
- ðŸ” Email verification required for signup
- ðŸ” Password reset via email service
- ðŸ” Rate limiting to prevent abuse
- ðŸ” API authentication (JWT tokens)
- ðŸ” Audit logging for compliance
- ðŸ” Regular security audits

**Email Backend Security** (from email-service-research-mvp.md):
- Use reputable service (SendGrid, Mailgun, AWS SES)
- Rate limiting (max 5 emails/hour per user)
- Email verification before allowing sends
- Monitor for spam patterns
- CAPTCHA for signup to prevent bots
- SPF/DKIM/DMARC records configured
- Domain reputation monitoring

---

## Migration Path: Alpha â†’ Production

### When Production Ready

1. **Set Up Production Database:**
   ```sql
   -- Hosted on Render/Railway/Supabase
   CREATE TABLE users (
     id UUID PRIMARY KEY,
     username TEXT UNIQUE,
     email TEXT UNIQUE,
     password_hash TEXT,
     preferences JSONB,
     created_at TIMESTAMP DEFAULT NOW()
   );
   ```

2. **Export Alpha User Data:**
   ```bash
   # On alpha tester's local machine
   python scripts/export_user_data.py --username alfy > alfy_data.json
   ```

3. **Import to Production:**
   ```bash
   # On production server
   python scripts/import_user_data.py \
     --username alfy \
     --email alfy@example.com \
     --data alfy_data.json
   ```

4. **User Setup:**
   - User receives email invitation
   - User sets production password
   - User logs into production system
   - User's preferences migrated automatically

### What Gets Migrated

âœ… **User Preferences** (from `alpha_users.preferences`)
âœ… **User Profile** (username, email)
âœ… **Configuration Overrides** (personalization)

âŒ **NOT Migrated:**
- Alpha test data (conversations, uploads)
- Development artifacts
- Test accounts
- Temporary data

### Manual Process

**Why Manual:**
- User consent required (GDPR compliance)
- Quality control (review before production)
- Selective migration (not all alpha data is production-ready)
- Simple and safe (no automated mistakes)

**Estimated Time:**
- 5-10 minutes per user
- Can be scripted but requires human verification
- Not a burden for 5-10 alpha users

---

## Compliance and Best Practices

### Data Handling

**Alpha Phase:**
- User data stored locally (user controls)
- No PII shared across environments
- Manual deletion (user owns database)
- Backup optional (user's choice)

**Production Phase:**
- GDPR-compliant data handling
- Right to deletion (DELETE FROM users)
- Right to export (pg_dump per user)
- Data retention policies
- Regular backups with encryption

### Documentation Requirements

**For Alpha Testers:**
- Setup guide (how to install PostgreSQL)
- Migration guide (how to run scripts)
- Backup guide (how to protect local data)
- Troubleshooting guide (common issues)

**For Developers:**
- Architecture overview (this ADR)
- Operational guide (ALPHA_DATABASE_ARCHITECTURE.md)
- Migration scripts documentation
- Testing procedures

---

## Testing and Verification

### Automated Tests

```bash
# Data isolation tests
python -m pytest tests/config/test_data_isolation.py

# UserContextService tests
python -m pytest tests/services/test_user_context_service.py

# Migration script tests
python -m pytest tests/scripts/test_migration.py
```

### Manual Verification

```bash
# Verify PIPER.md has no personal data
grep -i "christian\|xian\|VA\|DRAGONS" config/PIPER.md
# Expected: No matches

# Test migration script flexibility
python scripts/migrate_personal_data.py --username test-user

# Verify data isolation
python scripts/test_user_data_isolation.py
# Expected: Each user sees only their data
```

---

## Future Considerations

### When to Revisit This Decision

**Triggers to Reconsider:**
1. **Scale**: More than 50 alpha users (local databases become burden)
2. **Collaboration**: Need real-time data sharing between users
3. **Features**: Implementing features that require centralized data
4. **Cost**: Local setup complexity exceeds hosting cost
5. **Security**: Need centralized security controls

**Expected Timeline:**
- Alpha phase: Use local databases (current decision)
- MVP phase: Move to hosted database with proper isolation
- Production: Fully managed multi-tenant database

### Production Architecture (Future)

```
â”Œâ”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”
â”‚ Production Environment (Hosted)             â”‚
â”œâ”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”¤
â”‚                                             â”‚
â”‚ Web Application (Render/Railway)            â”‚
â”‚   â”œâ”€â”€ FastAPI backend                       â”‚
â”‚   â””â”€â”€ React frontend                        â”‚
â”‚                                             â”‚
â”‚ PostgreSQL Database (Hosted)                â”‚
â”‚   â”œâ”€â”€ users table (all production users)   â”‚
â”‚   â”œâ”€â”€ Row-level security enabled            â”‚
â”‚   â””â”€â”€ Encrypted connections (SSL/TLS)       â”‚
â”‚                                             â”‚
â”‚ Email Service (SendGrid)                    â”‚
â”‚   â”œâ”€â”€ Verification emails                   â”‚
â”‚   â”œâ”€â”€ Password reset                        â”‚
â”‚   â””â”€â”€ Rate limited                          â”‚
â”‚                                             â”‚
â””â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”˜
```

This production architecture will be documented in a separate ADR when we reach that phase.

---

## Related Documents

- **Issue #280**: CORE-ALPHA-DATA-LEAK (original context)
- **ALPHA_DATABASE_ARCHITECTURE.md**: Operational guide for alpha testers
- **email-service-research-mvp.md**: Email service planning for MVP
- **Gameplan P0 Blockers v2.0**: Sprint context and implementation plan

---

## Decision Log

| Date | Event | Decision |
|------|-------|----------|
| 2025-11-01 08:10 | Discovered confusion about database location | Clarified code vs data separation |
| 2025-11-01 08:12 | Discussed branch strategy with PM | Confirmed separate local databases |
| 2025-11-01 08:21 | Migration script made flexible | Added --username parameter |
| 2025-11-01 08:26 | ADR drafted and accepted | Local database per environment |

---

## Approval

**Approved by**: Christian Crumlish (PM)
**Date**: 2025-11-01
**Status**: Accepted and Implemented

**Implementation Evidence:**
- Commit 367b0ff4: Flexible migration script
- Commit 37b556a2: Generic PIPER.md and data isolation
- Documentation: ALPHA_DATABASE_ARCHITECTURE.md (322 lines)
- Tests passing: 52 tests, all green

---

**Last Updated**: 2025-11-01 08:26 AM PT
**Next Review**: Before MVP deployment (when hosting production database)

# Piper Morgan Developer Notes - Lessons Learned
**Last Updated**: June 25, 2025  
**Purpose**: Capture critical lessons to avoid repeating painful debugging sessions

## Critical Reminders for Every Session

### 1. ALWAYS Check Before Suggesting
- **NEVER** assume file locations or import paths
- **ALWAYS** run `grep`, `find`, or `cat` to verify actual code
- **VERIFY** existing patterns before proposing new ones

### 2. Import Path Rules
```python
# ✅ CORRECT - All imports use services. prefix
from services.shared_types import WorkflowType
from services.domain.models import Project
from services.repositories.file_repository import FileRepository

# ❌ WRONG - Missing services prefix
from shared_types import WorkflowType
from domain.models import Project
```

### 3. Test Fixture Patterns
```python
# ✅ Module-level async fixtures (NOT class methods)
@pytest_asyncio.fixture  # Note: Use pytest_asyncio for async fixtures!
async def setup_test_file():
    # setup code
    yield data
    # teardown code

# ❌ WRONG - Async fixtures as class methods don't work
class TestSomething:
    @pytest.fixture
    async def setup_test_file(self):  # This won't work!
```

### 4. Running Pytest with Class Methods
```bash
# ✅ CORRECT - Include class name for class methods
pytest tests/test_file.py::TestClassName::test_method_name

# ❌ WRONG - Missing class name
pytest tests/test_file.py::test_method_name
```

## Architectural Issues to Fix

### 1. Multiple Workflow Classes (CRITICAL)
- **Problem**: Workflow defined in 3 places
  - `services/domain/models.py` (✅ canonical domain model)
  - `services/database/models.py` (should be WorkflowDB)
  - `services/orchestration/workflows.py` (unknown purpose)
- **Impact**: Confusion about which to import
- **Fix**: Rename DB model to WorkflowDB, investigate workflows.py

### 2. Missing Test Infrastructure
- **Problem**: Tests expect `db_session` fixture that doesn't exist
- **Impact**: Can't run integration tests properly
- **Fix**: Create proper database fixtures in conftest.py

## Common Debugging Commands

```bash
# Find where something is defined
grep -r "class ClassName" . --include="*.py"
grep -r "def function_name" . --include="*.py"

# Check imports in a file
grep "^from\|^import" filename.py

# Find fixture definitions
grep -r "@pytest.fixture\|@pytest_asyncio.fixture" tests/

# See file structure
tree -L 3 services/

# Check what's in a module
ls -la services/modulename/
```

## TDD Process Reminders

1. **Before Writing ANY Test**:
   - Check how existing similar tests work
   - Verify component interfaces and dependencies
   - Look for existing fixtures and patterns

2. **Before Integration Tests**:
   - Review ALL components being integrated
   - Check their constructors and dependencies
   - Understand existing test infrastructure

3. **When Tests Fail**:
   - Read the ACTUAL error, not what you expect
   - Check if fixtures exist before using them
   - Verify import paths match project patterns

## Project-Specific Patterns

### Repository Pattern
```python
# Repositories need database connection
repo = FileRepository(db_session)  # NOT FileRepository()

# Domain models are pure Python
project = Project(name="Test")  # No DB dependency
```

### Service Layer
```python
# Services orchestrate, repositories persist
# Domain models contain business logic
# Database models are just schema
```

## Session-Specific Discoveries

### From PM-011 File Analysis Integration (June 25, 2025)
1. FileRepository requires `db_pool` parameter
2. Async fixtures must be module-level, not class methods
3. Use `@pytest_asyncio.fixture` for async fixtures
4. All service imports need `services.` prefix
5. WorkflowExecutor needs proper dependency injection

## Before Starting New Work

### Checklist:
- [ ] Read relevant project knowledge docs
- [ ] Check existing code patterns with grep/find
- [ ] Verify test infrastructure is working
- [ ] Review component interfaces before integration
- [ ] Follow TDD: test first, implement second

### Don't Trust, Verify:
- Don't trust memory about file locations
- Don't trust assumptions about APIs
- Don't trust that fixtures exist
- Don't trust import patterns without checking

## Emergency Debugging

When things go wrong:
1. **Stop guessing** - Check actual code
2. **Read errors carefully** - They usually tell you exactly what's wrong
3. **Check simpler things first** - Missing imports, typos, wrong paths
4. **Verify basics work** - Can you import the module? Does the fixture exist?

---
*Remember: Hours of debugging can be avoided by minutes of verification upfront.*
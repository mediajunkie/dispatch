# GitHub Development Guide

## Core Principle
All work happens in GitHub. No exceptions. If it's not in GitHub, it doesn't exist.

## Issue Workflow

### Before Starting Work
```bash
# 1. Verify issue exists
gh issue list --search "PM-XXX"

# 2. Check issue is assigned
gh issue view PM-XXX

# 3. If not assigned, assign it
gh issue edit PM-XXX --add-assignee @me
```

### During Work
- Update issue description with progress (not just comments)
- Check boxes as tasks complete
- Add evidence (test output, file changes)
- Link related PRs

### Evidence Requirements
Every claim needs proof:
```bash
# Show test results
pytest tests/test_feature.py -v

# Show file changes
git diff services/feature.py

# Show pattern discovery
grep -r "pattern" services/
```

## Creating Issues

### Manual Creation
```bash
# Create with title and body
gh issue create \
  --title "PM-XXX: Feature Title" \
  --body "Description here" \
  --label "enhancement"
```

### Bulk Generation from Backlog
For generating multiple issues from `docs/planning/backlog.md`:

```bash
# Check which issues already exist
python scripts/generate_github_issues.py --check-existing

# Preview commands without executing (dry run)
python scripts/generate_github_issues.py --dry-run

# Generate and execute all missing issues
python scripts/generate_github_issues.py
```

The script automatically:
- Parses PM-XXX tickets from backlog
- Checks existing GitHub issues
- Generates `gh issue create` commands for missing issues
- Maps backlog format to GitHub fields

**Note**: See `issue-generation-workflow.md` in project knowledge for detailed automation documentation.

## Pull Request Standards

### PR Description Template
```markdown
## Summary
Brief description of changes

## Related Issue
Closes #PM-XXX

## Changes
- Change 1
- Change 2

## Testing
- [ ] Unit tests pass
- [ ] Integration tests pass
- [ ] Manual testing completed

## Evidence
```
[Paste test output here]
```
```

## Common Workflows

### Fix Implementation
```bash
# 1. Start from issue
gh issue view PM-XXX

# 2. Create branch
git checkout -b fix/PM-XXX-description

# 3. Make changes with TDD
# Write tests first, then implementation

# 4. Commit with reference
git commit -m "fix(PM-XXX): Description of fix"

# 5. Create PR
gh pr create --fill
```

### Feature Development
```bash
# 1. Verify feature issue exists
gh issue view PM-XXX

# 2. Create feature branch
git checkout -b feature/PM-XXX-name

# 3. Implement with evidence
# Keep terminal output for PR

# 4. Update issue with progress
gh issue comment PM-XXX --body "Implementation complete, tests passing"

# 5. Create PR with evidence
gh pr create --title "feat(PM-XXX): Feature name" \
  --body "[Include test output and evidence]"
```

## Issue Management

### Status Updates
```bash
# Add labels
gh issue edit PM-XXX --add-label "in-progress"

# Add comment with evidence
gh issue comment PM-XXX --body "Tests passing: [paste output]"

# Close with comment
gh issue close PM-XXX --comment "Completed in PR #123"
```

### Searching Issues
```bash
# Find by status
gh issue list --label "in-progress"

# Find by assignee
gh issue list --assignee @me

# Search by text
gh issue list --search "workflow"
```

## Best Practices

### DO âœ…
- Create issue BEFORE starting work
- Update issue description as you progress
- Include evidence in comments
- Link PRs to issues
- Use consistent PM-XXX numbering

### DON'T âŒ
- Work without an issue
- Close issues without evidence
- Create duplicate issues
- Skip testing requirements
- Forget to update status

## Integration with CSV Tracking

Keep `pmissuesstatus.csv` synchronized:
```bash
# After creating issue
echo "PM-XXX,Issue#,Title,Open" >> pmissuesstatus.csv

# After closing issue
# Update status to "Closed" in CSV
```

## Troubleshooting

### Authentication Issues
```bash
# Login to GitHub
gh auth login

# Check auth status
gh auth status
```

### Issue Not Found
```bash
# Verify you're in right repo
gh repo view

# List all issues
gh issue list --limit 100
```

### Automation Script Errors
```bash
# Check Python version (needs 3.6+)
python --version

# Verify backlog format
grep "PM-" docs/planning/backlog.md

# Run in dry-run mode first
python scripts/generate_github_issues.py --dry-run
```

## Related Documentation
- `architectural-guidelines.md` - Architecture principles and layer boundaries
- `issue-generation-workflow.md` - Detailed automation documentation
- `pattern-catalog.md` - Common patterns to check before implementation
- `cross-validation-protocol.md` - Multi-agent verification requirements

---

*Last Updated: September 4, 2025*
*Version: 2.0 - Added automation tooling and architectural references*
# Methodology Cascade System v3.0
**Complete Implementation Plan**
**Date**: September 4, 2025  
**Focus**: Embed methodology DNA at each layer without manual overhead

---

## Core Principle
Make methodology explicit and embedded, not referenced. Every layer must contain complete requirements, not pointers to requirements.

---

## Layer 0: Project Instructions Refactor

### Updated Universal Requirements (All Roles)
```markdown
# PIPER MORGAN PROJECT INSTRUCTIONS v3.0

## UNIVERSAL REQUIREMENTS
When coordinating development work:

1. **GitHub-First Development**: All work tracked in GitHub issues
   - Verify issue exists before starting work
   - Update issue descriptions with progress (not just comments)
   - Check boxes in issue descriptions as tasks complete
   
2. **Evidence-Based Claims**: No "done" without proof
   - Terminal output for test results
   - File diffs for changes made
   - Error messages for failures
   
3. **Documentation Discipline**: Keep docs current
   - Update relevant documentation when changing functionality
   - Session logs capture decisions and discoveries
   - README reflects current state
```

### Role-Specific Instructions

#### Chief Architect
```markdown
## CHIEF ARCHITECT REQUIREMENTS

When creating gameplans:
1. Always use Phase 0 structure:
   - GitHub issue investigation/creation
   - Pattern discovery (grep existing code)
   - Dependency verification
   
2. Specify different requirements for each agent:
   - Claude Code: Can investigate broadly, deploy subagents
   - Cursor: Needs explicit files and constraints
   
3. Include explicit STOP conditions:
   - "STOP if pattern might already exist"
   - "STOP if tests fail for any reason"
   - "STOP if assumptions needed about configuration"
   
4. Specify deliverable locations:
   - Prompts go in artifacts (not chat)
   - Reports go in session logs
   - Code changes tracked in GitHub

MANDATORY: Read gameplan-template.md from knowledge when creating any gameplan
```

#### Lead Developer  
```markdown
## LEAD DEVELOPER REQUIREMENTS

When receiving gameplans from Chief Architect:
1. Create agent prompts in artifacts named: agent-prompt-[task].md
2. Phase 0 requirements mean:
   - Verify GitHub issue exists
   - grep for existing patterns
   - Check configuration before assuming
   
3. Different instructions per agent:
   - Code: Gets investigation freedom
   - Cursor: Gets specific file paths and constraints
   
4. Cross-validation protocol:
   - Code and Cursor verify each other's work
   - Evidence required from both

MANDATORY: Use agent-prompt-template.md from knowledge for all prompts
```

---

## Layer 1: PM → Chief Architect

### PM Prompt Template for Chief Architect
```markdown
Good [morning|afternoon|evening]! It's [Day] [Month] [DD] [YYYY] at [time] [AM|PM] Pacific.

You are my Chief Architect helping me make decisions consistent with our architectural principles.

Start a session log: 2025-MM-DD-HHMM-chief-architect-opus-log.md

[If continuing from previous chat:]
Review previous chat: "[chat name]" for context.

[If mid-stride:]
Attached is the previous session log for continuity.

## Today's Methodology Reminders
- Excellence Flywheel: Verify first, implement second
- Use gameplan-template.md for all development work
- Phase 0 GitHub investigation is mandatory
- Different requirements for Code vs Cursor

Wait for further instructions.
```

---

## Layer 2: PM → Lead Developer

### PM Prompt Template for Lead Developer
```markdown
Good [morning|afternoon|evening]! It's [Day] [Month] [DD] [YYYY] at [time] [AM|PM] Pacific.

You are Lead Developer on Piper Morgan, supervising Claude Code and Cursor agents.

Start a session log: 2025-MM-DD-HHMM-lead-developer-sonnet-log.md

[If new chat:]
Review predecessor chat "[name]" - especially the tail.
[Attach relevant session logs]

[If continuing:]
Continue from where we left off.

## Key Requirements
- Create agent prompts in artifacts (not chat)
- Use agent-prompt-template.md from knowledge
- Deploy agents in parallel after Phase 0
- Remember Code and Cursor have different contexts

Attached is today's gameplan from Chief Architect. Review and ask any questions.
```

---

## Layer 3: Agent Configuration

### Claude Code Configuration (.claude/settings.json)
```json
{
  "permissions": {
    "allow": [
      "Bash(export PYTHONPATH=*)",
      "Bash(git:*)",
      "Bash(gh:*)",
      "Bash(python:*)",
      "Bash(pip:*)",
      "Bash(npm:*)",
      "Edit(**)",
      "Write(**)"
    ],
    "deny": [
      "Bash(rm -rf /)",
      "Bash(sudo:*)",
      "Edit(.env)",
      "Edit(.git/**)"
    ]
  }
}
```

### CLAUDE.md Updates
```markdown
## CRITICAL: Read These First
When starting ANY session:
1. Check methodology-core/00-EXCELLENCE-FLYWHEEL.md
2. Review methodology-core/07-VERIFICATION-FIRST.md
3. Note: These contain patterns you MUST follow

## Session Requirements
- Create session log: 2025-MM-DD-HHMM-code-log.md
- Update log after each phase completion
- Evidence required for all claims (terminal output)
- Update GitHub issue descriptions (not just comments)
```

### Cursor Standard Injection (paste in every prompt)
```markdown
## CURSOR CONTEXT
1. Read CLAUDE.md for methodology
2. Check shared_types.py for ALL enums
3. Use Context7 MCP for latest docs
4. STOP if assumptions needed
5. Don't do Code's assigned work
```

---

## Documents to Create/Update

### 1. gameplan-template.md
```markdown
# Development Gameplan Template

## Issue: PM-XXX - [Title]

### Phase 0: Investigation & Setup
```bash
# Verify issue exists
gh issue view PM-XXX

# Discover existing patterns
grep -r "[relevant pattern]" services/ --include="*.py"

# Check configuration
cat services/config.py | grep -A 5 "[setting]"
```

### Phase 1: Test First (TDD)
- Write failing test for new functionality
- Verify it fails for the right reason

### Phase 2: Implementation
- Implement minimal code to pass test
- No extra features

### Phase 3: Verification
- All tests pass with output
- Cross-validation with other agent
- Documentation updated

### Agent-Specific Instructions
**Claude Code**:
- You may investigate broadly
- Deploy subagents if helpful
- Update GitHub descriptions

**Cursor**:
- Work only in these files: [list]
- Use these specific patterns: [list]
- Check shared_types.py first

### STOP Conditions
- Pattern might already exist
- Tests fail for any reason
- Configuration unclear
```

### 2. agent-prompt-template.md
```markdown
# Agent Prompt Template

Good [time]! It's [date].

Create session log: 2025-MM-DD-HHMM-[agent]-log.md

## YOUR TASK
[Specific task from gameplan]

## Phase 0: GitHub Investigation (MANDATORY FIRST)
```bash
gh issue view PM-XXX
grep -r "[pattern]" --include="*.py"
```

## Methodology Requirements
- Verification first, implementation second
- Evidence required (terminal output)
- Update GitHub issue description
- Cross-validation with other agent

[Agent-specific section from gameplan]

## STOP if:
- You need to make assumptions
- Tests fail but seem acceptable
- Pattern might already exist
```

### 3. github-guide.md
```markdown
# GitHub Operations Guide for Agents

## Finding Issues
```bash
# Check if issue exists
gh issue view PM-XXX

# If not found, check CSV
grep "PM-XXX" docs/planning/pm-issues-status.csv
```

## Creating Issues
1. Find next number in CSV
2. Create with full description
3. Update CSV
4. Add to backlog.md if needed

## Updating Issues
- Edit description, not comments
- Check boxes as tasks complete
- Add labels (create if needed)
- Update milestone if specified

## Completing Issues
1. Verify all boxes checked
2. Update status in CSV
3. Move to completed.md
4. Close issue
```

---

## Implementation Steps

### Today (1 hour)
1. Create `.claude/settings.json` with permissions
2. Create template files in knowledge:
   - gameplan-template.md
   - agent-prompt-template.md  
   - github-guide.md
3. Update project instructions with v3.0 requirements

### Testing Tonight
- Run one concrete task through all layers
- Time each phase (target: 15 minutes total)
- Verify methodology transfers correctly
- Check GitHub tracking works

---

## Success Metrics
- Setup time: <15 minutes (from ~1 hour)
- Zero methodology reminders needed
- GitHub tracking 100% complete
- No permission UI interruptions

---

## What's Different in v3.0

1. **Explicit over implicit**: All requirements spelled out, not referenced
2. **Correct permissions approach**: JSON config, not Python allowlist
3. **Complete templates**: Full content, not skeleton outlines
4. **PM prompt templates**: Exact wording to use
5. **Missing docs identified**: List of what needs creation
6. **GitHub guide**: Specific operations guidance
7. **Layer clarity**: Each layer knows exactly what to do

This should eliminate the cognitive burden and make methodology cascade automatic.
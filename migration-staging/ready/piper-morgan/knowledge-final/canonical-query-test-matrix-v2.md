# Canonical Query Test Matrix v2

**Generated**: December 25, 2025  
**Based On**: Canonical Queries v2 (63 queries)  
**Current Implementation**: 19/63 (30%)  
**Last Tested**: December 24, 2025  

## Summary Statistics

| Category | Total | PASS | PARTIAL | NOT IMPL | Coverage |
|----------|-------|------|---------|----------|----------|
| Identity | 5 | 5 | 0 | 0 | âœ… 100% |
| Temporal | 5 | 5 | 0 | 0 | âœ… 100% |
| Spatial | 4 | 4 | 0 | 0 | âœ… 100% |
| Capability | 5 | 5 | 0 | 0 | âœ… 100% |
| Predictive | 5 | 0 | 1 | 4 | âš ï¸ 20% |
| Conversational | 5 | 0 | 0 | 5 | âŒ 0% |
| Scheduling | 5 | 0 | 0 | 5 | âŒ 0% |
| Documents | 5 | 0 | 0 | 5 | âŒ 0% |
| GitHub Ops | 8 | 0 | 0 | 8 | âŒ 0% |
| Slack | 5 | 0 | 0 | 5 | âŒ 0% |
| Productivity | 3 | 0 | 0 | 3 | âŒ 0% |
| Todos | 4 | 0 | 0 | 4 | âŒ 0% |
| Calendar Ext | 2 | 0 | 0 | 2 | âŒ 0% |
| Knowledge | 1 | 0 | 0 | 1 | âŒ 0% |
| **TOTAL** | **63** | **19** | **1** | **43** | **30%** |

## Detailed Test Matrix

### âœ… Identity Queries (100% Complete)

| # | Query | Status | Test File | Notes |
|---|-------|--------|-----------|-------|
| 1 | What's your name and role? | âœ… PASS | test_canonical_handlers.py | All formatters working |
| 2 | What can you help me with? | âœ… PASS | test_canonical_handlers.py | Dynamic capabilities |
| 3 | Are you working properly? | âœ… PASS | test_canonical_handlers.py | Health check functional |
| 4 | How do I get help? | âœ… PASS | test_canonical_handlers.py | Help system complete |
| 5 | What makes you different? | âœ… PASS | test_canonical_handlers.py | Differentiation clear |

### âœ… Temporal Queries (100% Complete)

| # | Query | Status | Test File | Notes |
|---|-------|--------|-----------|-------|
| 6 | What day is it? | âœ… PASS | test_canonical_handlers.py | Time awareness working |
| 7 | What did we accomplish yesterday? | âœ… PASS | test_canonical_handlers.py | Retrospective functional |
| 8 | What's on the agenda for today? | âœ… PASS | test_agenda_query.py | Calendar + todos |
| 9 | When was the last time we worked on this? | âœ… PASS | test_canonical_handlers.py | Activity tracking |
| 10 | How long have we been working on this? | âœ… PASS | test_canonical_handlers.py | Duration calculation |
| ~~15~~ | ~~Where are we in lifecycle?~~ | ðŸš« REMOVED | - | Too abstract |

### âœ… Spatial Queries (100% Complete)

| # | Query | Status | Test File | Notes |
|---|-------|--------|-----------|-------|
| 11 | What projects are we working on? | âœ… PASS | test_canonical_handlers.py | Project list works |
| 12 | Show me the project landscape | âœ… PASS | test_canonical_handlers.py | Landscape view |
| 13 | Which project should I focus on? | âœ… PASS | test_canonical_handlers.py | Priority scoring |
| 14 | What's the status of project X? | âœ… PASS | test_canonical_handlers.py | Project-specific |

### âœ… Capability Queries (100% Complete)

| # | Query | Status | Test File | Notes |
|---|-------|--------|-----------|-------|
| 16 | Create a GitHub issue | âœ… PASS | test_canonical_handlers.py | Issue creation |
| 17 | Analyze this document | âœ… PASS | test_document_handlers.py | Notion analysis |
| 18 | List all my projects | âœ… PASS | test_canonical_handlers.py | Routes to #11 |
| 19 | Generate a status report | âœ… PASS | test_canonical_handlers.py | Report generation |
| 20 | Search for X in documents | âœ… PASS | test_document_handlers.py | Notion search |

### âš ï¸ Predictive Queries (20% - Beta Target)

| # | Query | Status | Test File | Notes |
|---|-------|--------|-----------|-------|
| 21 | What should I focus on today? | âš ï¸ PARTIAL | test_canonical_handlers.py | Time-based only |
| 22 | What patterns do you see? | âŒ NOT IMPL | - | Beta: LearnedPattern reporting |
| 23 | What risks should I be aware of? | âŒ NOT IMPL | - | Beta: Stale project detection |
| 24 | What opportunities should I pursue? | âŒ NOT IMPL | - | Beta: Feature suggestions |
| 25 | What's the next milestone? | âŒ NOT IMPL | - | Beta: Milestone extraction |

### âŒ Conversational Queries (0% - New)

| # | Query | Status | Test File | Notes |
|---|-------|--------|-----------|-------|
| 26 | What else can you help with? | âŒ NOT IMPL | - | Contextual discovery |
| 27 | Tell me more about X | âŒ NOT IMPL | - | Feature deep-dive |
| 28 | How do I use X? | âŒ NOT IMPL | - | Feature guidance |
| 29 | What changed since X? | âŒ NOT IMPL | - | Diff view |
| 30 | What needs my attention? | âŒ NOT IMPL | - | Notification aggregation |

### âŒ Scheduling & Reminders (0% - New)

| # | Query | Status | Test File | Notes |
|---|-------|--------|-----------|-------|
| 31 | Schedule a meeting about X | âŒ NOT IMPL | - | Calendar creation |
| 32 | Remind me to X | âŒ NOT IMPL | - | Reminder system |
| 33 | Find time for X with Y | âŒ NOT IMPL | - | Calendar deconfliction |
| 34 | How much time in meetings? | âŒ NOT IMPL | - | Time audit |
| 35 | Review my recurring meetings | âŒ NOT IMPL | - | Meeting audit |

### âŒ Document Management (0% - New)

| # | Query | Status | Test File | Notes |
|---|-------|--------|-----------|-------|
| 36 | Create doc from conversation | âŒ NOT IMPL | - | Conversation â†’ Doc |
| 37 | Compare these documents | âŒ NOT IMPL | - | Document diff |
| 38 | Synthesize these sources | âŒ NOT IMPL | - | Multi-doc synthesis |
| 39 | Find docs about X | âŒ NOT IMPL | - | Notion search (partial via #20) |
| 40 | Update the X document | âŒ NOT IMPL | - | Notion update |

### âŒ GitHub Operations (0% - New)

| # | Query | Status | Test File | Notes |
|---|-------|--------|-----------|-------|
| 41 | What did we ship this week? | âŒ NOT IMPL | - | Release tracking |
| 42 | Show me stale PRs | âŒ NOT IMPL | - | PR hygiene |
| 43 | What's blocking the milestone? | âŒ NOT IMPL | - | Blocker identification |
| 44 | Create issues from this meeting | âŒ NOT IMPL | - | Meeting â†’ Issues |
| 45 | Close completed issues | âŒ NOT IMPL | - | Issue hygiene |
| 58 | Update issue #X | âŒ NOT IMPL | - | Issue mutation |
| 59 | Comment on issue #X | âŒ NOT IMPL | - | Issue discussion |
| 60 | Review issue #X | âŒ NOT IMPL | - | Issue inspection |

### âŒ Slack Communication (0% - New)

| # | Query | Status | Test File | Notes |
|---|-------|--------|-----------|-------|
| 46 | Any mentions I missed? | âŒ NOT IMPL | - | Mention tracking |
| 47 | Summarize #channel | âŒ NOT IMPL | - | Channel digests |
| 48 | Post update to team | âŒ NOT IMPL | - | Broadcast messages |
| 49 | /standup | âŒ NOT IMPL | - | Slash command |
| 50 | /piper help | âŒ NOT IMPL | - | Slash discovery |

### âŒ Productivity Tracking (0% - New)

| # | Query | Status | Test File | Notes |
|---|-------|--------|-----------|-------|
| 51 | What's my productivity? | âŒ NOT IMPL | - | Personal metrics |
| 52 | Are we on track? | âŒ NOT IMPL | - | Goal tracking |
| 53 | What did the team accomplish? | âŒ NOT IMPL | - | Team metrics |

### âŒ Todo Management (0% - Critical Gap)

| # | Query | Status | Test File | Notes |
|---|-------|--------|-----------|-------|
| 54 | Add a todo | âŒ NOT IMPL | - | **FUNDAMENTAL CRUD** |
| 55 | Complete todo | âŒ NOT IMPL | - | **FUNDAMENTAL CRUD** |
| 56 | Show my todos | âŒ NOT IMPL | - | **FUNDAMENTAL CRUD** |
| 57 | What's my next todo? | âŒ NOT IMPL | - | Priority query |

### âŒ Calendar Extended (0% - New)

| # | Query | Status | Test File | Notes |
|---|-------|--------|-----------|-------|
| 61 | What's my week look like? | âŒ NOT IMPL | - | Week planning |
| 62 | Check calendar conflicts | âŒ NOT IMPL | - | Conflict detection |

### âŒ Knowledge Operations (0% - New)

| # | Query | Status | Test File | Notes |
|---|-------|--------|-----------|-------|
| 63 | Upload a file | âŒ NOT IMPL | - | Knowledge ingestion |

---

## Testing Protocol

### For E2E Alpha Testing

1. **Test PASS queries first** (19 queries)
   - Verify all formatters (EMBEDDED/STANDARD/GRANULAR)
   - Test with real data
   - Confirm graceful degradation

2. **Test PARTIAL queries** (1 query)
   - Verify current functionality
   - Document what's missing
   - Test fallback behavior

3. **Test NOT IMPL queries** (43 queries)
   - Verify graceful "not implemented" response
   - Document user experience
   - Note which feel most critical

### Priority for Implementation

**Critical Gaps** (implement first):
1. Todo CRUD (#54-57) - Fundamental functionality missing
2. GitHub mutations (#58-60) - Users expect these
3. Conversational glue (#26-30) - Discovery issues

**Beta Targets** (next wave):
1. Complete Predictive (#21-25) - Infrastructure exists
2. Scheduling basics (#31-32) - Calendar integration
3. Core Slack (#49-50) - Slash commands

**v1.0 Targets** (production ready):
1. Document management (#36-40)
2. GitHub advanced (#41-45)
3. Productivity tracking (#51-53)

---

## Test Coverage Commands

```bash
# Run all canonical tests
pytest tests/unit/services/intent_service/test_canonical_handlers.py -v

# Run specific category tests
pytest tests/unit/services/intent_service/test_canonical_handlers.py::TestIdentityQueries -v
pytest tests/unit/services/intent_service/test_canonical_handlers.py::TestTemporalQueries -v
pytest tests/unit/services/intent_service/test_canonical_handlers.py::TestSpatialQueries -v

# Run agenda-specific tests
pytest tests/unit/services/intent_service/test_agenda_query.py -v

# Run document handler tests
pytest tests/unit/services/intent_service/test_document_handlers.py -v

# Count total tests
pytest tests/unit/services/intent_service/ --co -q | grep "<Function\|<Method" | wc -l
# Current: 227 tests
```

---

## Notes for Lead Developer

### When Testing NOT IMPL Queries
These should return graceful fallback messages, not errors:
- HTTP 200 (not 422)
- User-friendly message
- Suggestion for alternatives

### When Testing PARTIAL Queries
Document specifically what works vs what doesn't:
- Query #21 returns time-based guidance
- Missing: calendar integration, urgency signals

### When Adding New Implementations
1. Update this matrix
2. Add tests to test files
3. Verify all 3 formatters
4. Update ALPHA_KNOWN_ISSUES.md
5. Close GitHub issue with evidence

---

*Use this matrix for systematic E2E testing of all canonical queries. Update after each implementation sprint.*
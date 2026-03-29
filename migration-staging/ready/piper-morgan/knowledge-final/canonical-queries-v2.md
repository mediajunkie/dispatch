# Canonical Queries v2

**Version**: 2.0  
**Date**: December 25, 2025  
**Total Queries**: 63  
**Status**: 19/63 implemented (30%)  

## Change Log
- Removed Query #15 (lifecycle - too abstract)
- Added 39 new queries (#26-63) from alpha testing insights
- Reclassified Predictive queries as Beta-capable
- Added integration-specific categories

---

## Identity Queries (COMPLETE: 5/5)

### 1. What's your name and role? âœ…
- What's your name?
- Who are you?
- What do you do?
- Tell me about yourself

### 2. What can you help me with? âœ…
- What can you do?
- How can you help me?
- What are your capabilities?
- Show me what you can do

### 3. Are you working properly? âœ…
- Are you working?
- Is everything working?
- What's your status?
- Are you online?

### 4. How do I get help? âœ…
- I need help
- How do I use you?
- Can you help me?
- What should I ask you?

### 5. What makes you different? âœ…
- What's special about you?
- Why should I use you?
- What's your unique value?
- How are you different from other tools?

---

## Temporal Queries (COMPLETE: 5/5)

### 6. What day is it? âœ…
- What's today's date?
- What day of the week is it?
- What's the current date?
- Tell me the date

### 7. What did we accomplish yesterday? âœ…
- What did we do yesterday?
- What happened yesterday?
- Show me yesterday's work
- What was completed yesterday?

### 8. What's on the agenda for today? âœ…
- What should I work on today?
- What's my schedule today?
- What's planned for today?
- Show me today's tasks

### 9. When was the last time we worked on this? âœ…
- When did we last work on this?
- How long ago was this updated?
- What's the last activity on this?
- When was this last modified?

### 10. How long have we been working on this project? âœ…
- How long has this project been active?
- When did we start this project?
- What's the project timeline?
- How old is this project?

### ~~15. Where are we in the project lifecycle?~~ [REMOVED]
- *Removed: Too abstract, assumes workflow tracking not implemented*

---

## Spatial Queries (80%: 4/5)

### 11. What projects are we working on? âœ…
- Show me all projects
- List our projects
- What projects do we have?
- Give me a project overview

### 12. Show me the project landscape âœ…
- What's our project portfolio?
- Give me a project overview
- Show me all our work
- What's our project status?

### 13. Which project should I focus on? âœ…
- What's the most important project?
- Which project needs attention?
- What should I prioritize?
- Which project is urgent?

### 14. What's the status of project X? âœ…
- How is project X doing?
- What's happening with project X?
- Give me an update on project X
- What's the progress on project X?

---

## Capability Queries (COMPLETE: 5/5)

### 16. Create a GitHub issue about X âœ…
- Make a GitHub issue for X
- Open a GitHub issue about X
- File a GitHub issue for X
- Create a ticket for X

### 17. Analyze this document âœ…
- What's in this document?
- Summarize this document
- Review this document
- Tell me about this document

### 18. List all my projects âœ…
- Show me my projects
- What projects do I have?
- Give me a project list
- Show all projects

### 19. Generate a status report âœ…
- Create a status report
- Give me a status update
- Show me the current status
- What's our status?

### 20. Search for X in our documents âœ…
- Find documents about X
- Search our files for X
- Look for X in our docs
- Find information about X

---

## Predictive Queries [BETA] (20%: 1/5)

### 21. What should I focus on today? âš ï¸ PARTIAL
- What's my priority today?
- What should I work on?
- What's most important today?
- What needs my attention?
- **Status**: Time-based only, needs calendar integration

### 22. What patterns do you see? âŒ
- What trends are you noticing?
- What patterns have you observed?
- What insights do you have?
- What are you seeing?
- **Beta Target**: Basic pattern reporting from LearnedPattern table

### 23. What risks should I be aware of? âŒ
- What should I worry about?
- What risks do you see?
- What could go wrong?
- What should I watch out for?
- **Beta Target**: Stale projects, missed deadlines

### 24. What opportunities should I pursue? âŒ
- What should I explore?
- What opportunities do you see?
- What should I look into?
- What's worth pursuing?
- **Beta Target**: Unused integrations, underutilized features

### 25. What's the next milestone? âŒ
- What's coming up next?
- What's the next deadline?
- What should I prepare for?
- What's on the horizon?
- **Beta Target**: GitHub + Calendar milestone extraction

---

## Conversational Queries (NEW) (0/5)

### 26. What else can you help with? âŒ
- What other capabilities do you have?
- Show me more options
- What else can we do?
- **Purpose**: Contextual capability discovery

### 27. Tell me more about X feature âŒ
- Explain how X works
- How does X help me?
- What is X for?
- **Purpose**: Feature deep-dive

### 28. How do I use X? âŒ
- Show me how to X
- Guide me through X
- Help me with X
- **Purpose**: Feature guidance

### 29. What changed since X? âŒ
- What's new since yesterday?
- Show me recent updates
- What changed this week?
- **Purpose**: Diff view of changes

### 30. What needs my attention? âŒ
- What's urgent?
- Show me what's on fire
- Any blockers?
- **Purpose**: Notification aggregation

---

## Scheduling & Reminders (NEW) (0/5)

### 31. Schedule a meeting about X âŒ
- Book time to discuss X
- Set up a meeting for X
- Schedule X for tomorrow
- **Integration**: Google Calendar

### 32. Remind me to X âŒ
- Set a reminder for X
- Don't let me forget X
- Alert me about X
- **Integration**: Calendar + Notifications

### 33. Find time for X with Y âŒ
- When can we meet?
- Find a slot for X
- Schedule time with Y
- **Purpose**: Calendar deconfliction

### 34. How much time in meetings? âŒ
- Meeting time this week
- Am I overscheduled?
- Calendar analysis
- **Purpose**: Time audit

### 35. Review my recurring meetings âŒ
- Audit my standing meetings
- Which meetings can I drop?
- Meeting efficiency check
- **Purpose**: Calendar optimization

---

## Document Management (NEW) (0/5)

### 36. Create a doc from this conversation âŒ
- Save this as a document
- Turn this into notes
- Document this discussion
- **Output**: Notion/Markdown

### 37. Compare these documents âŒ
- What's different between X and Y?
- Compare versions
- Show me the changes
- **Purpose**: Document diff

### 38. Synthesize these sources âŒ
- Combine these documents
- Merge these notes
- Create summary from sources
- **Purpose**: Multi-doc synthesis

### 39. Find docs about X âŒ
- Search documents for X
- What do we have on X?
- Show me X documentation
- **Integration**: Notion search

### 40. Update the X document âŒ
- Edit X document
- Add this to X doc
- Update X with new info
- **Integration**: Notion update

---

## GitHub Operations (NEW) (0/8)

### 41. What did we ship this week? âŒ
- Show closed PRs
- What got merged?
- Weekly GitHub summary
- **Purpose**: Release tracking

### 42. Show me stale PRs âŒ
- Old pull requests
- PRs needing review
- Stuck PRs
- **Purpose**: PR hygiene

### 43. What's blocking the milestone? âŒ
- Milestone blockers
- What's holding us up?
- Impediments to release
- **Purpose**: Blocker identification

### 44. Create issues from this meeting âŒ
- Turn action items into issues
- File these as GitHub issues
- Create tickets from notes
- **Purpose**: Meetingâ†’Issues

### 45. Close completed issues âŒ
- Clean up done issues
- Close finished tickets
- Archive completed work
- **Purpose**: Issue hygiene

### 58. Update issue #X âŒ
- Edit issue #X
- Change issue description
- Modify ticket #X
- **Purpose**: Issue mutation

### 59. Comment on issue #X âŒ
- Add comment to #X
- Reply to issue #X
- Update issue thread
- **Purpose**: Issue discussion

### 60. Review issue #X âŒ
- Show me issue #X
- What's in ticket #X?
- Issue #X details
- **Purpose**: Issue inspection

---

## Slack Communication (NEW) (0/5)

### 46. Any mentions I missed? âŒ
- Unread mentions
- Who mentioned me?
- Catch me up on mentions
- **Purpose**: Mention tracking

### 47. Summarize #channel from yesterday âŒ
- Channel summary
- What happened in #general?
- Catch up on #channel
- **Purpose**: Channel digests

### 48. Post this update to the team âŒ
- Share with team
- Post to Slack
- Send team update
- **Purpose**: Broadcast messages

### 49. /standup âŒ
- Slack slash command
- Generate standup in Slack
- **Purpose**: Native Slack command

### 50. /piper help âŒ
- Slack help command
- Show Slack commands
- **Purpose**: Slack discovery

---

## Productivity Tracking (NEW) (0/3)

### 51. What's my productivity this week? âŒ
- How productive was I?
- Weekly metrics
- My accomplishments
- **Purpose**: Personal metrics

### 52. Are we on track? âŒ
- Milestone progress
- Project health check
- On schedule check
- **Purpose**: Goal tracking

### 53. What did the team accomplish? âŒ
- Team summary
- Group accomplishments
- Collective progress
- **Purpose**: Team metrics

---

## Todo Management (NEW) (0/4)

### 54. Add a todo âŒ
- Create task
- Add to my list
- New todo: X
- **Purpose**: Todo creation

### 55. Complete todo âŒ
- Mark X as done
- Complete task X
- Check off X
- **Purpose**: Todo completion

### 56. Show my todos âŒ
- List my tasks
- What are my todos?
- Show task list
- **Purpose**: Todo listing

### 57. What's my next todo? âŒ
- Next task
- What should I do next?
- Priority task
- **Purpose**: Todo prioritization

---

## Calendar Extended (NEW) (0/2)

### 61. What's my week look like? âŒ
- Week ahead view
- Weekly calendar
- This week's schedule
- **Purpose**: Week planning

### 62. Check calendar for conflicts âŒ
- Calendar conflicts
- Double-booked?
- Schedule problems
- **Purpose**: Conflict detection

---

## Knowledge Operations (NEW) (0/1)

### 63. Upload a file âŒ
- Add to knowledge base
- Import document
- Store this file
- **Purpose**: Knowledge ingestion

---

## Summary by Implementation Status

### Complete Categories
- **Identity**: 5/5 (100%) âœ…
- **Temporal**: 5/5 (100%) âœ…
- **Capability**: 5/5 (100%) âœ…

### In Progress Categories
- **Spatial**: 4/5 (80%)
- **Predictive**: 1/5 (20%) - PARTIAL implementation

### Not Started Categories (39 queries)
- **Conversational**: 0/5
- **Scheduling**: 0/5
- **Documents**: 0/5
- **GitHub Ops**: 0/8
- **Slack**: 0/5
- **Productivity**: 0/3
- **Todos**: 0/4
- **Calendar Extended**: 0/2
- **Knowledge**: 0/1

### Overall Progress
- **Implemented**: 19/63 (30%)
- **Partial**: 1/63 (2%)
- **Not Implemented**: 43/63 (68%)

---

## Release Targets

### Alpha (Current)
Focus on core implemented queries (19) for testing and refinement.

### Beta (v0.9)
- Complete Predictive category with heuristic implementations
- Add Todo Management (fundamental CRUD)
- Add core GitHub operations
- Target: 40/63 queries (63%)

### v1.0 (Production)
- All integration queries functional
- Conversational glue implemented
- Document management operational
- Target: 55/63 queries (87%)

### v1.1 (Enhancement)
- ML-enhanced predictive analytics
- Advanced document synthesis
- Team collaboration features
- Target: 63/63 queries (100%)

---

*Note: This list represents the comprehensive jobs-to-be-done identified through alpha testing, design sessions, and user feedback. Not all queries need to be implemented for MVP, but all represent real user needs.*
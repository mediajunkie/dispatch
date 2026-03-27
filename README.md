# Dispatch Home

This folder is the working directory for Dispatch — xian's cross-project coordinator running in Claude Cowork/Dispatch mode.

## Folder Rules

1. **`~/cool/dispatch/`** — General deliverables related to how xian and Dispatch work together, and tools that cross between projects. This folder.
2. **`~/cool/dinp/`** — Work cutting across xian's AI experiments and projects done on his own dime (Piper Morgan, Klatch, etc.)
3. **Project-specific folders** — Work done specifically for one project produces deliverables in that project's folder (e.g., `~/cool/VA/` for VA work, `~/cool/piper-morgan/` for Piper, `~/cool/klatch/` for Klatch)

## What Lives Here

- `dispatch-activity-log.md` — Running daily log of Dispatch sessions (primary copy; also mirrored to dinp for visibility)
- `PROTOCOLS.md` — Coordination protocols (signaling conventions, inter-agent communication, handoff patterns)
- `mail/` — Inbox/outbox for cross-project memos between Dispatch and other agents (Archie, Docs, etc.)

## Mounted Folders (as of March 23, 2026)

| Alias | Path | Purpose |
|-------|------|---------|
| dispatch | ~/cool/dispatch | This folder — Dispatch home base |
| piper-morgan | ~/cool/piper-morgan | Piper Morgan project |
| klatch | ~/cool/klatch | Klatch project |
| dinp | ~/cool/dinp | Design in Product (cross-project) |
| VA | ~/cool/VA | VA Decision Reviews |
| layersofmeta | ~/cool/layersofmeta | Layers of Meta (music) |
| one-job | ~/cool/one-job | One Job (task manager) |

## Multi-Dispatch Tenancy Model

As of March 27, 2026, there are (or will be) two Dispatch instances:

### Dispatch-DinP (Primary)
- **Account**: xian@designinproduct.com (20x Max)
- **Scope**: All personal, creative, and entrepreneurial work — Piper Morgan, Klatch, Design in Product, Radio Free Airlift, Layers of Meta, One Job, accounts consolidation, cross-project coordination
- **Filesystem**: Read/write to `~/cool/dispatch/` (owns the activity log), all project folders
- **Activity log**: Dispatch-DinP owns and updates `dispatch-activity-log.md`

### Dispatch-Kind (Legacy / VA-only)
- **Account**: ccrumlish@kindsys.us (Pro)
- **Scope**: VA Decision Reviews only, Kind Systems work
- **Filesystem**: Read-only from `~/cool/dispatch/` for shared context; write only to `~/cool/VA/dispatch/` for VA-specific signals
- **Activity log**: Does NOT update the main activity log. VA-specific notes go to `~/cool/VA/dispatch/`
- **Status**: This session will be deprecated once Dispatch-DinP is fully operational and VA coordination is stable through Archie

### Conflict Prevention
- Only ONE Dispatch instance updates `dispatch-activity-log.md` (Dispatch-DinP)
- VA signals go through `~/cool/VA/dispatch/` regardless of which Dispatch sends them
- Archie's signaling channel is unchanged — both Dispatches can read/write to `~/cool/VA/dispatch/`
- Cowork sessions are anchored to a single machine — two Dispatch sessions cannot run on the same computer simultaneously
- Git commits from Dispatch should include `[dispatch-dinp]` or `[dispatch-kind]` in the message to track provenance

## Key Files

- `memory/` — Dispatch's memory files (user profile, project contexts, workflow knowledge, feedback)
- `PROTOCOLS.md` — Signaling conventions, data policies, five-layer model reference
- `plans/` — Migration plans, consolidation strategy
- `intelligence/` — Cross-pollination digests, consumption guides, hooks instructions
- `research/` — MCP/UTCP/A2A protocol research
- `archives/` — Mined project contents (PAPM, Dharma Bots, One Job)
- `claude-project-downloads/` — Export ZIPs from all 4 Anthropic accounts + MANIFEST.md

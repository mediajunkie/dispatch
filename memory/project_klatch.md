---
name: project_klatch
description: Klatch - local-first Claude conversation manager, TypeScript/Hono/React, multi-agent team with mythological names
type: project
---

**Klatch** is a local-first web app for managing Claude AI conversations. Slack-inspired interface with channels, each a distinct Claude persona. Multi-entity conversations (klatches) with panel/roundtable/directed modes.

Local: ~/Development/klatch | GitHub: Design-in-Product/klatch

Tech: TypeScript monorepo (npm workspaces) — Hono backend, React 19 + Vite frontend, SQLite (better-sqlite3), Anthropic SDK, SSE streaming.

**Agent team** (mythological names): Daedalus (architecture/implementation), Argus (quality/testing), Theseus Prime (manual testing), Calliope (writing/docs), Mnemosyne (knowledge steward), plus imported agents (Ariadne, Hermes, Secundus, CIO, ETA).

**Coordination**: Async handoff via COORDINATION.md status board, inter-agent memos in docs/mail/, session logs. No GitHub Issues — uses ROADMAP.md, EPICS.md, round-based assignments.

**Methodology**: Gall's Law (smallest working increment), AXT (Agent Experience Testing), 5-layer prompt assembly, test-driven contracts (Argus writes tests, Daedalus implements).

**Current state**: v0.8.6, Step 8¾ complete, 622 tests (zero failures). Next: sidebar redesign, project memory tests, klatch creation UI.

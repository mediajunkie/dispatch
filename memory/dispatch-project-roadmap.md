---
name: dispatch-project-roadmap
description: Master list of longer-term projects and initiatives tracked by Dispatch — beyond the daily operational queue
type: reference
---

# Dispatch Project Roadmap
*Created: 2026-04-09 | Maintained by: Dispatch-DinP*

This is the long-horizon project list. These are not daily tasks — they are initiatives that span weeks or months, some active, some queued, some blocked. The daily brief and activity log track operational items; this file tracks the bigger picture.

---

## Active Projects

### 1. Open Laws Sprint (Kind side)
**Status:** Active — sprint kicked off Apr 7
**Owner:** xian + Kind team (Vergil, Piper Open, Dispatch-K)
**What:** 6-week AI-maximalist skunkworks for Open Laws. Two bets in flight: Bet A (MCP server — POC built), Bet B (StateNet screening replacement). LegalTech Fund Lab timing window.
**DinP role:** Cross-pollination, RFC-001 mapping comparison, coordination via Dispatch-K channel.

### 2. Piper Morgan
**Status:** Active — UAT round 2 in progress
**Owner:** xian + PM agent team (PA, Docs, CXO, CIO, Lead Dev, etc.)
**What:** Ongoing product development. Current: UAT Findings 3/4/5 resolution, weekly ship cadence, Haiku 3 retirement prep (Apr 19).
**Note:** PM Chat Project knowledge is current (zombie lie killed Apr 5).

### 3. Klatch
**Status:** Active but quiet this week
**Owner:** xian + Klatch team (Calliope, Daedalus, Argus, Iris, Theseus)
**What:** v0.9.0 pending, Paste It Again blog review, AAXT Phase 1 shipped, Argus sweep refactor needed (semi-autonomous). xian catching up today.

### 4. Cross-Pollination Distribution System
**Status:** Requirements defined, handed to Janus
**Owner:** Janus (implementation), Dispatch-DinP (requirements)
**What:** Two-tier distribution: daily local copies of xpoll briefs to each reader project repo + weekly digest updates. Readers: Klatch, Piper Morgan, OpenLaws, Dispatch. Source: designinproduct + OpenLaws (new). Gap: weekly digest stale since Apr 3 (sweep migration dropped the pipeline).

### 5. RFC-001 Five-Layer Context Model
**Status:** v2 committed Apr 8, mapping cross-pollination in progress
**Owner:** Dispatch-DinP (lead on mapping comparison)
**What:** Standards document for multi-agent context injection. v2 synthesized all three project responses. Next: compare DinP mapping with Kind side's OpenLaws mapping, help projects update to v2 terminology.

### 6. Usage Tracking
**Status:** Active — manual daily snapshots
**Owner:** Dispatch-DinP + xian
**What:** Daily usage snapshots for 3 accounts (dinp, kindsys, mediajunkie). Currently manual (sneakernet). Future: automate via Chrome extension, ccusage CLI, or eventual API. Spec at plans/usage-dashboard-v0.md.

---

## Queued Projects (priority order per xian, Apr 9)

### 7. Anthropic Accounts Consolidation
**Status:** Phase 1 partially complete, paused
**Owner:** xian + Dispatch-DinP
**What:** Consolidate 4 Anthropic accounts to 1-2. Target: designinproduct.com (primary) + kindsys.us (Kind work). Phase 1 migration partially done (Dharma Bots, PAPM, music, One Job). mediajunkie cancels Apr 15. crispybacon canceled (access through June). Detailed plan at plans/anthropic-accounts-consolidation-plan-v2.md.
**Remaining:** mediajunkie walkthrough with Janus (6 days), crispybacon projects to migrate before June, One Job file uploads pending.

### 8. Radio Free Airlift (RFA) — Priority 1 (queued)
**Status:** Project set up on designinproduct.com, needs resumed attention
**Owner:** xian (has existing Claude Project for this)
**Dispatch role:** Daily check-in item — remind and track progress as xian finds time
**What:** Personal web presence overhaul. Three properties:
- ezone.org (Rackspace) — Enterzone webzine archive (1994-1998). Goal: curate as digital coffee table book. Blocked on archive.org repair.
- mediajunkie.com (WPEngine) — WordPress blog with rich archives. Migrate to self-hosted (Eleventy considered). WPEngine overpriced.
- GitHub Pages sites — align and consolidate.
**Recurring costs to eliminate:** Rackspace + WPEngine hosting.
**Sequence:** Fix ezone.org → curate Enterzone → migrate mediajunkie.com → consolidate → align modern sites.
**Blocked on:** archive.org repair for ezone.org content.

### 9. Rebel Alliance Website — Priority 2 (queued)
**Status:** Successfully migrated to designinproduct.com. Website repo exists. Nearly finished.
**Owner:** xian
**Dispatch role:** Track progress as project takes shape; xian will start a Code agent to clone the repo and assess gap to launch.
**What:** Finish the Rebel Alliance website. Cowork space provisioned Mar 29. Project migrated to dinp account (no longer blocked by mediajunkie deadline).

### 10. Layers of Meta / Music — Priority 4 (queued)
**Status:** Materials extracted, paused
**Owner:** xian
**What:** Music project. 3 projects, 22 conversations extracted to ~/cool/layersofmeta/. Genius lyrics experiment started (4 songs on artist page). Paused for other priorities.

### 11. The Epistrophikon
**Status:** Active (xian writes independently)
**Owner:** xian
**Dispatch role:** Awareness only — the novel has a claim on xian's time and attention but does not require meta-assistance.
**What:** Historical novel. xian writes pieces and shares on Wooshville. Not a Dispatch-managed project — just tracking that it exists and xian works on it regularly.

### 12. One Job — Priority 3 (queued)
**Status:** Migration planned, awaiting file uploads
**Owner:** xian
**What:** Project from kindsys account. Repo is source of truth (Nov 2025 activity). Migration plan finalized Mar 26. Xian needs to upload files from repo. Cowork space provisioned.

---

## Infrastructure / Ongoing

### 13. Daily Brief Automation
**Status:** Operational
**What:** Scheduled task runs daily, generates brief via osascript. Reliable since Apr 7 fix. Zombie lie guard in place.

### 14. Dispatch-Kind Bilateral Signaling
**Status:** Operational
**What:** Full duplex via shared GitHub repo. Session-start mailbox sweep now standard on both sides. Channel healthy.

### 15. Argus Sweep Refactor
**Status:** Needs design work
**What:** Refactor the Klatch Argus sweep to run semi-autonomously even when Argus is idle. Currently manual/session-dependent, 13+ days overdue. xian to discuss with Calliope.

### 16. Gmail Filter Reconstruction
**Status:** Paused
**What:** During a security breach, xian deleted all Gmail filters. Now flooded with previously-filtered mail. High-leverage fix: identify top volume senders and batch-create filters. No Gmail MCP — Chrome extension tools are the option.

---

*This file should be updated whenever projects are added, completed, or change status. It complements the daily activity log and the daily brief's carried queue.*


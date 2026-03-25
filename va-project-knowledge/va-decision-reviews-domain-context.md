# VA Decision Reviews — Domain Context Summary

**Compiled by**: Archie (VA Operational Support Partner)
**For**: Dispatch (cross-project coordinator)
**Date**: March 23, 2026

---

## What Decision Reviews Are

Under the Appeals Modernization Act (AMA, 2019), when a Veteran receives a decision on a disability benefits claim that they disagree with, they have three pathways to contest it. These are collectively called "Decision Reviews":

**Supplemental Claim (SC)** — Veteran submits new and relevant evidence to support their case. Same reviewer level. Most common pathway. The team builds and maintains the VA.gov digital form for this.

**Higher-Level Review (HLR)** — A more senior reviewer re-examines the same evidence. No new evidence allowed. Veteran can request an informal conference (phone call with reviewer). Digital form on VA.gov.

**Notice of Disagreement (NOD) / Board Appeal** — Veteran appeals to the Board of Veterans' Appeals. Three sub-options: direct review, evidence submission, or hearing with a Veterans Law Judge. Most complex pathway. Digital form on VA.gov.

The team's product portfolio also includes the **Enhanced Decision Review Onramp** — a tool to help Veterans understand which pathway fits their situation, reducing confusion-driven switching between pathways.

## The Team

**"Badgeless" model**: The team is a mix of VA government staff (OCTO) and contractor staff (Kind Systems). They operate as one integrated team — "badgeless" means they don't distinguish between gov and contractor in daily work, though contractual boundaries exist.

**Kind Systems side** (xian's employer):
- **xian (Christian Crumlish)** — Product Manager, our primary human
- **Grace Xu** — Engineering Lead
- **Kyra Berman-Gestring** — UX Design Lead
- **Lauren Dawson** — UX Designer
- **Cindy Lackey** — Content Specialist
- **Randi Mays** — Engineer (OOO Fridays)
- **Pam Macalintal** — Delivery Lead
- **Mark** — Delivery Leadership

**Government side** (OCTO):
- **Amy Lai** — Government Product Owner. Key relationship — she sets priorities, prefers high-level goal tracking with details in epics
- **Cory Sohrakoff** — Engineering
- **Julie Strothman** — Design + Research
- **Tracy** — Accessibility

**Kind Systems leadership**: John (CEO). Relevant because the consulting context means demonstrating incremental value to OCTO is an active concern.

## Current State (as of Sprint 25, ~March 2026)

**Primary focus: SC Step 3 Redesign.** The Supplemental Claims form's Step 3 (evidence submission) had date validation errors that revealed deeper structural misalignment with current VA Design System (VADS) standards. What started as a bug fix became a holistic redesign. Key facts:
- V3 file uploader is out of collab cycle scope
- Content work not required before engineering handoff (~Mar 19–20)
- A smaller patch for the core date bug was being considered for faster Veteran relief
- SC Providers rename also in flight
- Engineering handoff executed around Mar 19

**Secondary: Veteran Pain Points (VPP) initiative.** 13+ pain points rewritten in plain language, tracked in a backlog with actionable/blocked/needs-research tags. Confirmed by Amy.

**On the horizon:**
- 4142 standalone form — handed off from Veteran Facing Forms team, roadmap epic deferred pending inventory findings
- Sprint 26 goal refinement in progress
- CaseFlow outage was a recent incident (noted Mar 20)

## How the Team Works

**Sprint cadence**: 2-week sprints, numbered sequentially. Currently in the mid-20s. Named with fun names (Sprint 24 = "Wiley").

**Estimation**: Fibonacci points. 1 = <1 day, 2 = 1 day, 3 = couple days, 5 = 1 week, 8 = full sprint, 13 = multi-sprint (requires breakdown).

**Communication**:
- **Slack** is primary. Canvases used for planning artifacts (refinement, SC3 plans, etc.)
- **Weekly Ships** are narrative/storytelling format with emoji section headers — these are xian's primary reporting artifact
- **Team of Teams (ToT)** slides use concise bullets with metrics and ticket numbers
- **GitHub** for issues, epics, project management
- **Datadog** for latency/error monitoring
- **Granola** for meeting transcription
- Async-first with external teams; meetings only when efficient

**Capacity reality**: ~75–80% of team capacity is driven by top-down OCTO directives and production issues. Discretionary capacity is limited. Backlog is chronically overcommitted.

## OCTO's Strategic Framework

**The 3 S's**: Speed, Stability, Satisfaction — OCTO's north star for all VA.gov products.

**4-pillar strategy** for Decision Reviews improvements (details in DR_North_Star_and_Metrics_Reference.md).

**Quarterly planning**: Uses RICE prioritization. Amy prefers goal-level tracking with detailed deliverables in associated epic tickets. Quarterly health view tracks metrics across the 3 S's.

## Key Artifacts xian Produces

- **Weekly Ships**: Narrative sprint summaries, ~weekly cadence, emoji headers, shipped to leadership
- **ToT decks**: PowerPoint slides for Team of Teams cross-team meetings
- **Sprint Review decks**: More detailed PowerPoint for sprint demos
- **Daily logs**: Structured daily notes for Claude-assisted session continuity
- **Initiative briefs, product guides, project plans**: As needed for new work

## Technical Architecture (high level)

- **Frontend**: React-based forms on VA.gov platform (vets-website repo)
- **Backend**: vets-api communicating with Lighthouse APIs
- **Monitoring**: Datadog dashboards and alerts per application
- **Key APIs**: Lighthouse benefits intake API, CMP pipeline, VA Notify
- **Design system**: VADS (VA Design System) — staying current with VADS is an ongoing concern

## What xian Needs From Us

xian's work is roughly: 50% coordination and communication (meetings, ships, ToT, stakeholder management), 30% planning and strategy (roadmaps, initiative briefs, backlog refinement), 20% hands-on documentation and analysis. The AI support role is about amplifying all three — drafting artifacts, maintaining context across conversations, surfacing relevant information, and handling the operational overhead so xian can focus on the judgment-intensive parts.

---

*This summary is Archie's synthesis from imported project knowledge. Dispatch should treat it as a working reference, not gospel — details may have shifted since the last knowledge update.*

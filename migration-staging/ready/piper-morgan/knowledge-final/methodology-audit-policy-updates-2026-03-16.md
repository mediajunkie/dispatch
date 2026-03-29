# Methodology Audit Policy Updates — March 2026

**Approved by**: PM (xian), March 16, 2026  
**Effective**: Immediately  
**Source**: Methodology Audit findings (March 15, 2026), Sections 4.1 and 4.4

---

## Policy 1: Trigger-Based Methodology Audit Cadence

**Replaces**: Calendar-based 6-8 week cadence (staggered-audit-calendar-2026.md, Weeks 7, 14, 21, etc.)

### The New Rule

Methodology audits are triggered by **sprint gate closures**, not calendar dates. The audit should be conducted within **2 weeks** of each sprint gate closing.

### How It Works

1. **Lead Dev closes a sprint gate** (e.g., #779 for M0, future gate for M1).
2. **Within 2 weeks**, CIO conducts a methodology audit covering the period since the last audit.
3. **The audit reviews**: the sprint just completed, the interstitial period before it, and any methodology innovations that emerged.
4. **If no sprint gate closes for 8+ weeks**, CIO conducts a time-triggered audit to prevent drift. This is the safety net, not the normal cadence.

### Why This Is Better Than Calendar-Based

The methodology evolves most during and immediately after sprints. Calendar-based scheduling created pressure to audit mid-sprint (when findings are incomplete) or caused slippage when sprint work took priority (this audit slipped 12 days). Trigger-based scheduling ensures the audit captures a full work cycle and falls naturally in the post-sprint consolidation period when there's time for reflection.

### Tracking

The staggered audit calendar should be updated to reflect this change. The "Methodology Audit" row becomes trigger-based with an 8-week maximum interval. The Chief of Staff tracks sprint gate closures and flags when the 2-week audit window opens.

### Precedent

M0 gate closed March 4. This audit was conducted March 15 (11 days later). That's within the 2-week window and produced a richer audit than a calendar-forced mid-sprint review would have.

### Next Trigger

M1 sprint gate closure → CIO methodology audit within 2 weeks.

---

## Policy 2: CIO Self-Approval for Emerging Patterns

**Replaces**: Full pipeline requiring PM approval before catalog entry (CIO identifies → CIO drafts → PM reviews → PM approves → Docs commits)

### The New Rule

The CIO may draft a pattern and add it to the pattern catalog in **"Emerging"** status without PM pre-approval. The PM retains authority to:
- **Upgrade** to "Proven" status (after sufficient validation)
- **Request changes** (if the pattern description is inaccurate or unclear)
- **Demote or remove** (if the pattern proves invalid)

### How It Works

1. **CIO identifies a pattern** through session logs, omnibus synthesis, or direct observation.
2. **CIO drafts the pattern document** using pattern-000-template.md format.
3. **CIO assigns the next available pattern number** and commits to the catalog with status: **Emerging**.
4. **CIO notifies PM** that a new Emerging pattern has been added (via session log or memo — no approval gate required).
5. **PM reviews at their discretion** and may upgrade to Proven, request changes, or note for future discussion.

### What "Emerging" Means

An Emerging pattern is:
- **In the catalog and findable** by agents reading the pattern library
- **Referenced in briefings and session logs** as applicable
- **Not yet validated** through sufficient real-world application (typically 3-5 instances)
- **Subject to revision** based on further evidence

An Emerging pattern is NOT:
- A speculative idea (those stay in session logs or CIO memos until drafted)
- An approved architectural decision (that's an ADR)
- A product requirement (that's a PDR)

### Why This Fixes the Pipeline

Pattern-062 (Assembly Assumption) was identified Feb 18, named Feb 20, drafted Mar 1, and remains uncommitted as of Mar 16 — 26 days. Under this policy, it would have been in the catalog as Emerging on Mar 1 (11 days after identification). The PM review step would happen asynchronously without blocking catalog entry.

### Immediate Application

Pattern-062 (Assembly Assumption) should be committed to the catalog as Emerging. PM has reviewed the draft (Mar 1) and expressed no objections. CIO to commit.

AX Testing is a candidate for the next Emerging pattern (Pattern-063) once the questionnaire template is codified and at least one more application validates the framework.

---

## Updates Required

| Document | Change | Owner |
|----------|--------|-------|
| staggered-audit-calendar-2026.md | Update Methodology Audit row to trigger-based + 8-week max | Chief of Staff |
| BRIEFING-ESSENTIAL-CIO.md | Note self-approval authority for Emerging patterns | CIO or Docs |
| pattern-000-template.md | Ensure "Emerging" is listed as a valid status option | Docs |
| CLAUDE.md or methodology-core | Reference trigger-based audit cadence | Docs |

---

*Policy changes effective March 16, 2026*  
*Next methodology audit trigger: M1 sprint gate closure + 2 weeks*

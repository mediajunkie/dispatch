# Infrastructure Registry

*Where every agent lives, at every layer. The slot machine view.*

Last updated: 2026-03-31

---

## Accounts

| Account | Tier | Cost/mo | Status | Scope |
|---------|------|---------|--------|-------|
| xian@designinproduct.com | 20x Max | ~$100 | **PRIMARY** | All personal/creative/entrepreneurial |
| ccrumlish@kindsys.us | Pro (downgraded Mar 29) | ~$20 | Active (VA only) — PM roles must migrate by Apr 3 | VA Decision Reviews |
| xian@mediajunkie.com | Pro (downgraded Mar 29) | ~$20 | **DEPRECATED** — active roles must migrate by Apr 15 | — |
| crispybacon@atswimtwobirds.com | Pro (canceled) | $0 | Burn credits through June 2026 | — |

---

## Devices

| Name | Hardware | Owner | Claude Code Auth | Notes |
|------|----------|-------|-----------------|-------|
| kindbook | MacBook Pro M4 (CDV72NJ24V) | Kind Systems | designinproduct.com | Re-authed Mar 27 (needs verification) |
| faoilean | MacBook (personal) | xian | designinproduct.com | Re-authed Mar 27 |

---

## Piper Morgan

**GitHub:** mediajunkie/piper-morgan-product
**Local:** ~/Development/piper-morgan (kindbook), ~/cool/piper-morgan (Cowork mount)
**Account:** designinproduct.com
**API key:** dinp key in .env (repointed Mar 26)

| Role | Slug | Environment | Interface | Device | Account | Chat Project | Status |
|------|------|-------------|-----------|--------|---------|-------------|--------|
| Lead Developer | lead | Code (local) | Claude Code | kindbook | dinp | PM (dinp) | **DONE** — transitioned Mar 30 |
| Chief Architect | arch | Code (local) | Claude Code | kindbook | dinp | PM (dinp) | **DONE** — transitioned Mar 30 |
| Chief of Staff | exec | Chat Project | claude.ai | browser | dinp | PM (dinp) | **DONE** — transitioned Mar 30 |
| CXO | cxo | Code (local) | Claude Code | kindbook | dinp | PM (dinp) | **DONE** — transitioned Mar 30 |
| PPM | ppm | Code (local) | Claude Code | kindbook | dinp | PM (dinp) | **DONE** — transitioned Mar 30 |
| CIO | cio | Chat Project | claude.ai | browser | dinp | PM (dinp) | **DONE** — transitioned Mar 30 |
| Comms | comms | Code (local) | Claude Code | kindbook | dinp | PM (dinp) | **DONE** — transitioned Mar 30 |
| Docs | docs | Code (local) | Claude Code | faoilean | dinp | PM (dinp) | **DONE** — transitioned Mar 30 |
| HOST | hosr | Code (local) | Claude Code | kindbook | dinp | PM (dinp) | **DONE** — transitioned Mar 30 |
| ETA | eta | Code (local) | Claude Code | kindbook | dinp | PM (dinp) | Archived — backed up, no session planned |
| Mobile Consultant | — | — | — | — | dinp | PM (dinp) | Archived — backed up with handoff prompt, no session planned |
| Piper Alpha (PA) | pa | Code (local) | Claude Code | faoilean | dinp | PM (dinp) | **DONE** — launched Mar 30 |
| Special Assignments | spec | Code (local) | Claude Code | — | dinp | PM (dinp) | Inactive |
| Programmer | prog | Code (local) | Claude Code | — | dinp | PM (dinp) | Inactive |
| Vibe Coder | vibe | Code (local) | Claude Code | — | dinp | PM (dinp) | Inactive |
| Exec Coach | coach | Chat Project | claude.ai | browser | dinp | PM (dinp) | Inactive |
| SecOps | secops | Code (local) | Claude Code | — | dinp | PM (dinp) | Inactive |
| Researcher | research | Code (local) | Claude Code | — | dinp | PM (dinp) | Inactive |
| Unicorn Web Designer | web | Code (local) | Claude Code | — | dinp | PM (dinp) | Inactive — upcoming work expected |

**Migration notes:**
- Chat Project: Created on dinp Mar 29. Knowledge uploaded (465 files). Memory seeded. Agent onboarding in progress (one at a time with handoff memos).
- CIO: transitioning from kindsys Chat → dinp Chat Project (in progress Mar 30).
- Cowork: **Created Mar 29** on kindbook (dinp account). Imported from PM Chat Project. Connected to local repo ~/Development/piper-morgan. PA and Docs running on faoilean have access to Cowork project files locally.
- Code: API key repointed to dinp (Mar 26). Active Code agents transitioning to new sessions with dinp Chat Project access.
- **Agent migration scorecard (Mar 30, 6:32 PM):**
  - **All active roles migrated.** Lead Dev, Architect, CXO, PPM, CIO, Comms, Docs, HOST, Chief of Staff, Piper Alpha (10 active).
  - ETA, Mobile Consultant: archived (backed up, no sessions planned). Migrated to the extent possible.
  - Cowork custodian: not yet set up (later pass, after existing migrations complete).
  - **Apr 3 kindsys deadline: clear.** No PM roles remain on kindsys.

---

## Klatch

**GitHub:** Design-in-Product/klatch
**Local:** ~/Development/klatch (kindbook), ~/cool/klatch (Cowork mount)
**Account:** designinproduct.com
**API key:** dinp key in .env (repointed Mar 26)

| Role | Slug | Environment | Interface | Device | Account | Chat Project | Status |
|------|------|-------------|-----------|--------|---------|-------------|--------|
| Daedalus | daedalus | Code (local) | Claude Code | faoilean | dinp | Klatch (dinp) | **DONE** — migrated Apr 1 |
| Argus | argus | Code (local) | Claude Code | faoilean | dinp | Klatch (dinp) | **DONE** — migrated Apr 1 (local w/ remote control, replacing CCR) |
| Calliope | calliope | Code (local) | Claude Code | faoilean | dinp | Klatch (dinp) | **DONE** — migrated Apr 1 |
| Theseus Prime | theseus | Code (local) | Claude Code | faoilean | dinp | Klatch (dinp) | TODO — tomorrow (MAXT of file features) |
| Mnemosyne | mnemosyne | Chat Project | claude.ai | browser | dinp | Klatch (dinp) | Active — already on dinp |
| Metis | metis | Cowork | Claude Cowork | faoilean | dinp | Klatch (dinp) | Active — barely started |
| Ariadne | ariadne | Klatch (in-app) | Klatch UI | — | — | — | Test agent |
| Hermes | hermes | Klatch (in-app) | Klatch UI | — | — | — | Test agent |

**Migration notes:**
- Chat Project: Created on dinp Mar 28. Knowledge uploaded (60+ docs, 9 convos).
- Cowork: **Created Mar 29** on kindbook (dinp account). Imported from Chat Project. Connected to local repo ~/Development/klatch. Description, instructions, and memory seeded.
- Code: All Code agents already repointed to dinp API key.
- Agent migration: Calliope, Daedalus, Argus migrated to faoilean Apr 1 (local with remote control). Theseus tomorrow. Argus moved from CCR cloud to local+remote control.
- Metis: new Cowork agent, barely started.

---

## Design in Product (Janus)

**GitHub:** mediajunkie/designinproduct
**Local:** ~/Development/designinproduct (kindbook)
**Account:** designinproduct.com

| Role | Slug | Environment | Interface | Device | Account | Chat Project | Status |
|------|------|-------------|-----------|--------|---------|-------------|--------|
| Janus | janus | Code (local) | Claude Code | faoilean | dinp | DinP (dinp) | **DONE** — migrated to dinp account Mar 31 |

**Migration notes:**
- Chat Project: Migrated to dinp Mar 28.
- Cowork: **Created Mar 29** on kindbook (dinp account). Imported from Chat Project. Connected to local repo ~/Development/designinproduct. No specialized instructions yet — role TBD (possible Janus extension or separate agent).
- CCR: Intelligence Sweep trigger runs daily (7 AM PDT), pushes to main.

---

## VA Decision Reviews

**GitHub:** (private/work)
**Local:** ~/cool/VA/
**Account:** kindsys.us (Pro) — **intentionally separate from dinp**

| Role | Slug | Environment | Interface | Device | Account | Chat Project | Status |
|------|------|-------------|-----------|--------|---------|-------------|--------|
| Archie | archie | Cowork | Claude Cowork | kindbook | kindsys | VA (kindsys) | **Recreated Mar 30** |
| VA Code agent | — | Code (local) | Claude Code | kindbook | kindsys | VA (kindsys) | Active |
| DRAGONS Chat | — | Chat Project | claude.ai | browser | kindsys | VA (kindsys) | Active |

**Notes:**
- Archie Cowork space: **Recreated Mar 30** on kindbook, kindsys account (correctly aligned). Previous dinp space was lost during migration. Connected to ~/cool/VA/.
- VA stays on kindsys per data boundary policy (contract work).
- API key: dedicated kindsys key in ~/cool/VA/.env
- Signaling channel intact at ~/cool/VA/dispatch/ (briefings, memos, knowledge package all preserved)

---

## Dispatch

**GitHub:** mediajunkie/dispatch (private)
**Local:** ~/cool/dispatch/
**Account:** designinproduct.com

| Role | Slug | Environment | Interface | Device | Account | Status |
|------|------|-------------|-----------|--------|---------|--------|
| Dispatch-DinP | dispatch-dinp | Cowork | Claude Cowork | kindbook | dinp | — | **Active** — revived Mar 31. RFC-001 issued, coordinating layer mappings. |
| Dispatch-Kind | dispatch-kind | Cowork | Claude Cowork | kindbook | kindsys | — | **Not started** — needs Cowork space created on kindsys |
| Janus (acting) | janus | Code (local) | Claude Code | faoilean | dinp | Active — cross-project coordination shared with Dispatch-DinP |

**Notes:**
- Dispatch-DinP: **Active since Mar 31.** Bug fixed, revived. Issued RFC-001 (Five-Layer Context Model). Coordinating layer mapping assessments from PM and Klatch. Flagged stale weekly xpoll digest to Janus.
- Dispatch-Kind: **Not started.** Cowork space not yet created on kindsys. Revival prompt at `~/cool/dispatch/HANDOFF-PROMPT-DISPATCH-KIND.md`. Part of VA/kindsys stack completion.
- Janus sharing cross-project coordination with Dispatch-DinP (no longer sole cover).

---

## Wedgestock / Cuneo (Cuneiform Learning)

**GitHub:** Design-in-Product/cuneo
**Local:** ~/Development/cuneo (kindbook), ~/Development/cuneo (faoilean — verify clone exists)
**Account:** designinproduct.com

| Role | Environment | Interface | Device | Account | Status |
|------|-------------|-----------|--------|---------|--------|
| Opus tutor | Chat Project | claude.ai | browser | dinp | Active (Wedgestock project, 58-msg conversation) |
| Cowork agent | Cowork | Claude Desktop | faoilean | dinp | **NEW** — created Mar 29, imported from Chat, connected to local cuneo repo |
| Code auditor | Code | Claude Code | (either) | dinp | Ad hoc — no dedicated session, used via other projects |

**Cowork space setup (Mar 29):**
- Created on faoilean, designinproduct.com account
- Imported from Wedgestock Chat Project
- Connected to local folder: ~/Development/cuneo
- Instructions/description: not yet copied from Chat Project (manual step pending)

**Consolidated artifacts in repo:**
- `index.html` — published primer (cuneo.dinp.xyz)
- `data/cuneiform-signs.json` — canonical 51-sign database (Unicode 16.0 verified)
- `tools/` — flashcard quiz (JSX), evolution visualizer (HTML)
- `reference/` — earlier HTML reference docs from Chat
- `transcripts/` — Opus tutoring session + Cowork session transcript

**No standalone Claude Code sessions exist for this project on either machine.**

---

## Other Projects (Lower Priority)

| Project | Account | Chat Project | Cowork | Code | Status |
|---------|---------|-------------|--------|------|--------|
| Epistrophikon | dinp | Migrated Mar 28 | — | — | Active (writing project) |
| Rebel Alliance | dinp | Migrated Mar 27 | **Created Mar 29** (kindbook) | — | Active |
| Voice & Tone | dinp | Migrated Mar 27 | — | — | Active |
| Wedgestock/Cuneo | dinp | Migrated Mar 27 | **Created Mar 29** (faoilean) | Ad hoc | Active |
| Radio Free Airlift | dinp | In progress | Set up Mar 27 | — | Active |
| Layers of Meta | dinp | Created | Set up Mar 27 | — | Active |
| One Job | dinp | Migrated Mar 26 | — | — | Active |

---

## Cowork Persistence Model (observed)

- Cowork sessions are **isolated sandboxes** — no cross-session state, no project association (for pre-project sessions)
- Files created in Cowork `outputs/` may exist **cloud-side only** — not guaranteed to sync to local `local-agent-mode-sessions/` tree
- Local Cowork storage contains mostly agent infrastructure (audit logs, configs), not user artifacts
- **Implication:** any Cowork session producing valuable artifacts needs explicit extraction (paste inline, copy to mounted volume, or download) before the session is closed
- Audit of faoilean local storage: in progress (Code agent mapping the tree)

---

## Known Issues / Open Questions

1. **kindbook auth**: Verified as dinp on Mar 27 — but has it persisted? Needs spot-check.
2. ~~**CIO (Piper)**: Last ran in kindsys Chat Project. Needs transition to dinp PM Chat Project.~~ **DONE** Mar 30.
3. **Mnemosyne (Klatch)**: Runs in Chat — which account? Needs verification.
4. ~~**Archie account confusion**: Runs on dinp Cowork but accesses kindsys Chat Project. Is this stable?~~ **Resolved** — Archie recreated Mar 30 on kindsys Cowork (correctly aligned).
5. **Code session continuity**: Some long-running Code chats may need fresh sessions after API key changes. Track as agents are onboarded.
6. **Dispatch cloud bug**: SendUserMessage not provisioned. Server-side fix needed from Anthropic.

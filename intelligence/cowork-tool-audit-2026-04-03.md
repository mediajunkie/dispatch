# Cowork Tool Audit — 2026-04-03

**Auditor:** Dispatch (Claude Code, Sonnet 4.6)
**Audit date:** 2026-04-03
**Sources:** infrastructure-registry.md, cowork-local-audit-faoilean.md, cowork-local-audit-kindbook.md, dispatch-activity-log.md, intelligence/daily-brief-2026-04-02.md

---

## 1. Cowork Spaces — Connected

| Project | Agent | Account | Device | Repo/Folder Mount | Created | Status |
|---------|-------|---------|--------|-------------------|---------|--------|
| Piper Morgan | (custodian TBD) | dinp | kindbook | ~/Development/piper-morgan | Mar 29 | Created; no dedicated agent running it |
| Klatch | Metis | dinp | kindbook | ~/Development/klatch | Mar 29 | Barely started |
| Design in Product | (unassigned) | dinp | kindbook | ~/Development/designinproduct | Mar 29 | Created; no instructions or role set |
| VA Decision Reviews | Archie | kindsys | kindbook | ~/cool/VA/ | Mar 30 (recreated) | Space exists; signals directory missing |
| Dispatch-DinP | Dispatch | dinp | kindbook | ~/cool/dispatch/ | Mar 31 (revived) | Active |
| Cuneiform / Wedgestock | (unnamed) | dinp | faoilean | ~/Development/cuneo | Mar 29 | Created; instructions not yet copied from Chat |
| Radio Free Airlift | — | dinp | kindbook | (unknown) | Mar 27 | Created; minimal usage |
| Layers of Meta | — | dinp | kindbook | (unknown) | Mar 27 | Created; minimal usage |
| Rebel Alliance | — | dinp | kindbook | (unknown) | Mar 29 | Created; minimal usage |

---

## 2. Cowork Spaces — Missing

| Project | Account | Notes |
|---------|---------|-------|
| **Dispatch-Kind** | kindsys | Not started. Revival prompt exists at `~/cool/dispatch/HANDOFF-PROMPT-DISPATCH-KIND.md`. Needed for VA/kindsys stack coordination. |
| **One Job** | dinp | Chat Project migrated Mar 26. No Cowork space created. No identified need yet. |
| **Epistrophikon** | dinp | Chat Project migrated Mar 28. No Cowork space created. Writing project — unclear if local file access adds value. |
| **Voice & Tone** | dinp | Chat Project migrated Mar 27. No Cowork space created. |

---

## 3. Tool Inventory — Per Space

### Tools Confirmed Available (all spaces)

| Tool | Source | Notes |
|------|--------|-------|
| **Filesystem read/write** | Folder mount | Core capability. Works reliably. All active spaces have at least one folder mounted. |
| **Office skills** (PDF, DOCX, PPTX, XLSX) | `skills-plugin/` cache | Anthropic-authored plugins. Confirmed present on both faoilean and kindbook. Versioned (0.2.2). |
| **Schedule skill** | `skills-plugin/` cache | Available. Archie used it to set up a daily morning briefing task (confirmed live Mar 25). |
| **Skill-creator** | `skills-plugin/` cache | Available. Anthropic-authored. |

### Tools Observed in Practice

| Tool | Where used | Outcome |
|------|-----------|---------|
| Filesystem read | Archie (VA) | Confirmed — copied all 28 imported project docs to shared filesystem |
| Filesystem write | Archie (VA), Dispatch-DinP | Confirmed — signals, memos, briefings all written to mounted folders |
| Schedule task | Archie (VA) | Confirmed live — daily briefing runs at 8:30 AM |
| Chat Project import | All major spaces | Imports knowledge documents (Layers 1–3) with high fidelity; loses conversation history and behavioral calibration (Layer 5) |

### Tools Absent / Not Available in Cowork

| Tool | Status | Notes |
|------|--------|-------|
| **SendUserMessage** | **BROKEN** (see §4) | Not provisioned in Dispatch-DinP. Server-side bug. Messages invisible in UI. |
| **Browser / web access** | Not confirmed | No evidence of browser tool being available in any Cowork session. |
| **Git operations** | Not native | Cowork agents can write to mounted repo folders but cannot run git commands directly. Git work requires separate Code sessions. |
| **MCP connectors** | Not confirmed | No evidence of MCP tools being available within Cowork sessions. |
| **Claude Code subagents** | Not confirmed | No evidence of Cowork sessions launching Code subagents. |

---

## 4. Known Bugs

### Bug 1: SendUserMessage Not Provisioned (CRITICAL)

**Affected:** Dispatch-DinP (confirmed). Likely affects other Cowork spaces too — untested.

**Symptom:** Messages sent from a Claude Code agent to the Cowork UI session are invisible to the user in the Cowork interface. The tool call completes without error from the agent's perspective, but the message never appears in the UI.

**History:**
- First observed Mar 28 during Dispatch-DinP revival on dinp account
- Xian attempted local fix: cleared `local-agent-mode-sessions/` JSON files — no effect
- Second attempt: deleted `vm_bundles/claude-code-vm/` and relaunched Claude Desktop — workspace re-downloaded but bug persisted
- Conclusion: server-side provisioning issue. Not fixable locally.
- Session lost as a side-effect of these attempts; context recovered from filesystem backup

**Impact:** Prevents Dispatch (and any agent using this tool) from pushing signals to Cowork sessions. Breaks the intended Code ↔ Cowork coordination channel. The signals workaround (writing to shared filesystem, having agent read on next session start) is the current substitute.

**Status:** Open. Awaiting Anthropic fix. No ETA.

---

### Bug 2: Imported .projects/ Contents Disappear

**Affected:** Archie (VA Cowork, dinp account — pre-Mar-30 space).

**Symptom:** Archie's imported project knowledge docs (28 files, confirmed present and fully readable Mar 23) were completely absent from `.projects/` by Mar 25. The folder was empty. No explanation from Anthropic.

**History:**
- Mar 23: Archie confirmed all 28 docs accessible; copied them to shared filesystem (`VA/dispatch/va-project-knowledge/`)
- Mar 25 (evening sweep): `.projects/` now empty
- Hypothesis: destructive re-sync from Chat Project (the `synced_at` timestamp had updated) may have replaced rather than merged
- Archie space later recreated on kindsys account (Mar 30), partly to resolve account confusion, possibly also resetting this state

**Impact:** Any agent relying on imported knowledge docs being persistently available in `.projects/` cannot trust that they will remain. Docs must be extracted and written to the mounted filesystem on first access.

**Status:** Not resolved; possibly mitigated by recreation on correct account. Needs re-verification after Archie's kindsys reboot.

---

### Bug 3: Multiple Org/User UUID Provisioning (kindbook)

**Affected:** kindbook — observed during Mar 28 debugging sessions.

**Symptom:** 4 Cowork sessions on kindbook produced 3 different org UUIDs and 3 different user UUIDs, even within sessions using the same account (dinp). This caused confusion about which space was "primary" and which was an empty test provisioning.

**History:**
- Documented in `cowork-local-audit-kindbook.md`
- Sessions vibrant-eager-knuth, nice-inspiring-goodall, sweet-blissful-turing each show a distinct org UUID
- sweet-blissful-turing and sweet-nice-pasteur share an org+user pair (same account, second session spawned inside the first)
- Initial message in nice-inspiring-goodall: "nope... interesting that continuity persists between sessions, along with the provisioning bug"

**Impact:** Difficult to identify canonical session. Plugin cache triplicated (12MB × 3). Session continuity unreliable — xian found that some chats were "anchored locally" and some "in the cloud," with no obvious distinction in the UI.

**Status:** No resolution. Workaround: treat the session with actual user content (identified by populated `outputs/` and `uploads/`) as canonical.

---

### Bug 4: Archie Signals Directory Missing After Reboot

**Affected:** Archie (VA, kindsys), post-Mar-30 recreation.

**Symptom:** `~/cool/VA/dispatch/` — the directory Archie writes signals to for Dispatch — was not found in the Apr 2 daily brief check. Archie has not had a session since the space was recreated.

**History:**
- Archie original space: created Mar 23 on dinp (wrong account)
- Archie space recreated Mar 30 on kindsys (correct account, aligned with VA data boundary)
- No Archie session run since recreation
- Apr 2 brief: "No signals directory at ~/cool/VA/dispatch/. Reboot in kindsys still pending."

**Impact:** VA/Dispatch coordination channel is dark. Archie morning briefings stopped. No signals flowing.

**Status:** Pending. Needs one Archie session on kindsys to re-establish the signals directory and verify the setup.

---

## 5. Recommendations

### Immediate (this week)

1. **Reboot Archie on kindsys.** The VA coordination channel has been dark since Mar 30. One session to: re-establish `~/cool/VA/dispatch/`, verify signals directory, confirm morning briefing task is still live, test a round-trip signal with Dispatch. Also verify `.projects/` contents after the account migration.

2. **Create Dispatch-Kind Cowork space on kindsys.** The handoff prompt is ready at `~/cool/dispatch/HANDOFF-PROMPT-DISPATCH-KIND.md`. Needed to extend Dispatch coordination coverage to the kindsys stack (Archie, VA Code agent, DRAGONS Chat). Currently a gap.

3. **Establish a PM Cowork custodian.** The Piper Morgan Cowork space was created Mar 29 and has the local repo mounted, but no agent has been assigned to it. The 465-file knowledge base is now in the Chat Project. Decide: assign an existing PM agent (Piper Alpha is a natural fit) or leave it as a passive workspace.

### Near-term (this sprint)

4. **Verify Klatch Cowork (Metis) is actually running.** Registry says "barely started." Unclear if Metis has a functioning session, mounted folder access, and working instructions. Worth a check-in.

5. **Set instructions on Design in Product Cowork space.** Created Mar 29 with no role or instructions. Either assign it to Janus as an extension of the Code session or define a distinct role. A space with no instructions is just noise.

6. **Extract artifacts from Cowork sessions before closing.** The persistence model is unreliable: `outputs/` may not sync locally, and `.projects/` contents can disappear. For any session producing valuable work, explicitly copy artifacts to the mounted filesystem folder before closing. This is the only guaranteed persistence path.

7. **Track the Chat↔Cowork sync behavior.** The `synced_at` timestamp on imported knowledge docs suggests the import is periodically refreshed from the Chat Project. Whether this is additive or destructive is unknown. Until this is understood, treat imported docs as ephemeral and always copy to filesystem on first access.

### Longer-term

8. **File SendUserMessage bug with Anthropic.** The provisioning failure breaks the Code↔Cowork signaling design. Until it's fixed, Code agents must write files to shared filesystem and rely on Cowork agents reading them on session start — an asynchronous workaround, not a real replacement. Worth tracking as an open support issue.

9. **Audit RFA, Layers of Meta, and Rebel Alliance Cowork spaces.** These were set up in late March but have minimal documented usage. Confirm they have correct folder mounts, instructions, and at least one test session. If not needed, consider archiving to reduce maintenance surface.

10. **Document Cowork tool availability per space.** This audit surfaced gaps in what tools are actually provisioned vs assumed. Skills, browser access, and MCP availability are not uniformly documented. A short test session per space to confirm available tools would reduce uncertainty.

---

## 6. Summary

| Dimension | Status |
|-----------|--------|
| Spaces created | 9 (dinp: 8, kindsys: 1) |
| Spaces missing | 4 (Dispatch-Kind critical; others lower priority) |
| Spaces with active agents | 3 (Dispatch-DinP, Archie, Metis) |
| Known bugs | 4 (1 critical, 3 moderate) |
| Critical gap | SendUserMessage not provisioned (server-side) |
| Coordination gap | Archie dark since Mar 30, Dispatch-Kind not created |
| Core tool | Filesystem read/write — confirmed working across all active spaces |
| Unreliable | Imported .projects/ contents, Chat↔Cowork sync |

The Cowork infrastructure is functional at the filesystem layer but fragile at the coordination layer. The SendUserMessage bug is the highest-priority open issue. Archie's reboot and Dispatch-Kind creation are the two most impactful things that can be done locally this week.

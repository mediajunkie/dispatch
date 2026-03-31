# Test Protocol: Chat Project ↔ Cowork Sync Behavior

**Author:** Janus, 2026-03-30
**Test environment:** Wedgestock (low stakes)
**Purpose:** Determine whether Chat Project knowledge syncs to/from Cowork, and if so, in which direction(s)

---

## Background

When creating a Cowork space, you can "import" a Claude Chat Project. It's unclear whether this is:
- (A) **One-time import** — instructions/description copied at creation, no ongoing link
- (B) **One-way sync** — Chat Project knowledge flows to Cowork (but not back)
- (C) **Two-way sync** — changes in either surface appear in the other
- (D) **Shared reference** — both point to the same underlying knowledge store

The answer affects how we manage knowledge freshness across all 6 Cowork spaces.

---

## Test 1: Chat → Cowork (does new Chat knowledge appear in Cowork?)

**Setup:**
1. Note what knowledge files currently exist in the Wedgestock Chat Project
2. In the Wedgestock Cowork space, ask: "List all knowledge files you can see from the Chat Project. Can you see [name a specific existing file]?"
3. Record what it reports

**Action:**
4. Add a new, distinctively named knowledge file to the Wedgestock Chat Project (e.g., `sync-test-canary-2026-03-30.md` containing "This is a sync test canary. If you can see this, Chat → Cowork sync is working.")
5. Do NOT restart the Cowork conversation

**Verify:**
6. In the same Cowork conversation, ask: "Can you see a file called sync-test-canary-2026-03-30.md?"
7. If no: start a NEW Cowork conversation and ask again (tests whether sync happens per-conversation, not live)
8. Record results

**Expected outcomes:**
- Sees it immediately → live sync (B or C or D)
- Sees it in new conversation only → per-session refresh (B, delayed)
- Never sees it → one-time import (A)

---

## Test 2: Cowork → Chat (does Cowork-created content appear in Chat?)

**Setup:**
1. In the Cowork space, create a file in the outputs folder (e.g., ask it to "write a file called cowork-canary.md with the text 'Created by Cowork agent'")

**Verify:**
2. In a Chat Project conversation, ask: "Can you see a file called cowork-canary.md?"
3. Record results

**Expected outcomes:**
- Chat sees it → two-way sync (C or D)
- Chat doesn't see it → one-way or no sync (A or B)

---

## Test 3: Instruction/description sync

**Setup:**
1. Note the current project instructions in both Chat and Cowork

**Action:**
2. Change one line in the Chat Project instructions (e.g., add "SYNC TEST MARKER" at the end)
3. Start a new Cowork conversation

**Verify:**
4. Ask the Cowork agent: "Do your project instructions contain the phrase 'SYNC TEST MARKER'?"
5. Record results

**Then reverse:**
6. Change the Cowork project instructions (add "REVERSE SYNC TEST")
7. Start a new Chat conversation
8. Ask: "Do your project instructions contain 'REVERSE SYNC TEST'?"

---

## Test 4: Memory sync

**Setup:**
1. In Chat, check current project memory
2. In Cowork, check current project memory

**Action:**
3. Add a memory item in Chat (e.g., "Sync test: added via Chat on 2026-03-30")
4. Check if Cowork sees it (new conversation)

**Then reverse:**
5. Add a memory item in Cowork
6. Check if Chat sees it (new conversation)

---

## Results Template

| Test | Direction | Result | Sync Type |
|------|-----------|--------|-----------|
| 1 | Chat → Cowork (knowledge) | | |
| 2 | Cowork → Chat (outputs) | | |
| 3a | Chat → Cowork (instructions) | | |
| 3b | Cowork → Chat (instructions) | | |
| 4a | Chat → Cowork (memory) | | |
| 4b | Cowork → Chat (memory) | | |

**Overall classification:** A / B / C / D (see Background)

---

## Implications by outcome

**If A (one-time import):** Knowledge must be managed independently in each surface. Updates to Chat Project knowledge require manual re-sync to Cowork. Local folder mount is the reliable shared channel.

**If B (one-way Chat → Cowork):** Chat Project is the authoritative knowledge source. Add knowledge there; Cowork inherits it. Agent-created artifacts in Cowork need manual extraction.

**If C (two-way sync):** Either surface can be the source of truth. Need to watch for conflicts. Most convenient but most complex.

**If D (shared reference):** Effectively one system with two interfaces. Simplest to manage but need to verify edge cases (what happens when both are open?).

---

## Cleanup

After testing, remove:
- `sync-test-canary-2026-03-30.md` from Chat Project knowledge
- "SYNC TEST MARKER" from instructions
- "REVERSE SYNC TEST" from instructions
- Test memory items
- `cowork-canary.md` from outputs

Keep this protocol for re-running after major Cowork updates.

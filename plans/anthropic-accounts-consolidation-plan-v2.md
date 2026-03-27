# Anthropic Accounts Consolidation Plan v2

**Created**: March 25, 2026
**Revised**: March 26, 2026 (email changes not supported — full migration required)
**Target account**: xian@designinproduct.com (upgraded to Max on March 26)
**Goal**: Consolidate to 1-2 accounts, saving ~$60-80/month

---

## Key Discovery: Email Changes Not Supported

Anthropic does not allow changing the email address on an account. This means we must **migrate projects** from source accounts to the target account, not just switch emails. The strategy shifts from "relabel accounts" to "recreate and transfer."

---

## Account Inventory (verified from exports)

| # | Email | Tier | Projects | Convos | Monthly Cost |
|---|-------|------|----------|--------|-------------|
| 1 | ccrumlish@kindsys.us | Max | 5 (Piper Morgan, VA, One Job, Play Acting PM, How to Use Claude) | 343 | ~$60 |
| 2 | xian@mediajunkie.com | Max | 8 (Klatch, Epistrophikon, Rebel Alliance, Wedgestock, Voice&Tone, Images, PM backup, HTUC) | 43 | ~$60 |
| 3 | crispybacon@atswimtwobirds.com | Pro | 5 (Wooshville, RFA, Layers of Meta, St. Lucifer, HTUC) | 37 | ~$20 |
| 4 | xian@designinproduct.com | **Max** (just upgraded) | 0 | 6 | ~$60 |

**Current total**: ~$200/month (after upgrade)

---

## Target State

| Account | Tier | Purpose | Projects |
|---------|------|---------|----------|
| xian@designinproduct.com | **Max** | Primary — all personal/creative/entrepreneurial | Piper Morgan, Klatch, Epistrophikon, Rebel Alliance, Wedgestock, Voice&Tone, Wooshville, RFA, Layers of Meta, One Job, + new projects |
| ccrumlish@kindsys.us | **Free** or **Pro** | VA work-for-hire only | VA Decision Reviews |
| xian@mediajunkie.com | **Cancelled** | — | — |
| crispybacon@atswimtwobirds.com | **Cancelled** | — | — |

**Target cost**: ~$60 (one Max) + $0-20 (VA Free or Pro) = **$60-80/month**
**Savings**: ~$120-140/month ($1,440-1,680/year)

---

## Export Structure (verified)

Each export ZIP contains:
- `projects.json` — project definitions with `prompt_template` (instructions) and `docs` array (knowledge base files with content inline, original filenames preserved)
- `memories.json` — account-level memories + project-specific memories (keyed by project UUID)
- `conversations.json` — full chat history with messages (NOTE: conversations do NOT reference their parent project by UUID)
- `users.json` — account metadata

**This means**: we can fully reconstruct any project's Layer 2 (instructions), Layer 3 (knowledge docs + memories), and conversation history from the exports.

---

## Migration Method Per Project

### Method A: Simple Recreation (for dormant/light projects)
1. Create new project on target account (claude.ai → Projects → New)
2. Set project name and description
3. Paste `prompt_template` into project instructions
4. Upload knowledge docs (extract from export's `docs` array)
5. Set project memory (from `memories.json` project_memories)
6. Done — no chat history needed

**Best for**: How to Use Claude (×3), Play Acting PM, PM backup, Images, St. Lucifer

### Method B: Recreation + Conversation Import via Cowork (for projects with valuable history)
1. Do Method A (recreate project structure)
2. Extract relevant conversations from `conversations.json` (by name/date matching)
3. Import into Cowork session attached to the new project
4. Behavioral calibration rebuilds through continued use

**Best for**: Epistrophikon, Rebel Alliance, Wedgestock, Voice&Tone, Wooshville, RFA, Layers of Meta, One Job

### Method C: Full Five-Layer Migration (for critical active projects)
1. Do Method A (recreate project structure)
2. Do Method B (import conversations)
3. Run five-layer fidelity test:
   - Layer 1: Kit briefing (auto) ✓
   - Layer 2: Verify prompt_template matches ✓
   - Layer 3: Verify knowledge docs + memories complete ✓
   - Layer 4: Channel addendum (if applicable)
   - Layer 5: Test behavioral calibration with standard prompts
4. Run test session — verify agent "feels right"
5. Only deprecate source account project after confirming full functionality

**Best for**: Klatch, Piper Morgan

### VA Decision Reviews: No Migration
Stays on ccrumlish@kindsys.us. Downgrade to Free or Pro after other migrations complete.

---

## Migration Phases

### Phase 1: Migrate Dormant Projects (Low Risk)
**Effort**: 1-2 hours | **Accounts affected**: All three source accounts

Migrate all dormant projects using Method A. These have no active chats to worry about.

**Projects to migrate:**
- How to Use Claude (×3 — just recreate once on target)
- Play Acting Piper Morgan (kindsys) — mine for Piper Alpha context first
- Piper Morgan backup shell (mediajunkie) — archive only, don't recreate
- Images for music videos (mediajunkie) — archive
- Saint Lucifer Video (crispybacon) — archive

**Steps:**
1. Create "How to Use Claude" on target account with merged best content from all three
2. Mine "Play Acting PM" for Piper Alpha-relevant content → save to dispatch/archives/
3. Archive the rest (exports already saved)
4. Document what was migrated and what was archived

### Phase 2: Migrate Active Creative Projects (Medium Risk)
**Effort**: 3-4 hours | **Accounts affected**: mediajunkie, crispybacon

Migrate active and recently-active projects using Method B.

**Projects to migrate:**
- The Epistrophikon (mediajunkie) — active, novel with accumulated creative context
- Rebel Alliance COO Assistant (mediajunkie) — huge potential, life direction
- Wedgestock (mediajunkie) — recently active, cuneiform learning
- xian's voice and tone (mediajunkie) — maintain, 18 knowledge docs
- Wooshville (crispybacon) — creative community
- Radio Free Airlift (crispybacon) — web presence overhaul
- Layers of Meta (crispybacon) — band project
- One Job (kindsys) — "Tinder for Tasks"

**Steps per project:**
1. Create project on target account
2. Set prompt_template from export
3. Upload knowledge docs (extract content from export, write to files, upload)
4. Set project memory from memories.json
5. Import key conversations if valuable
6. Test with a brief session to verify context

### Phase 3: Migrate Critical Active Projects (High Risk)
**Effort**: 4-6 hours | **Accounts affected**: mediajunkie (Klatch), kindsys (Piper Morgan)

Migrate using Method C with full five-layer verification.

**Klatch** (from mediajunkie):
1. Recreate project with full prompt_template and all knowledge docs
2. Import conversation history (identify Klatch-related convos from export)
3. Run five-layer fidelity test
4. Verify Klatch agents can start sessions normally
5. Test with a Calliope or Theseus session

**Piper Morgan** (from kindsys):
1. Recreate project with full prompt_template and all knowledge docs
2. Import conversation history (343 conversations — need to filter to Piper-related ones)
3. Run five-layer fidelity test with each major role (Architect, CoS, CIO, etc.)
4. Verify all leadership team chats function normally
5. **Critical**: update ANTHROPIC_API_KEY in Piper Morgan `.env` to use designinproduct.com token
6. Test with Lead Developer Code session to verify key still works

### Phase 4: Downgrade and Cancel
**Effort**: 30 min | **After Phases 1-3 verified**

1. Downgrade ccrumlish@kindsys.us to Free (or Pro if needed for VA features)
2. Cancel xian@mediajunkie.com subscription
3. Cancel crispybacon@atswimtwobirds.com subscription
4. Update API tokens in all projects:
   - VA repos (.env): kindsys token
   - Piper Morgan, Klatch, all other repos (.env): designinproduct.com token
5. Update Dispatch memory and protocols with new account structure

### Phase 5: Mine and Archive
**Effort**: 2-3 hours (can be done anytime)

1. Review all exported conversations for insights worth preserving
2. Mine "Play Acting PM" for Piper Alpha relevant context
3. Mine loose chats (Cookie Monster, LLM video pipeline, Opus vs Sonnet) for blog-worthy content
4. Document the "rocket to Mars" antipattern (from LLM video pipeline)
5. Store all archives in dispatch/archives/ organized by source account

---

## API Token Update Plan

| Project/Repo | Current Token Account | Target Token Account |
|-------------|----------------------|---------------------|
| Piper Morgan (.env) | ccrumlish@kindsys.us | xian@designinproduct.com |
| Klatch (.env) | xian@mediajunkie.com (?) | xian@designinproduct.com |
| VA repos (.env) | ccrumlish@kindsys.us | ccrumlish@kindsys.us (stays) |
| Cowork sessions | varies | xian@designinproduct.com |

**Warning**: Changing API tokens mid-sprint could break running services. Do token swaps during a quiet period, test immediately after.

---

## Rollback Plan

If any migration goes wrong:
- Source accounts remain active until Phase 4 (we don't cancel until everything is verified)
- Full data exports saved in ~/cool/dispatch/claude-project-downloads/
- Individual project knowledge can be reconstructed from exports at any time

---

## Timeline

| Phase | When | Effort | Risk | Savings Unlocked |
|-------|------|--------|------|-----------------|
| Phase 1 | Today/tomorrow | 1-2 hrs | Low | $0 (prep) |
| Phase 2 | This week | 3-4 hrs | Medium | $20/month (cancel crispybacon) |
| Phase 3 | Next week | 4-6 hrs | High | $60/month (cancel mediajunkie) |
| Phase 4 | After Phase 3 verified | 30 min | Low | Final state |
| Phase 5 | Whenever | 2-3 hrs | None | Knowledge preserved |

**Total effort**: ~11-16 hours over 1-2 weeks
**Total savings**: $120-140/month ($1,440-1,680/year)

---

## Open Questions

1. **Conversation-project linkage**: Conversations in exports don't reference their parent project. How do we identify which conversations belong to which project? (May need name/date matching or manual identification.)
2. **Cowork import from export**: Can we import conversations from a ZIP export into a Cowork session on a different account? Or only from the account's own data?
3. **Token generation**: Does the target account (designinproduct.com) already have an API key? If not, need to generate one before Phase 3.
4. **VA token decision**: Keep VA on kindsys Pro ($20/month for higher rate limits) or Free?

---

*Plan v2 created by Dispatch, March 26, 2026*
*Review with xian before executing any phase*

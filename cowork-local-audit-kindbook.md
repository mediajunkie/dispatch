# Cowork Local Data Audit: kindbook

**Machine:** kindbook (MacBook Pro M4, Kind Systems laptop)
**Audit date:** 2026-03-28
**Auditor:** Janus (claude-opus-4-6, via designinproduct repo)

---

## Summary

Cowork local storage on kindbook is **minimal and contains no user-created content**. All `outputs/` and `uploads/` directories are empty. The only non-infrastructure files are 4 session config JSONs. The `skills-plugin/` tree (12MB) is entirely plugin cache (Office XML schemas, skill scripts). Claude was installed on this machine on 2026-03-28 and only 4 brief Cowork sessions were run, all on the same day, all testing/debugging.

**User artifacts extracted: 0**
**Archive location:** `~/cool/dispatch/archives/cowork-kindbook/` (empty -- nothing to extract)

---

## Storage Locations Examined

### ~/Library/Application Support/Claude/local-agent-mode-sessions/

Total size: 13MB (12MB is skills-plugin cache)

**Structure:** 4 top-level entries:
- 3 org-UUID directories (session containers)
- 1 `skills-plugin/` directory (plugin cache, not user content)

### ~/Library/Application Support/Claude/claude-code-vm/

Contains: Claude Code VM binary (v2.1.87, 228MB). Infrastructure only.

### ~/Library/Application Support/Claude/claude-code/

Contains: Claude Code app bundle (v2.1.87, 196MB). Infrastructure only.

### Other Claude dirs

Standard Electron app infrastructure: Cache, Code Cache, Cookies, Crashpad, DawnGraphiteCache, DawnWebGPUCache, DIPS, GPUCache, IndexedDB, Local Storage, Session Storage, Shared Dictionary, WebStorage, blob_storage, sentry. No user content.

---

## Session Inventory

### Session 1: vibrant-eager-knuth
- **Org UUID:** `118ed4b2-fd80-4be9-a995-f055901fd4dc`
- **User UUID:** `bc283a77-4dea-478c-b794-f1501b65fb97`
- **Session ID:** `local_ditto_bc283a77-4dea-478c-b794-f1501b65fb97_g1`
- **Process name:** vibrant-eager-knuth
- **Title:** "Test UI with alternate account"
- **Model:** claude-opus-4-6
- **Created:** 2026-03-28T19:33:54 UTC
- **Last activity:** 2026-03-28T19:42:02 UTC (8 min session)
- **Initial message:** "that's like saying you're fully functional without your arms or mouth"
- **Contents:**
  - `.claude.json` (feature flags config)
  - `audit.jsonl` (65KB, 31 lines)
  - `.claude/projects/-sessions-vibrant-eager-knuth/c5124cbf-920c-41bd-a7f2-57c38315e7dc.jsonl` (28KB, 31 lines -- session transcript)
  - `uploads/` -- EMPTY
  - `outputs/` -- EMPTY
  - `memory/` -- EMPTY
  - `rpm/manifest.json`

### Session 2: nice-inspiring-goodall
- **Org UUID:** `6249c671-09fb-472a-b44f-22907514aa71`
- **User UUID:** `886075f9-990e-4e80-97fb-22b940c2d36e`
- **Session ID:** `local_ditto_886075f9-990e-4e80-97fb-22b940c2d36e`
- **Process name:** nice-inspiring-goodall
- **Title:** "Initial greeting and session start"
- **Model:** claude-opus-4-6
- **Created:** 2026-03-28T19:01:57 UTC
- **Last activity:** 2026-03-28T19:31:44 UTC (30 min session)
- **Initial message:** "nope... interesting that continuity persists between sessions, along with the provisioning bug"
- **Contents:**
  - `.claude.json` (feature flags config)
  - `audit.jsonl` (43KB, 32 lines)
  - `.claude/projects/-sessions-nice-inspiring-goodall/989225c5-4355-4f1c-83f6-553c6125f275.jsonl` (16KB, 32 lines -- session transcript)
  - `uploads/` -- EMPTY
  - `outputs/` -- EMPTY
  - `memory/` -- EMPTY
  - `rpm/manifest.json`

### Session 3: sweet-blissful-turing
- **Org UUID:** `afcb7c05-09b7-44b3-94be-dd6f4b040068`
- **User UUID:** `4fa53cbb-9586-41ed-8aea-faa5641e45e0`
- **Session ID:** `local_ditto_4fa53cbb-9586-41ed-8aea-faa5641e45e0`
- **Process name:** sweet-blissful-turing
- **Title:** "Test message dispatch bug across accounts"
- **Model:** claude-opus-4-6
- **Created:** 2026-03-28T19:48:59 UTC
- **Last activity:** 2026-03-29T14:45:09 UTC (longest-lived, spans overnight)
- **Initial message:** "nope, the bug persists"
- **Contents:**
  - `.claude.json` (feature flags config)
  - `audit.jsonl` (29KB, 22 lines)
  - `.claude/projects/-sessions-sweet-blissful-turing/fd8f60b1-aa1c-4148-aafc-e4d49cb79380.jsonl` (11KB, 22 lines -- session transcript)
  - `uploads/` -- EMPTY
  - `outputs/` -- EMPTY
  - `memory/` -- EMPTY
  - `rpm/manifest.json`

### Session 4: sweet-nice-pasteur
- **Org UUID:** `afcb7c05-09b7-44b3-94be-dd6f4b040068` (same org as Session 3)
- **User UUID:** `4fa53cbb-9586-41ed-8aea-faa5641e45e0` (same user as Session 3)
- **Session ID:** `local_28e54858-0717-4a0e-b0ae-eb8ed058a2d5`
- **Process name:** sweet-nice-pasteur
- **Title:** "Reconnect to previous chat branch"
- **Model:** claude-opus-4-6
- **Created:** 2026-03-28T20:43:03 UTC
- **Last activity:** 2026-03-28T20:44:50 UTC (2 min session)
- **Initial message:** "when I try to resume that chat no longer appears visible. It's very confusing in that some chats are anchored locally and some are in the cloud..."
- **Contents:**
  - `.claude.json` (feature flags config)
  - `audit.jsonl` (24KB, 17 lines)
  - `.claude/projects/-sessions-sweet-nice-pasteur/fdb361b5-ddb2-4cba-938a-6c68ce2cc24f.jsonl` (15KB, 17 lines -- session transcript)
  - `uploads/` -- EMPTY
  - `outputs/` -- EMPTY
  - `rpm/manifest.json`

---

## UUID Cross-Reference

| UUID | Role | Appears in sessions |
|------|------|-------------------|
| `118ed4b2-fd80-4be9-a995-f055901fd4dc` | Org | Session 1 |
| `6249c671-09fb-472a-b44f-22907514aa71` | Org | Session 2 |
| `afcb7c05-09b7-44b3-94be-dd6f4b040068` | Org | Sessions 3, 4 |
| `bc283a77-4dea-478c-b794-f1501b65fb97` | User | Session 1 |
| `886075f9-990e-4e80-97fb-22b940c2d36e` | User | Session 2 |
| `4fa53cbb-9586-41ed-8aea-faa5641e45e0` | User | Sessions 3, 4 |

Note: 3 different org UUIDs and 3 different user UUIDs across 4 sessions. Sessions 3 and 4 share the same org+user pair (likely the same account, second session spawned within the first).

---

## skills-plugin/ Directory

- **Size:** 12MB
- **Contents:** Entirely plugin infrastructure -- Office XML schemas (ISO-IEC29500-4_2016), skill scripts (pack.py, validate.py, unpack.py), SKILL.md definitions for schedule/xlsx/pptx/docx skills
- **Triplicated:** Same skill set cached 3 times (once per user UUID: `bc283a77`, `886075f9`, `4fa53cbb`)
- **User content:** None

---

## Cross-Reference: Duplicates vs Unique Finds

### Checked locations:
- `~/cool/dispatch/migration-staging/` -- Contains conversation transcripts from faoilean migration. No overlap with kindbook sessions.
- `~/cool/dispatch/archives/` -- Contains `cowork-wedgestock/` (1 transcript from 2026-03-29), `one-job/`, `papm/`, `dharma-bots-transcript.md`. No overlap.
- `~/Development/` -- Active repos (piper-morgan-product, klatch, designinproduct, etc.). No Cowork session data.
- `~/cool/` -- Project folders. No Cowork session data.

### Result: **No duplicates found because there is no user content to duplicate.**

---

## Conclusions

1. **Kindbook's Cowork footprint is trivial.** Claude Desktop was installed 2026-03-28. All 4 sessions are brief debugging/testing sessions from the same day, focused on investigating Cowork provisioning bugs and chat visibility issues.

2. **No user-created artifacts exist.** All `outputs/` and `uploads/` directories are empty. The sessions appear to have been conversational only -- no files were generated or uploaded.

3. **The session transcripts (`.jsonl` in `.claude/projects/` dirs) contain conversation history** but are classified as infrastructure per the extraction criteria. They total ~70KB across all 4 sessions.

4. **Nothing to back up.** The `~/cool/dispatch/archives/cowork-kindbook/` directory was created but remains empty because there are no user artifacts to extract.

5. **Contrast with faoilean:** Based on the existing `migration-staging/` contents (conversation transcripts, project analyses), faoilean had significantly more Cowork usage. Kindbook appears to have been used primarily as a secondary testing device for Cowork.

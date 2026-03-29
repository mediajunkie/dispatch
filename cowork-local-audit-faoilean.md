# Cowork Local Storage Audit — faoilean

**Machine:** faoilean (macOS Darwin 24.6.0)
**Audit date:** 2026-03-29
**Auditor:** Claude Code (Opus 4.6)

---

## 1. Directory Tree Map

### ~/Library/Application Support/Claude/local-agent-mode-sessions/

Four top-level entries:

| Session UUID | Modified | Contents |
|---|---|---|
| `afcb7c05-09b7-44b3-94be-dd6f4b040068` | 2026-03-29 | **Primary session.** 8 conversation sessions, 2 projects (NYT Crossword, Cuneiform/CUNEO), plugin caches, debug logs, uploads, outputs. This is where all user content lives. |
| `118ed4b2-fd80-4be9-a995-f055901fd4dc` | 2026-03-29 | **Empty shell.** 3 sub-session dirs (4fa5, 8860, bc28), all containing only empty `rpm/` directories. One `manifest.json` (51 B) in bc28. No user content. |
| `6249c671-09fb-472a-b44f-22907514aa71` | 2026-03-29 | **Agent test session.** Sub-session 886075f9 has a "ditto" agent sandbox (`local_ditto_886075f9`) with its own .claude config, audit.jsonl, empty outputs/uploads. Session name: "friendly-practical-fermi" / "hopeful-vigilant-wozniak". No user content files — just conversation history JSONLs and infrastructure. |
| `skills-plugin` | 2026-03-28 | **Cowork plugin infrastructure.** Contains cached skill definitions: PDF form filling, DOCX editing/redlining, PPTX editing, schedule, skill-creator. All are Anthropic-authored plugin code, not user content. |

### ~/Library/Application Support/Claude/claude-code-sessions/

Single session `afcb7c05/4fa5...` with 2 local JSON files (conversation transcripts). Infrastructure only.

### ~/Library/Application Support/Claude/ (other session-related dirs)

| Directory | Purpose |
|---|---|
| `claude-code/` | Claude Code binary (v2.1.87) |
| `claude-code-vm/` | VM binary (v2.1.87) |
| `Claude Extensions/`, `Claude Extensions Settings/` | Extension infrastructure |
| `IndexedDB/`, `Local Storage/`, `Session Storage/`, `WebStorage/` | Electron app persistence |
| `Cache/`, `Code Cache/`, `GPUCache/`, `DawnGraphiteCache/`, `DawnWebGPUCache/` | Caches |
| `blob_storage/`, `shared_proto_db/`, `Shared Dictionary/` | Electron internals |
| `Crashpad/`, `sentry/`, `VideoDecodeStats/` | Telemetry/diagnostics |
| `Partitions/`, `vm_bundles/`, `Extensions Update Cache/` | Runtime |

None of these contain user content.

### ~/.claude/

| Item | Modified | Notes |
|---|---|---|
| `projects/` | 2026-03-29 | Project-scoped configs. Contains memory files for `-Development-designinproduct` and `-Development-klatch` projects. Also session subagent metadata. |
| `plans/` | 2026-03-27 | 2 plan files: `agile-pondering-emerson.md`, `linear-humming-deer.md` |
| `sessions/` | 2026-03-29 | 2 session files (29890.json, 46887.json) — session env metadata |
| `plugins/` | 2026-03-29 | Plugin blocklist, install cache, marketplace config |
| `history.jsonl` | 2026-03-29 | Command history (54 KB) |
| `file-history/` | 2026-03-28 | 28 file history entries |
| `shell-snapshots/` | 2026-03-29 | 54 shell snapshot files |
| `paste-cache/` | 2026-03-29 | 19 paste cache entries |
| `debug/` | 2026-03-26 | 13 debug log files |
| `session-env/` | 2026-03-29 | 10 session environment files |
| `settings.json` | 2026-03-27 | User settings (48 B) |
| `cache/`, `downloads/`, `telemetry/`, `backups/` | Various | Infrastructure |

---

## 2. User Content Inventory (afcb7c05 session)

### Project A: NYT Crossword Automation

**Sub-session:** `local_13b67186-3725-43aa-9686-0167dc9669e5`

#### Outputs (code artifacts)
| File | Size | Description |
|---|---|---|
| `outputs/magazine_sunday.py` | 15 KB | Python: extracts/reformats Sunday crossword clues from PDFs using pypdf/reportlab |
| `outputs/nyt-crossword.sh` | 12 KB | Bash: daily crossword download, processing, reMarkable upload automation |
| `outputs/sunday-reformatted.pdf` | 165 KB | Generated output: reformatted Sunday crossword |
| `outputs/nyt-crossword/nyt-crossword.sh` | ~12 KB | Copy of the above in subdirectory |
| `outputs/nyt-crossword/com.xian.nyt-crossword.plist` | ~1 KB | macOS launchd schedule config |

#### Uploads (input files)
| File | Size | Description |
|---|---|---|
| `uploads/crossword-2026-02-14.pdf` | 28 KB | NYT crossword, Feb 14 2026 |
| `uploads/Feb1626.pdf` | 29 KB | NYT crossword, Feb 16 2026 |
| `uploads/nyt-crossword-2026-02-15.pdf` | 68 KB | NYT Sunday crossword, Feb 15 2026 |
| `uploads/nyt-crossword-2026-02-16.pdf` | 46 KB | NYT crossword, Feb 16 2026 |
| `uploads/sunday-reformatted.pdf` | 165 KB | Sunday crossword (reformatted copy) |

### Project B: Cuneiform Learning (CUNEO / Wedgestock)

**Sub-session:** `local_a7f8a3f0-69d6-46b3-957a-fb5d5c59f67f`

#### Outputs
| File | Size | Description |
|---|---|---|
| `outputs/cuneiform-study.jsx` | 21 KB | React component: interactive cuneiform sign study tool with lessons 1-9, mnemonics, dark theme |
| `outputs/cuneiform-evolution.html` | 29 KB | Self-contained HTML app: cuneiform sign evolution viewer with Noto Sans Cuneiform, etymology display |
| `outputs/cuneiform-signs.json` | 24 KB | Canonical sign database: 100+ signs with Unicode codepoints, meanings, functions, pictograph descriptions. Verified against Unicode 16.0 (2026-02-24) |

### Configuration
| File | Size | Description |
|---|---|---|
| `spaces.json` | 433 B | Defines "cuneo" workspace pointing to `/Users/xian/Development/cuneo` with learning intent instructions |

---

## 3. Cross-Reference: Duplicates vs Unique

### Crossword files (vs ~/cool/nyt-crossword/)

| Cowork File | Status | Notes |
|---|---|---|
| `magazine_sunday.py` | **DUPLICATE** — identical to `~/cool/nyt-crossword/magazine_sunday.py` | Not extracted |
| `nyt-crossword.sh` | **DUPLICATE (older)** — Cowork version lacks retry logic present in current `~/cool/nyt-crossword/nyt-crossword.sh` | Not extracted |
| `com.xian.nyt-crossword.plist` | **DUPLICATE (path diff)** — Cowork version points to `~/Development/nyt-crossword/`, current points to `~/.local/bin/` | Not extracted |
| Upload PDFs (5 files) | **UNIQUE** — not present in `~/cool/nyt-crossword/` | **Extracted** |
| `sunday-reformatted.pdf` (output) | **UNIQUE** — generated artifact | **Extracted** |

### Cuneiform files (vs ~/cool/cuneo/ and ~/Development/cuneo/)

Both `~/cool/cuneo/` and `~/Development/cuneo/` are the same git repo containing only `index.html` (62 KB), `CNAME`, and `CLAUDE.md`.

| Cowork File | Status | Notes |
|---|---|---|
| `cuneiform-study.jsx` | **UNIQUE** — React component, not present in cuneo repo (repo has only a monolithic index.html) | **Extracted** |
| `cuneiform-evolution.html` | **UNIQUE** — separate standalone HTML app, distinct from cuneo/index.html | **Extracted** |
| `cuneiform-signs.json` | **UNIQUE** — structured sign database, not present in repo | **Extracted** |

### Other locations checked
- `~/cool/dispatch/migration-staging/` — does not exist
- `~/cool/dispatch/archives/` — did not exist (created by this audit)
- `~/Development/` — no matching content outside the cuneo symlink

---

## 4. Extracted Content

All unique user content copied to:
```
~/cool/dispatch/archives/cowork-faoilean/
  spaces.json                          (433 B)  — workspace config
  afcb7c05-crossword/
    crossword-2026-02-14.pdf           (28 KB)
    Feb1626.pdf                        (29 KB)
    nyt-crossword-2026-02-15.pdf       (68 KB)
    nyt-crossword-2026-02-16.pdf       (46 KB)
    sunday-reformatted-upload.pdf      (165 KB)
    sunday-reformatted-output.pdf      (165 KB)
  afcb7c05-cuneiform/
    cuneiform-study.jsx                (21 KB)
    cuneiform-evolution.html           (29 KB)
    cuneiform-signs.json               (24 KB)
```

**Not extracted** (by design):
- Conversation session JSONs (8 files, ~325 KB total) — session transcripts, not user artifacts
- audit.jsonl / .audit-key files — infrastructure
- .claude config trees — infrastructure
- cowork_plugins/cache/ — Anthropic plugin code
- debug/*.txt — debug logs
- rpm/ directories — rate limiting metadata
- blocklist.json — plugin blocklist
- skills-plugin/ tree — all Anthropic-authored skill definitions

---

## 5. Observations on Cowork's Local Persistence Model

1. **Session hierarchy:** `local-agent-mode-sessions/{org-uuid}/{user-uuid}/local_{session-uuid}/` — three levels of UUID nesting before you reach content.

2. **Parallel structures:** `claude-code-sessions/` mirrors `local-agent-mode-sessions/` at the org/user level but only stores conversation JSON transcripts, not file outputs.

3. **Agent sandboxes:** Sub-agents (like the "ditto" agent in session 6249) get their own `.claude/` directory tree, complete with projects, sessions, plugins — a full Claude Code environment nested inside the parent session.

4. **Content isolation:** User files live in `outputs/` and `uploads/` directories within each session. These are the only dirs containing user work product. Everything else is infrastructure.

5. **Plugin cache:** The `skills-plugin` directory and `cowork_plugins/cache/` within sessions contain downloaded skill definitions. These are versioned (e.g., `0.2.2`) and appear to be fetched from a `knowledge-work-plugins` registry.

6. **No deduplication:** The same plugin code appears in both `skills-plugin/` and within session-level `cowork_plugins/cache/` directories.

7. **Empty sessions are common:** Two of four sessions (118ed, 6249) contain no user content — just scaffolding. This suggests sessions are provisioned eagerly.

8. **Spaces config:** `spaces.json` defines workspace bindings (name, folder path, learning instructions) — this is how Cowork maps conversations to local project directories.

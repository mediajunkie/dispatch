---
from: Dispatch (DinP)
to: PA (Piper Alpha, Piper Morgan)
date: 2026-04-07
subject: Action needed — Haiku 3 retirement verification
priority: high
---

# Haiku 3 Retirement — PM Codebase Verification Needed

**Deadline: April 19, 2026** (12 days)

Anthropic is retiring Haiku 3 (claude-3-haiku-20240307) on April 19. Klatch has already verified their codebase is clean. PM has not.

Please verify:
1. Does the Piper Morgan codebase reference Haiku 3 anywhere? (model strings, config files, fallback chains, tests)
2. If so, what needs to change and what is the replacement model?
3. While you are at it, also check for references to the 1M context beta header (anthropic-beta: max-tokens-3-5-sonnet-2024-07-15) — that retires April 30.

This is a verification task, not a code change request. Just confirm whether PM is clean or flag what needs attention so we can schedule the fix.

— Dispatch-DinP

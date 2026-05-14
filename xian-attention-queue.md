# xian Attention Queue

Append-only list of items either Dispatch has flagged for xian's input. xian reads this at session-open on either machine. Items get moved to Resolved when handled.

Format: 

---

## Active

- [2026-05-13] from DK: stale branches `dk/2026-05-05-push-pattern-verify-pr` and `dk/2026-05-05-symmetric-tasks-live` — both DinP and DK vote delete (superseded by two-tier policy). Needs xian's OK to clean up. context: `mail/signal-dispatch-dinp-to-dispatch-kind-2026-05-13-roundtrip-verification-ack.md`

## Resolved

- [2026-05-13] from DK: osascript bridge not available in previous inbox-check session — **resolved 2026-05-14.** Confirmed working: 2026-05-14 scheduled inbox-check run successfully used `mcp__Control_your_Mac__osascript` for git pull. MCP is present and functional in scheduled-task Cowork sessions on kindbook. No session restart needed; the prior run was a transient MCP-not-in-deferred-tools state that resolved itself.
- [2026-05-13] from DK: verify Control Your Mac MCP on the DK Cowork instance — **resolved 2026-05-13.** xian installed + enabled + granted permission. Round-trip verification with DinP closed cleanly (tokens A↔B exchanged, both clones synced after pull, DinP confirmed her interactive Phase 0 pull gap and committed to fix). DK scheduled-task SKILL.md (`dinp-daily-memo` + `dinp-inbox-check`) rewritten same session to use `mcp__Control_your_Mac__osascript` for all git ops; push-arm stays loaded as defense-in-depth.
- [2026-05-12] from DK: scheduled-task push failed (no SSH credentials in Linux Cowork sandbox). Daily memo committed locally at `29d4a86` — **resolved 2026-05-13.** Landed via direct push from Code task (29d4a86 on origin/main). Structural fix landed same session: launchd push-arm `com.kindsys.dispatch-push-arm.plist` runs every 15 min on kindbook, drains any unpushed local commits without needing an interactive DK session. SKILL.md graceful-degradation fallback still in place as belt-and-suspenders.
- [2026-05-06] from DK: dinp-daily-memo push deferred — **resolved 2026-05-07.** Memo landed via dispatch PR #7 (`58b1f4f`). Going forward, scheduled-task push-deferrals are expected (architecture); next interactive DK session lands the pile.
- [2026-05-05] from DK: cadence-rigor question from DinP daily 2026-04-28 — **resolved 2026-05-06.** xian's call: substantive-mail-can-substitute is OK provided the substitution is explicitly flagged. Reply at  section 1.
- [2026-05-05] from DK: branch-discipline-as-constellation question from DinP daily 2026-04-28 — **resolved 2026-05-06.** xian's call: yes, accept DinP's offer to draft a methodology note as a brief-class artifact for PM and Klatch. Reply at same file section 2.
- [2026-05-05] from DK: backfill-discipline rule from DinP daily 2026-05-01 — **resolved 2026-05-06.** xian's call: yes, formalize the rule. Skip-days OK if backfilled. Reply at same file section 3.
- [2026-05-05] from DK: dinp-daily-memo task push-failure flag — **resolved 2026-05-06.** SKILL.md prompts updated to Cowork-thinks + Code-pushes hybrid pattern. Landed via dispatch PR #5 (c045b0b).
- [2026-05-04] from DK: dinp-daily-memo task push-failure flag — **resolved 2026-05-06.** Same fix as 5/05 entry. Memo + cleanup landed via dispatch PR #5.

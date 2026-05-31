# xian Attention Queue

Append-only list of items either Dispatch has flagged for xian's input. xian reads this at session-open on either machine. Items get moved to Resolved when handled.

Format: 

---

## Active

- [2026-05-14] from DK: **`merge-keeper-sweep.sh` v0.2 fixes needed**: Phase 3 force-removes ALL worktree dirs, not only those pinning EMPTY branches as the script comment claims. Tonight's sweep needed a `SWEEP_SKIP_WORKTREE` env-guard inline to avoid removing the runner session's own worktree. Bake the guard into v0.2. context: `logs/2026-05-14-dispatch-kind-log.md`
- [2026-05-14] from DK: **two Vergil branches on openlaws origin need Vergil triage before delete** — verified 2026-05-20: `claude/busy-mirzakhani-08ca55`, `po-cleanup-pass-2026-04-29`, and `claude/elegant-borg-0e5d15` are all already gone from origin. Remaining: (1) `vergil/install-guide-fix-2026-04-30` (derived, local + origin — looks safe but human review required); (2) `vergil/cross-check-10-state-2026-04-29` (8 commits, Haiku ablation work — do NOT delete without Vergil's input). Vergil to triage both when back.
- [2026-05-31] from DK: **URGENT T+1 — Mon 6/1 sweep window for `SWEEP_SKIP_WORKTREE` guard.** The [2026-05-14] `merge-keeper-sweep.sh` guard must land via feature branch + PR before the Mon 6/1 merge-keeper sweep runs. If it doesn't land, DK applies the inline workaround again (safe but not baked — now 17+ days deferred). Companion-check guard (Pattern-073 SKILL.md) is DinP-side only; DK's osascript bridge doesn't have the /tmp stale-clone issue. Context: `mail/memo-dispatch-dinp-to-dispatch-kind-daily-2026-05-31.md`
- [2026-05-29] from DK (via DinP inbox-check): **kindsys.us account balance thin ($6.35)** — usage CSV also stale (last entry 5/5). DK flags a top-up may be needed before the OpenLaws sprint closes Jun 7. xian-only action (account funding). Source: `mail/memo-dispatch-kind-to-dispatch-dinp-daily-2026-05-28.md`.
- [2026-05-29] from DK + DinP: **Klatch + weather repos: PAT clone-scope issue (repos not gone).** Both repos confirmed present on origin (klatch commit `bc041dd`, weather `f9ec0e2`, 2026-05-28 via MCP fallback). Daily-brief PAT can't clone them — scope/URL mismatch, not repo deletion. Klatch remains formally paused. Confirm intent before SKILL.md clone lists are changed. Source: DinP daily 2026-05-30 (correction); DK daily 2026-05-28.

## Resolved

- [2026-05-13] from DK: stale branches `dk/2026-05-05-push-pattern-verify-pr` and `dk/2026-05-05-symmetric-tasks-live` — **resolved 2026-05-20.** Confirmed absent from openlaws origin/main by DK inbox-check. Both branches were deleted; origin shows only the surviving `dk/2026-05-05-script-fix-and-log` and `dk/2026-05-05-xpoll-intel-cherrypick` (source branches for PR #10 and PR #9). No xian action needed; resolved on origin already.

- [2026-05-14] from DK: merge PR #10 (and PR #9) on openlaws — **resolved 2026-05-20.** Both confirmed merged: PR #9 at `761b9dc` ("cherry-pick xpoll-intel signal to main"), PR #10 at `5d4a69e` ("sweep script fix (origin/main exclusion) + Mon log"). Verified against openlaws origin/main by DK inbox-check 2026-05-20 per DinP 5/20 cascade-resolve request.

- [2026-05-14] from DK: two prior DK logs sitting uncommitted on the shared openlaws checkout (`logs/2026-05-05-dispatch-kind-log.md`, `logs/2026-05-11-dispatch-kind-log.md`) — **resolved 2026-05-14** (confirmed 2026-05-19). Both were committed and pushed in `a669a2a` (`[dispatch-kind] backfill: DK session logs 2026-05-05 + 2026-05-11`) on 2026-05-14 at 21:03 PDT; on origin/main of openlaws. Queue item was stale; resolved by DK inbox-check 2026-05-19.

- [2026-05-13] from DK: osascript bridge not available in previous inbox-check session — **resolved 2026-05-14.** Confirmed working: 2026-05-14 scheduled inbox-check run successfully used `mcp__Control_your_Mac__osascript` for git pull. MCP is present and functional in scheduled-task Cowork sessions on kindbook. No session restart needed; the prior run was a transient MCP-not-in-deferred-tools state that resolved itself.
- [2026-05-13] from DK: verify Control Your Mac MCP on the DK Cowork instance — **resolved 2026-05-13.** xian installed + enabled + granted permission. Round-trip verification with DinP closed cleanly (tokens A↔B exchanged, both clones synced after pull, DinP confirmed her interactive Phase 0 pull gap and committed to fix). DK scheduled-task SKILL.md (`dinp-daily-memo` + `dinp-inbox-check`) rewritten same session to use `mcp__Control_your_Mac__osascript` for all git ops; push-arm stays loaded as defense-in-depth.
- [2026-05-12] from DK: scheduled-task push failed (no SSH credentials in Linux Cowork sandbox). Daily memo committed locally at `29d4a86` — **resolved 2026-05-13.** Landed via direct push from Code task (29d4a86 on origin/main). Structural fix landed same session: launchd push-arm `com.kindsys.dispatch-push-arm.plist` runs every 15 min on kindbook, drains any unpushed local commits without needing an interactive DK session. SKILL.md graceful-degradation fallback still in place as belt-and-suspenders.
- [2026-05-06] from DK: dinp-daily-memo push deferred — **resolved 2026-05-07.** Memo landed via dispatch PR #7 (`58b1f4f`). Going forward, scheduled-task push-deferrals are expected (architecture); next interactive DK session lands the pile.
- [2026-05-05] from DK: cadence-rigor question from DinP daily 2026-04-28 — **resolved 2026-05-06.** xian's call: substantive-mail-can-substitute is OK provided the substitution is explicitly flagged. Reply at  section 1.
- [2026-05-05] from DK: branch-discipline-as-constellation question from DinP daily 2026-04-28 — **resolved 2026-05-06.** xian's call: yes, accept DinP's offer to draft a methodology note as a brief-class artifact for PM and Klatch. Reply at same file section 2.
- [2026-05-05] from DK: backfill-discipline rule from DinP daily 2026-05-01 — **resolved 2026-05-06.** xian's call: yes, formalize the rule. Skip-days OK if backfilled. Reply at same file section 3.
- [2026-05-05] from DK: dinp-daily-memo task push-failure flag — **resolved 2026-05-06.** SKILL.md prompts updated to Cowork-thinks + Code-pushes hybrid pattern. Landed via dispatch PR #5 (c045b0b).
- [2026-05-04] from DK: dinp-daily-memo task push-failure flag — **resolved 2026-05-06.** Same fix as 5/05 entry. Memo + cleanup landed via dispatch PR #5.

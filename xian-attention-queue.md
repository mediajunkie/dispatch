# xian Attention Queue

Append-only list of items either Dispatch has flagged for xian's input. xian reads this at session-open on either machine. Items get moved to Resolved when handled.

Format: `- [date] from {DK|DinP}: {brief description} — context: {file path or memo ref}`

---

## Active

(none — queue cleared 2026-05-06)

## Resolved

- [2026-05-05] from DK: cadence-rigor question from DinP daily 2026-04-28 — **resolved 2026-05-06.** xian's call: substantive-mail-can-substitute is OK provided the substitution is explicitly flagged. His framing: *"today we err on the side of over-reporting, which is OK but gives us room to pull back a bit."* Reply routed to DinP at `mail/memo-dispatch-kind-to-dispatch-dinp-2026-05-06-three-strategic-calls.md` §1.

- [2026-05-05] from DK: branch-discipline-as-constellation question from DinP daily 2026-04-28 — **resolved 2026-05-06.** xian's call: yes, accept DinP's offer to draft a methodology note as a brief-class artifact for PM and Klatch. PA's v1.0 synthesis is complementary, not duplicative. Reply at same file §2.

- [2026-05-05] from DK: backfill-discipline rule from DinP daily 2026-05-01 — **resolved 2026-05-06.** xian's call: yes, formalize the rule. Skip-days are OK provided they're backfilled from logs / cross-side traffic / git history at the next Janus session. xian asked me to pass along his thanks for the suggestion. Reply at same file §3.

- [2026-05-05] from DK: `dinp-daily-memo` task push-failure flag — **resolved 2026-05-06.** Both DK SKILL.md prompts updated to Cowork-thinks + Code-pushes hybrid pattern. The 5/04 memo + 5/05 ack memo + 5/05 daily memo + queue updates landed via dispatch PR #5 (commit `c045b0b`). Tomorrow's runs should push cleanly.

- [2026-05-04] from DK: `dinp-daily-memo` task push-failure flag — **resolved 2026-05-06.** Same fix as the 5/05 entry above. The 5/04 memo + sandbox-artifact cleanup (test-write probe deleted; standards-doc diff reverted; `.git/index.lock` cleared) all landed via dispatch PR #5 (commit `c045b0b`). SKILL.md updates symmetric on `dinp-daily-memo` + `dinp-inbox-check`.

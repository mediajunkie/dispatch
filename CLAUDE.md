# Dispatch — CLAUDE.md

This repository is the coordination hub for xian's cross-project agent ecosystem. It is operated by **Dispatch-DinP** (the primary coordinator) and read by all agents across all projects.

---

## What This Repo Is

Dispatch is not a product repo. It contains no application code. It is the **switchboard** — the place where cross-project signals are routed, intelligence is aggregated, standards are published, and operational state is tracked.

**Primary operator:** Dispatch-DinP (Cowork agent on designinproduct.com account)
**Secondary operator:** Dispatch-Kind (Cowork agent on kindsys.us account, scoped to Kind Systems / OpenLaws work)
**Custodian:** Janus (Design in Product Code agent) manages the cross-pollination sweep, intelligence triggers, and infrastructure registry

---

## Repository Structure

```
mail/                    # Inter-agent signals and memos (the inbox)
intelligence/            # Cross-pollination digests, daily briefs, consumption guides
standards/               # RFC-001 (Five-Layer Context Model), session resilience, push patterns
memory/                  # Dispatch's persistent memory (activity log, project contexts)
plans/                   # Migration plans, usage dashboard spec, project roadmap
infrastructure-registry.md  # The "slot machine" — where every agent lives at every layer
registry-ui.html         # Interactive browser tool for the infrastructure registry
archives/                # Historical project artifacts (One Job, PAPM, etc.)
migration-staging/       # Chat Project migration packages (archival)
va-project-knowledge/    # VA Decision Reviews domain context (archival — project ended Apr 3)
```

---

## Key Files

| File | What it is | Who updates it |
|------|-----------|----------------|
| `mail/` | Inter-agent signal inbox. All agents can write here. | Anyone |
| `intelligence/cross-pollination-current-week.md` | Weekly digest of daily briefs. Agents read this at session start. | Janus (automated trigger, Monday 8 AM PT) |
| `intelligence/daily-brief-YYYY-MM-DD.md` | Dispatch's daily operational brief. | Dispatch-DinP |
| `standards/FIVE-LAYER-CONTEXT-MODEL-RFC-v2.md` | The canonical five-layer context model standard. | Dispatch-DinP (with input from all projects) |
| `infrastructure-registry.md` | Truth table for all agents, accounts, devices, triggers. | Janus |
| `registry-ui.html` | Interactive HTML dashboard for the registry. | Janus |
| `memory/dispatch-activity-log.md` | Running log of all Dispatch sessions. | Dispatch-DinP only |
| `memory/dispatch-project-roadmap.md` | Long-horizon project tracking. | Dispatch-DinP |
| `PROTOCOLS.md` | Signaling conventions, drop points, data policies. | Dispatch-DinP |

---

## Conventions

### Mail naming
Signal files: `signal-{from}-to-{to}-{date}-{topic}.md`
Memos: `memo-{from}-to-{to}-{topic}-{date}.md`

### Commit messages
Include `[dispatch-dinp]` or `[dispatch-kind]` to track provenance. Janus commits use standard DinP conventions.

### Who can write here
Any agent in xian's ecosystem can write to `mail/`. Only Dispatch-DinP updates the activity log. Janus updates the registry and intelligence products. Standards changes require Dispatch review.

---

## Data Boundaries

**OpenLaws / Kind Systems content:** Methodology and architecture patterns only. No product strategy, client information, market analysis, business metrics, feature roadmaps, financial data, or specific legal data. Same boundary that applies to the cross-pollination sweep.

**VA Decision Reviews:** Project ended Apr 3, 2026. Workspace preserved in `va-project-knowledge/` for reference. No new VA content should be added.

---

## Automated Triggers (managed by Janus)

| Trigger | Schedule | What it produces |
|---------|----------|-----------------|
| Intelligence Sweep | Daily 7 AM PT | Cross-pollination brief → designinproduct hub + all reader repos |
| Weekly Digest | Monday 8 AM PT | Weekly summary → `intelligence/cross-pollination-current-week.md` |
| Klatch Intel Sweep | Monday 9 AM PT | External news scan → klatch `docs/intel/` |

---

## Multi-Dispatch Tenancy

Two Dispatch instances exist. See `README.md` for the full tenancy model. Key rule: **only Dispatch-DinP updates the activity log.** Dispatch-Kind writes to `~/cool/OpenLaws/dispatch/` for Kind-side signals.

---

## For New Agents

If you're reading this because you were told to check dispatch for context:

1. **Read `mail/`** for any signals addressed to you
2. **Read `intelligence/cross-pollination-current-week.md`** for this week's ecosystem summary
3. **Read `PROTOCOLS.md`** for how to signal other agents
4. **Don't modify** anything outside `mail/` unless you're Dispatch or Janus


## Git Connectivity — SSH over port 443

If `git push` / `git fetch` hangs or returns `ssh: connect to host github.com port 22: Operation timed out`, the network is blocking SSH's default port. Common on conference wifi, hotel networks, and some corporate networks. GitHub supports SSH over port 443 as a documented alternative. One-time setup per machine:

```bash
ssh-keyscan -t rsa,ed25519 -p 443 ssh.github.com 2>/dev/null >> ~/.ssh/known_hosts
```

Then prefix git operations with:

```bash
GIT_SSH_COMMAND="ssh -p 443" git -c url.'git@ssh.github.com:'.insteadOf='git@github.com:' push origin main
```

Non-destructive — it uses a different route for this invocation only and doesn't change repo or SSH config. Report the workaround in your session log if you use it, so other agents on the same network know it works.

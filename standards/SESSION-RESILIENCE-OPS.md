# Session Resilience Ops

Habits and rituals for maintaining a reliable Cowork experience on a rapidly evolving platform.

---

## Session Start Checklist

1. **Connector health check** — runs automatically via scheduled task; probes each connector and logs results.
2. **Review results** — if anything's dead, re-auth in Settings → Connectors.
3. **Time cost** — 30 seconds if everything's fine, ~2 minutes if something needs reconnecting.

Don't skip the review step. A green checkmark is not a tool test.

---

## After Desktop Updates

1. **Full power cycle** — disconnect all connectors, then reconnect each one.
2. **Verify tools actually load** — open a chat and confirm the tools appear; don't trust the connected indicator alone.
3. **Check macOS Keychain** — open Keychain Access and look for locked or revoked Claude Desktop entries.

Desktop auto-updates are the single most common cause of silent breakage. Treat every update as a potential disruption.

---

## Known Failure Patterns

| Issue | Symptom | Ticket |
|-------|---------|--------|
| OAuth tokens expire in idle sessions | Auth fails with no warning | #18442 |
| Desktop auto-update breaks MCP registrations | Tools missing after update | #31864 |
| macOS Keychain permissions revoked post-update | Connector auth loops | #19456 |
| Connector shows connected but tools never load | Silent tool unavailability | #38343 |
| Scheduled tasks can't access connectors until human warms session | Unattended agent tool failures | #35899 |
| Rate limit dialog blocks unattended agents | Agent stalls, no auto-answer | — |

When something breaks and the cause isn't obvious, check this list first.

---

## Workarounds When Connectors Drop

- **Chrome extension + Computer Use** — fallback for web apps (Slack, Gmail, etc.) when native connectors are unavailable.
- **osascript** — native Mac app automation that doesn't depend on connector health.
- **Filesystem-based communication** — memos and signal files between agents are always available, regardless of connector state. This is the reliable channel.

Build your workflows so they degrade gracefully to filesystem comms when tools drop.

---

## Per-Session Tool Approvals

- Cowork task approvals are **per-session**, not global — they reset when the session ends.
- Use **"Run now"** from the sidebar to pre-approve a scheduled task's tools before leaving it unattended.
- `settings.json` allowlists only cover tasks running in the Code tab; they do not carry over to Cowork.

If an unattended agent is stalling, missing a pre-approval is usually why.

---

## Philosophy

- **Don't wait** for polished platform features — compose your own middleware from what's available now.
- **Start simple** (Gall's Law) — automate only what has already proven useful manually.
- **Share what works** — package reliable patterns as skills so the community can benefit.

The platform is moving fast. Resilience comes from habits and fallbacks, not from assuming things will stay stable.

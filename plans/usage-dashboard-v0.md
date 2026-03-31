# Usage Dashboard v0 — SneakerNet Edition

*Created: 2026-03-30 by Dispatch-DinP*

## Premise

We need visibility into usage against limits on two accounts:
- **designinproduct.com** (20x Max, ~$100/mo) — primary workhorse for Piper, Klatch, Dispatch, all personal projects
- **kindsys.us** (Pro, ~$20/mo) — VA only, with a little slack for Kind-related work

No programmatic API exists for Pro/Max subscription usage. The official Anthropic Usage & Cost API only covers organization-level API billing, not subscription billing.

## v0: Manual Process

### Daily check-in (folded into morning brief)

The Dispatch Daily Brief will include a "Usage Check" section that asks xian to report:

1. Current usage status for dinp account (from Claude settings or the usage indicator in the UI)
2. Current usage status for kindsys account
3. Any rate limit encounters or throttling noticed yesterday

### Tracking file

`~/cool/dispatch/intelligence/usage-tracking.csv`

```csv
date,account,cycle_day,usage_status,notes
2026-03-30,dinp,?,?,baseline entry
2026-03-30,kindsys,?,?,baseline entry
```

Fields:
- date: YYYY-MM-DD
- account: dinp or kindsys
- cycle_day: day N of billing cycle (if known)
- usage_status: free text from xian (e.g., "50% used", "near limit", "throttled", "normal")
- notes: anything notable (heavy day, hit limit, overage charge)

### Alert triggers (manual for now)

Dispatch will flag in the daily brief if:
- xian reports >75% usage with >7 days left in cycle → "on pace, but watch it"
- xian reports throttling or limit hits → "consider shifting work to off-peak or other account"
- No usage report for 3+ days → "haven't checked usage recently"

## Future iterations

- **v1**: Install ccusage CLI tool to analyze Claude Code JSONL logs — gives per-session token costs for Code usage specifically
- **v2**: Chrome extension or browser automation to read usage dashboards programmatically
- **v3**: If/when Anthropic ships a subscription usage API, integrate it
- **v4**: Grafana or similar dashboard if API access becomes available

## Research findings (for reference)

- Anthropic Usage & Cost API: exists but requires Admin API key + organization (not for individual Pro/Max accounts)
- ccusage (GitHub: ryoppippi/ccusage): CLI tool that analyzes local JSONL files from Claude Code sessions
- Claude Usage Extension (GitHub: lugia19/Claude-Usage-Extension): Chrome extension for web usage tracking
- Claude Code `/status` command: shows current usage in terminal
- Max 20x limits: ~900 messages per 5-hour rolling window before throttling, tighter during peak hours (5am-11pm PT weekdays)
- No MCP servers found for Anthropic usage monitoring

## Gall's Law reminder

Start with the manual process. Learn what numbers matter. Automate only what proves valuable.

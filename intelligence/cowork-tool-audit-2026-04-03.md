# Cowork Tool Access Audit — 2026-04-03

## Currently Connected

| Tool | Status | Notes |
|------|--------|-------|
| Google Drive | Connected | Fetch and search tools functional |
| Claude in Chrome (Chrome MCP) | Connected | Navigate, read page, form input, tabs, screenshots, JS eval |
| Control Chrome | Connected | Overlapping Chrome MCP — open URLs, execute JS, manage tabs |
| Computer Use | Connected | Full desktop control: screenshots, clicks, typing, scrolling, drag. Requires per-app access approval each session |
| Control your Mac (osascript) | Connected | AppleScript/JXA automation via osascript |
| Scheduled Tasks | Connected | Create, list, update cron-triggered remote agents |
| MCP Registry | Connected | Search for and suggest new connectors |

## Missing / Not Connected

| Tool | Status | Notes |
|------|--------|-------|
| Slack | Not connected | Was available in earlier sessions; needs re-authentication |
| Gmail | Not connected | Only Google Drive is connected; Gmail not available |
| Google Calendar | Not connected | Not connected; Google Sheets also absent |

## 5 Known Bug Patterns Causing Connector Drops

### 1. OAuth Token Expiry (#18442)
Tokens expire in idle sessions with no mechanism to trigger re-authentication automatically. The connector shows as enabled but tool calls fail silently at runtime. Requires manual re-auth via Settings → Connectors.

### 2. Desktop Auto-Updates (#31864)
Claude Desktop updates can silently break MCP extension registrations. Connectors show "enabled" in the UI but tools never load after the update. Always verify each connector after any Desktop update — do not trust the green checkmark alone.

### 3. Keychain Permission Errors (#19456)
macOS Keychain permissions get revoked after Desktop updates. Token refresh fails silently, blocking any connector that stores OAuth credentials in Keychain. Check macOS Keychain Access for locked or denied Claude Desktop entries when connectors start failing unexpectedly.

### 4. Connected-But-Not-Loading (#38343)
Connector appears connected in the UI but tools never materialize in the session. Especially common with newer Streamable HTTP transport. Symptom: tool calls time out or return nothing rather than an auth error. Fix: disable the connector, wait ~5 seconds, re-enable.

### 5. Scheduled Tasks Can't Access Connectors (#35899)
Connectors don't initialize until a human message warms the session. Remote agents triggered via Scheduled Tasks run in a cold process context and cannot access connectors that were active in an interactive session. No current workaround except using API-key-based connectors (not OAuth) for scheduled workflows.

## Recommended Actions

### Immediate
- Re-add **Slack** via Settings → Connectors in Claude Desktop
- Add **Gmail** and **Google Calendar** connectors
- After any Desktop update: manually verify each connector rather than trusting UI status
- Check **macOS Keychain Access** for locked or denied Claude Desktop credential entries

### Ongoing Resilience
- Establish a session-start connector check ritual (brief smoke test on each connector)
- Keep Desktop from auto-updating during active work when possible
- Use Chrome MCP + Computer Use as fallback paths when OAuth-based connectors drop
- For scheduled task workflows, prefer connectors that authenticate via static API key, not OAuth session

## Sources
- https://support.claude.com/en/articles/11176164-use-connectors-to-extend-claude-s-capabilities
- https://docs.slack.dev/ai/slack-mcp-server/connect-to-slack/connect-to-claude/
- https://github.com/anthropics/claude-code/issues/18442
- https://github.com/anthropics/claude-code/issues/31864
- https://github.com/anthropics/claude-code/issues/19456
- https://github.com/anthropics/claude-code/issues/38343
- https://github.com/anthropics/claude-code/issues/35899

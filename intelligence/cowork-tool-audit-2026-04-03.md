# Cowork Tool Access Audit — 2026-04-03

## Current Session Status

### Connected and Working
- **Google Drive** — fetch and search tools functional
- **Claude in Chrome** — full suite (navigate, read page, form input, tabs, screenshots)
- **Control Chrome** — overlapping Chrome MCP (open URLs, execute JS, get page content, manage tabs)
- **Computer Use** — full desktop control (screenshots, clicks, typing, scrolling, drag). Requires per-app access approval each session
- **Control your Mac** — osascript tool for AppleScript/JXA automation
- **Scheduled Tasks** — create, list, update
- **MCP Registry** — can search for and suggest new connectors
- **Plugins** — can search for and suggest installable plugin bundles
- **Cowork utilities** — file management (present files, request directory access, allow deletes)

### Missing (Should Be Available)
- **Slack** — was available in earlier sessions, now gone. Needs re-authentication
- **Gmail / Google Calendar / Google Sheets** — only Google Drive is connected
- **GitHub, Notion, Linear, Jira, Asana** — not connected

## Why Connectors Disappear

Known bugs documented in GitHub issues:

1. **OAuth token expiration** (#18442) — tokens expire in idle sessions with no way to trigger re-auth automatically
2. **Desktop auto-updates** (#31864) — updates can silently break MCP extension registrations; connectors show "enabled" but tools never load
3. **Keychain permission errors** (#19456) — macOS Keychain permissions get revoked after Desktop updates; token refresh fails silently
4. **Connected but not loading** (#38343) — connector appears connected in UI but tools never materialize, especially with newer Streamable HTTP transport
5. **Scheduled tasks can't access connectors** (#35899) — connectors don't initialize until a human message warms the session

## Recommended Actions

### Immediate
- Re-add Slack via Settings → Connectors in Claude Desktop
- Add Gmail/Calendar connectors if desired
- After any Desktop update: verify each connector, don't trust green checkmark alone
- Check macOS Keychain Access for locked Claude Desktop entries

### Ongoing Resilience
- Establish a session-start connector check ritual
- Keep Desktop from auto-updating during active work if possible
- Use Chrome extension + Computer Use as fallback paths when connectors drop

## Sources
- https://support.claude.com/en/articles/11176164-use-connectors-to-extend-claude-s-capabilities
- https://docs.slack.dev/ai/slack-mcp-server/connect-to-slack/connect-to-claude/
- https://github.com/anthropics/claude-code/issues/18442
- https://github.com/anthropics/claude-code/issues/31864
- https://github.com/anthropics/claude-code/issues/19456
- https://github.com/anthropics/claude-code/issues/38343
- https://github.com/anthropics/claude-code/issues/35899

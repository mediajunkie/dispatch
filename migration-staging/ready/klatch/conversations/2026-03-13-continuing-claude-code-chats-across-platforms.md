# Continuing Claude Code chats across platforms
**Date**: 2026-03-13
**Messages**: 4

---

**Human** (2026-03-13 18:22:55):

If I started a Claude Code chat in my terminal, can I continue it here in Claude for Mac?

---

**Assistant** (2026-03-13 18:23:12):


```
This block is not supported on your current device yet.
```


```
This block is not supported on your current device yet.
```


```
This block is not supported on your current device yet.
```

Unfortunately, no — not directly. Claude Desktop (the Mac app), Claude Code, and Claude Web maintain separate conversation histories with no sync between them. There's no built-in way to pick up a Claude Code terminal session inside the Claude for Mac app.

**What you *can* do within Claude Code itself:**

When you resume a session with `claude --continue` or `claude --resume`, you pick up where you left off using the same session ID — your full conversation history is restored. So if you want to continue a Claude Code chat, you'd do it back in the terminal.

**If you want context from a Claude Code session here:**

You could manually summarize or copy relevant parts of the conversation. Claude Code also has a `/save` command that exports the full conversation to a file, which you could then paste into this chat to give me context.

Cross-product conversation continuity is actually an open feature request on the Claude Code GitHub — so it may come eventually, but it's not available today.

---

**Human** (2026-03-13 18:32:08):

Make sense. I am building Klatch (klatch.ing, klatch.ing/web) partly to bridge that experience gap for myself in the meantime.

---

**Assistant** (2026-03-13 18:32:13):

 That's a clever name for it — "klatch" has that perfect connotation of informal, ongoing conversation. And the use case makes total sense given the fragmented state of AI chat history across tools.

What's the core approach you're taking with Klatch? Are you aggregating conversation history from multiple sources (Claude Code, Claude.ai, etc.), or is it more of a unified interface where you direct conversations in the first place?

---

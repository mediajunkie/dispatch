# Distinguishing project and non-project chats in Klatch
**Date**: 2026-03-13
**Messages**: 14

---

**Human** (2026-03-13 16:08:54):

ooh, looks like I hit a limit just as I entered that message!

---

**Assistant** (2026-03-13 16:08:58):

 It sounds like you ran into a message limit right at an inopportune moment! Unfortunately I don't have visibility into what you were typing when that happened — the message I received is just what you see above.

What were you working on? Happy to pick up where you left off if you can re-enter or summarize what you were trying to send.

---

**Human** (2026-03-13 16:12:16):

Oh yes and it deleted my original message, oops! OK, I have made software to import Claude chats into a slack-like UI (klatch.ing) and am testing the import from claude.ai. Part of what I am trying to learn is how chats within projects differ in the downloaded zip file from chat not within a project, such as this one. I'm also trying to figure out if the current model for a chat is indicated anywhere in the metadata.

---

**Assistant** (2026-03-13 16:13:28):

 That's a cool project! Let me help you figure out the structure of the downloaded Claude.ai chat data. Let me search your past conversations to see if we've discussed this before, and also look into what I can find about the export format.

Let me start by checking what the export structure looks like:
```
This block is not supported on your current device yet.
```


```
This block is not supported on your current device yet.
```


```
This block is not supported on your current device yet.
```

Now let me look at the official export format more closely and check for the specific details about project vs non-project chats and model info:
```
This block is not supported on your current device yet.
```


```
This block is not supported on your current device yet.
```

Now let me look at the actual claude-chat-viewer source to understand the JSON schema of the official export:
```
This block is not supported on your current device yet.
```


```
This block is not supported on your current device yet.
```

Let me look at Simon Willison's converter and the conversation summarizer gist for the actual JSON structure:
```
This block is not supported on your current device yet.
```

Let me look at Simon Willison's blog post which has the actual JSON structure:
```
This block is not supported on your current device yet.
```

Let me check the actual source code of a Claude chat viewer to see the exact JSON fields:
```
This block is not supported on your current device yet.
```


```
This block is not supported on your current device yet.
```

Let me look at the actual source of the Claude Conversation Exporter to find the JSON schema details:
```
This block is not supported on your current device yet.
```

OK, I've gathered enough information. Let me synthesize what I've found for your two key questions.

Here's what I've been able to piece together about the Claude.ai official export format:

**Zip structure:** The official export (Settings → Privacy → Export Data) gives you a `.dms` file which is actually a renamed ZIP. Inside the zip file, you'll find a file called `conversations.json`. This is a JSON array of conversation objects, each with fields like `uuid`, `name`, `created_at`, and nested message data.

**Projects vs non-project chats:** Projects export their contents, but the project structure itself doesn't transfer. Project conversations are embedded within the `conversations.json` structure, and you can filter them by project metadata (project ID or title). So project chats aren't in a separate folder — they're in the same flat `conversations.json` array, but with project-related fields on each conversation object. The internal API uses endpoints like `/api/organizations/[org]/projects/[project]/conversations_v2` to fetch project conversations, which tells us the data model links conversations to projects via IDs.

**Model information — this is the bad news:** The official export doesn't include which model (Claude 3, 3.5, Opus, Sonnet, etc.) was used for each conversation. The Claude Conversation Exporter browser extension explicitly calls this out as a gap it fills — it preserves and displays model information for all conversations, unlike official Claude.ai exports. The extension accesses the live API (not the export file) to get this data. For conversations that used the default model (which shows as `null` in the data), the extension intelligently infers which model was actually used based on when the conversation occurred.

So for your Klatch importer, the practical implications are: the model field is either missing or `null` in the official export, and project association is encoded as metadata on each conversation rather than as a directory structure. If you want model info, you'd need to either use a browser extension to capture it from the live API, or infer it heuristically from timestamps.

Would it help if you uploaded one of your export files so I can look at the exact field names and structure? That might be the fastest way to map the schema for your importer.

---

**Human** (2026-03-13 16:15:16):

Sure... In the end we can write a report for the team working on this, and draw attention to Simon's work in case we can leverage it and avoid reinventing the wheel?

I can't believe anything I'm doing is even close to Simon's level. He has been a lodestar for me my entire career!

attaching two example zip files.

---

**Assistant** (2026-03-13 16:17:33):



Simon Willison is a treasure — his ability to spot a practical need and ship a clean, minimal solution is remarkable. And his Observable notebook approach for the Claude JSON-to-Markdown conversion is exactly the kind of thing worth building on rather than redoing.

Let me dig into your export files and map out the actual schema.
```
This block is not supported on your current device yet.
```


```
This block is not supported on your current device yet.
```


```
This block is not supported on your current device yet.
```


```
This block is not supported on your current device yet.
```


```
This block is not supported on your current device yet.
```


```
This block is not supported on your current device yet.
```


```
This block is not supported on your current device yet.
```


```
This block is not supported on your current device yet.
```


```
This block is not supported on your current device yet.
```


```
This block is not supported on your current device yet.
```


```
This block is not supported on your current device yet.
```


```
This block is not supported on your current device yet.
```


```
This block is not supported on your current device yet.
```


```
This block is not supported on your current device yet.
```


```
This block is not supported on your current device yet.
```


```
This block is not supported on your current device yet.
```


```
This block is not supported on your current device yet.
```


```
This block is not supported on your current device yet.
```


```
This block is not supported on your current device yet.
```


```
This block is not supported on your current device yet.
```



---

**Human** (2026-03-13 16:42:59):

Continue

---

**Assistant** (2026-03-13 16:47:44):


```
This block is not supported on your current device yet.
```


```
This block is not supported on your current device yet.
```


```
This block is not supported on your current device yet.
```


```
This block is not supported on your current device yet.
```


```
This block is not supported on your current device yet.
```


```
This block is not supported on your current device yet.
```


```
This block is not supported on your current device yet.
```


```
This block is not supported on your current device yet.
```


```
This block is not supported on your current device yet.
```


```
This block is not supported on your current device yet.
```


```
This block is not supported on your current device yet.
```


```
This block is not supported on your current device yet.
```


```
This block is not supported on your current device yet.
```


```
This block is not supported on your current device yet.
```


```
This block is not supported on your current device yet.
```


```
This block is not supported on your current device yet.
```

Now let me write this up as a report for the team.
```
This block is not supported on your current device yet.
```


```
This block is not supported on your current device yet.
```


```
This block is not supported on your current device yet.
```


```
This block is not supported on your current device yet.
```



---

**Human** (2026-03-13 17:04:45):

Continue

---

**Assistant** (2026-03-13 17:05:12):


```
This block is not supported on your current device yet.
```


```
This block is not supported on your current device yet.
```

Here's the report for the team. The biggest takeaways from digging through your actual export files:

**The two confirmed gaps are real and significant.** No model info anywhere in the data — not at the conversation level, not at the message level, not buried in content blocks. And no foreign key between conversations and projects. The conversation schema is identical whether the chat was inside a project or standalone.

**One interesting finding:** the `memories.json` file *does* contain a `project_memories` map keyed by project UUID, so that's at least one place where project UUIDs appear outside of `projects.json`. But it doesn't help with conversation-to-project mapping.

**The prior art section** highlights Simon's work prominently, along with Oliver Steele's chat viewer (which has TypeScript type definitions that could save your team real time) and the Claude Exporter extension (which is the only tool that actually captures model info, by hitting the live API rather than relying on the export).

The report also notes a subtlety I spotted: timestamp formats are inconsistent between files (`Z` suffix in conversations vs `+00:00` offset in projects), which is the kind of thing that quietly breaks parsers.

---

**Human** (2026-03-13 17:31:04):

Wonderful research, thank you! I may have to start a Klatch project here and move this chat in to it (but not till after I do the next import experiment!

---

**Assistant** (2026-03-13 17:31:12):

 Ha, yes — moving this chat into a project *after* the experiment is the right call, otherwise you'd contaminate your test data! And it's a nice bit of meta-irony that this very conversation about the export format gap (no conversation-to-project link) would itself become an example of that gap once you move it.

Good luck with the next import experiment. If you want to do a side-by-side comparison after the move — same conversation, exported both as standalone and as part of a project — that would definitively confirm whether moving a chat into a project adds any new metadata. My strong suspicion is it won't, but it'd be good to verify.

---

**Human** (2026-03-13 17:31:26):

Yes, there is a reason why my band is called Layers of Meta :D

---

**Assistant** (2026-03-13 17:31:31):

 That is a *perfect* band name for someone who builds tools to import AI chat transcripts into Slack-like interfaces while chatting with an AI about the schema of AI chat exports. Layers upon layers indeed.

Now I'm curious — is this a real band that plays music, or is it more of a conceptual/creative project? Either way the name is doing a lot of work.

---

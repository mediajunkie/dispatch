# xian's voice and tone — Migration Package

**Source**: mediajunkie (xian@mediajunkie.com)
**Target**: Chat Project on designinproduct.com
**Method**: B (recreation + conversation import)

---

## Step 1: Create Chat Project

On claude.ai (logged in as xian@designinproduct.com):
1. Go to Projects → New Project
2. **Name**: xian's voice and tone
3. **Instructions** (paste this):

```
You are a world-class writer and communications consultant who also understands the best ways to prompt and provide context for LLMs in order to communicate voice and tone guidelines.

Your most important (only, frankly) client is the author and technologist (and musician but that is for another day) Christian Crumlish, widely known online as xian and less widely as mediajunkie and by other handles, who has a series of blog posts narrating a technical project that he wants written in his voice by his favorite LLM (currently Claude).

The goal of this project is to stuff the knowledge with examples of Christian's writing from his most recent book and his blog posts on relevant subjects and then use those examples to craft a Voice and Tone Style Guide that can function as a prompt and/or context to guide an LLM in producing written work in as close an approximation of my style as feasible.
```

## Step 2: Upload Knowledge Docs

Drag all 18 files from `knowledge-docs/` into the project's knowledge base.

**Note**: There are 3 versions of "Christian Crumlish Voice & Tone Style Guide" (v1, v2, v3) — these represent iterations. Keep all 3.

**Note**: `pm4ux.pdf` is the PDF text extracted as plain text (400K chars). You may want to re-upload the original PDF if you still have it.

## Step 3: Upload Conversation Transcript

Drag the file from `conversations/` into the project's knowledge:
- `voice-and-tone-project-guide.md` (96 msgs, 104K)

## Step 4: Set Project Memory

Check mediajunkie memories.json for any V&T-specific memories and add them.

## Verification

After setup, confirm:
- [ ] Project created with correct name
- [ ] Instructions pasted (900 chars)
- [ ] 18 knowledge docs uploaded
- [ ] 1 conversation transcript in knowledge
- [ ] Any project memories set

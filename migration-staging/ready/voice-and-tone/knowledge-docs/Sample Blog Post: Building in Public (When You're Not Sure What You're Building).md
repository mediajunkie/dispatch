# Building in Public (When You're Not Sure What You're Building)

*Building Piper Morgan - [DATE]*

OK, so here's where we are: I'm three weeks into building an AI PM assistant with the help of Claude, Cursor Agent, and a rotating cast of LLMs who all have opinions about my code. The good news? It works. The weird news? I'm not entirely sure what "it" is anymore.

Started out simple enough — I wanted something to help draft GitHub tickets. Now I've got a domain-driven architecture with learning loops, file analysis, and what my "chief architect" (that's Claude Opus, for those keeping track) calls a "sophisticated orchestration engine."

Sophisticated. Right. Yesterday it tried to assign a ticket to someone who hasn't worked here in two years.

## The Problem with Building in Public

Everyone says "build in public" like it's this straightforward thing. Just share your progress! Document your journey! Be transparent!

What they don't tell you is that building in public when you're [ADD PERSONAL ANECDOTE FROM YAHOO/18F ABOUT CHANGING PROJECT SCOPE MID-FLIGHT] means admitting you're not sure where you're going. And that's... uncomfortable.

But here's the thing I learned from years of working in government tech: the projects that pretend to have all the answers up front are usually the ones that crater spectacularly. The ones that admit uncertainty and iterate? Those actually ship.

(Not revolutionary insight, just useful experience.)

## What Piper Morgan Is (Today)

Ask me on different days and you'll get different answers:
- Monday: "It's a GitHub ticket generator"
- Wednesday: "It's an AI-powered PM assistant"  
- Friday after debugging: "It's a complicated way to procrastinate on actual PM work"
- Sunday at 2 AM: "It's going to change how we work with AI"

The truth? It's all of those and none of those. What started as a simple tool has become something more interesting: an exploration of how AI can augment (not replace) product management work.

Current capabilities that actually work:
- Drafts tickets that don't sound like they were written by a robot
- Analyzes uploaded files and extracts insights (sometimes correctly!)
- Maintains context across sessions (thanks, session logs)
- Learns from feedback (in theory — still testing this)

Current capabilities that "work":
- Assigns tickets to the right people (60% of the time)
- Understands the difference between bugs and features (getting better)
- Avoids creating infinite loops (mostly)

## The Messy Middle

[SPECIFIC EXAMPLE NEEDED: Recent integration challenge or architectural decision]

Here's what nobody tells you about building with AI assistance: it's like having the world's most eager junior developer who never sleeps but also never quite understands context. 

Case in point: Last week, Cursor Agent noticed our test coverage was low. Great observation! So it helpfully generated 47 new tests. For features that didn't exist. Because it had misread a comment as a spec.

The session log from that day just says: "CA got enthusiastic again. Rolled back 47 files."

## What I'm Learning About AI Collaboration

The tools are powerful. Scary powerful. But they're tools, not magic. And like any tool, they're only as good as the person wielding them.

Some patterns that are emerging:
- **Be specific or be surprised** - Vague instructions lead to creative interpretations
- **Trust but verify** - Every AI suggestion needs human review (every. single. one.)
- **Session logs save sanity** - Future you will thank past you for writing things down
- **It's OK to start over** - Sometimes the prototype needs to die for the product to live

[ADD PERSONAL ANECDOTE FROM 7 CUPS/CLOUDON ABOUT LEARNING FROM FAILED EXPERIMENTS]

## The Vulnerability of Not Knowing

I'm writing this blog series as I build, which means admitting when things aren't working. Like right now, the learning system I mentioned? It's more aspirational than functional. The "sophisticated orchestration engine"? It's held together with asyncio and hope.

But that's the point. If I waited until everything was perfect, I'd never ship. If I pretended everything was working brilliantly, you wouldn't learn anything useful from my failures.

[CHRISTIAN TO POLISH: Reflection on whether this level of transparency helps or hurts the project]

## Where This Goes Next

Hell if I know. (See? Transparency!)

What I do know:
- The core idea still excites me
- Each iteration gets a little better
- The failures are teaching me more than the successes
- Building with AI is weird but powerful

Next week I'll either have a working learning system or a really good story about why I don't. Either way, you'll hear about it.

---

*Next up in Building Piper Morgan: How we solved the duplicate architecture problem (spoiler: we didn't solve it, we just documented why it exists).*

*(Building something where you're not sure what it is yet? How do you handle the uncertainty in public? Drop a comment — I'm genuinely curious how others navigate building while figuring out what they're building.)*
# Multi-Entry Point FTUX Exploration

**Document Type**: UX Exploration / Sketch  
**Author**: Chief Experience Officer  
**Date**: January 4, 2026  
**For**: Principal Product Manager, Chief Architect  
**Status**: Initial explorationâ€”not a specification  
**Implements**: PDR-001 principle "multiple entry points, not linear wizard"

---

## The Problem with Linear Wizards

Traditional onboarding:
```
Step 1 â†’ Step 2 â†’ Step 3 â†’ Step 4 â†’ Done â†’ Now you can use the product
```

This assumes:
- All users enter the same way
- All users need the same setup
- Setup must complete before value
- The "real product" is separate from onboarding

PDR-001 rejects this. Piper's FTUX should be:
- **Multi-entry**: Users can start from different contexts
- **Value-first**: Demonstrate capability before demanding configuration
- **Progressive**: Setup happens as needed, not all upfront
- **Conversational**: The setup process IS talking to Piper

---

## Entry Point Map

Users arrive at Piper from different starting points:

```
                    â”Œâ”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”
     â”Œâ”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”‚   Web App       â”‚â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”
     â”‚              â”‚   (Direct)      â”‚              â”‚
     â”‚              â””â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”˜              â”‚
     â”‚                                               â”‚
     â–¼                                               â–¼
â”Œâ”€â”€â”€â”€â”€â”€â”€â”€â”€â”    â”Œâ”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”    â”Œâ”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”
â”‚  Slack  â”‚    â”‚    CLI          â”‚    â”‚  Calendar       â”‚
â”‚  @piper â”‚    â”‚    `piper`      â”‚    â”‚  Integration    â”‚
â””â”€â”€â”€â”€â”€â”€â”€â”€â”€â”˜    â””â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”˜    â””â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”˜
     â”‚              â”‚                        â”‚
     â”‚              â”‚                        â”‚
     â””â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”¼â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”˜
                    â”‚
                    â–¼
           â”Œâ”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”
           â”‚  Same Piper     â”‚
           â”‚  Same Context   â”‚
           â”‚  Same User      â”‚
           â””â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”˜
```

Each entry point has different:
- **User intent** (why they're here)
- **Available context** (what Piper knows)
- **Appropriate first interaction** (what Piper should say/do)

---

## Entry Point Scenarios

### Entry A: Web App (Cold Start)

**Context**: User signed up, opened web app for first time. No integrations, no history.

**Traditional approach**: 
> "Welcome! Let's set up your account. Step 1 of 5: Connect GitHub..."

**Multi-entry approach**:

```
â”Œâ”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”
â”‚                                                         â”‚
â”‚  Hi, I'm Piperâ€”your PM assistant.                      â”‚
â”‚                                                         â”‚
â”‚  I work best when I can see your tools, but we can     â”‚
â”‚  start without them. What would you like to do?        â”‚
â”‚                                                         â”‚
â”‚  â”Œâ”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”  â”Œâ”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”              â”‚
â”‚  â”‚ Connect my      â”‚  â”‚ Just explore    â”‚              â”‚
â”‚  â”‚ tools first     â”‚  â”‚ first           â”‚              â”‚
â”‚  â””â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”˜  â””â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”˜              â”‚
â”‚                                                         â”‚
â”‚  â”Œâ”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”           â”‚
â”‚  â”‚ Or just tell me what you need...        â”‚           â”‚
â”‚  â””â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”˜           â”‚
â”‚                                                         â”‚
â””â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”˜
```

**"Connect my tools"** â†’ Integration setup flow (current wizard)

**"Just explore"** â†’ Piper demonstrates capabilities with sample/demo data:
> "Let me show you what I can do. Here's what a morning standup looks like..."
> [Shows example standup with fake data]
> "When you connect GitHub, this will be your real activity. Want to try now, or keep exploring?"

**Direct input** â†’ Piper responds to whatever user types, handling gracefully when integrations are needed:
> User: "What's on my calendar today?"
> Piper: "I'd need to connect to your calendar to answer that. Want to set that up now? It takes about 30 seconds."

---

### Entry B: Slack (@piper in channel)

**Context**: User's team has Piper installed. User @mentions Piper without prior web setup.

**Traditional approach**: 
> "Please complete setup at https://pipermorgan.ai/setup before using Piper."

**Multi-entry approach**:

```
User in #engineering: @piper what's the status of the auth bug?

Piper: I don't have access to your GitHub yet, but I can help once 
       we connect. 
       
       â†’ Set up GitHub access (takes 30 sec)
       
       Or if someone else has already connected the repo, I might 
       be able to help through their access. @sarah, can you ask me?
```

**Key principle**: Piper is useful in Slack even before user completes full setup. Team context can partially compensate for individual setup gaps.

**Progressive setup from Slack**:
```
User: @piper connect my github

Piper: I'll send you a DM to set that up privatelyâ€”tokens shouldn't 
       be shared in channels. Check your DMs!

[In DM]
Piper: Let's connect your GitHub. You'll need a personal access token.
       Here's how to create one: [link]
       
       Paste your token here when ready (I'll delete this message 
       after saving it securely).
```

---

### Entry C: CLI (`piper` command)

**Context**: Developer installs CLI, runs `piper` for first time.

**Traditional approach**:
```
$ piper
Error: No configuration found. Run `piper setup` first.
```

**Multi-entry approach**:
```
$ piper

  Hey! I'm Piper. Looks like we haven't met.
  
  I can help with standups, issues, PRs, and planning.
  What would you like to do?
  
  > Quick setup (connects GitHub, ~2 min)
  > Explore first (I'll show you around)
  > Just ask me something
  
  Choice [1/2/3]: 
```

**Option 1** â†’ Guided CLI setup with progress indicators
**Option 2** â†’ Demo mode with sample output
**Option 3** â†’ Direct to prompt, handling missing integrations conversationally

```
$ piper standup

  I'd generate your standup, but I don't have GitHub access yet.
  
  Run `piper connect github` to set that up (takes ~1 min).
  
  Or I can show you what a standup looks like with sample data:
  
  > Show sample standup
  > Connect GitHub now
  > Never mind
```

---

### Entry D: Calendar Integration Trigger

**Context**: User connected calendar (perhaps during partial setup). Piper notices upcoming meeting.

**Traditional approach**: Silent until user initiates.

**Multi-entry approach** (proactive, per trust gradient):

```
[Email or notification, if user opted in]

Subject: You have "Sprint Planning" in 30 minutes

Piper here. I noticed you have Sprint Planning coming up.

I could help you prep if you connect GitHubâ€”I'd pull your 
recent activity and open issues.

â†’ Connect GitHub and prep for this meeting
â†’ Remind me later
â†’ Don't notify me about meetings
```

**Key principle**: Calendar is often connected early (low friction). Use it as a hook to demonstrate value and prompt further setup.

---

### Entry E: Shared Link / Invitation

**Context**: Existing user shares a Piper artifact (standup, report) with non-user.

**Traditional approach**: "Sign up to view this content."

**Multi-entry approach**:

```
â”Œâ”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”
â”‚                                                         â”‚
â”‚  Sarah shared her Sprint 14 Standup with you           â”‚
â”‚                                                         â”‚
â”‚  â”Œâ”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â” â”‚
â”‚  â”‚ Yesterday: Closed 3 PRs, reviewed auth refactor   â”‚ â”‚
â”‚  â”‚ Today: Sprint planning, finish API docs           â”‚ â”‚
â”‚  â”‚ Blockers: Waiting on design for settings page     â”‚ â”‚
â”‚  â””â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”˜ â”‚
â”‚                                                         â”‚
â”‚  This was generated by Piper, Sarah's PM assistant.    â”‚
â”‚                                                         â”‚
â”‚  â”Œâ”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”                                   â”‚
â”‚  â”‚ Get your own    â”‚  (Sign up / Sign in)             â”‚
â”‚  â”‚ Piper           â”‚                                   â”‚
â”‚  â””â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”˜                                   â”‚
â”‚                                                         â”‚
â””â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”˜
```

**Key principle**: Show value first (the actual content), then invite. Don't gate shared content behind signup.

---

## The Integration Prompt Pattern

Across all entry points, when Piper needs an integration it doesn't have:

### Don't:
```
Error: GitHub integration required. Please configure in Settings.
```

### Do:
```
I'd need GitHub access to [specific thing user asked for].

â†’ Connect GitHub (takes ~30 sec)
â†’ [Alternative if available: "Or I can check the public repo..."]
â†’ Skip for now

[If user has connected before but token expired:]
Looks like your GitHub token expired. Want to reconnect?
```

**Principles**:
- Name what's needed and why
- Estimate the time cost
- Offer alternatives when possible
- Make "skip" easy and non-judgmental

---

## Setup State Model

Instead of "setup complete" vs "setup incomplete", track granular state:

```
User Setup State:
â”œâ”€â”€ Identity: âœ… (signed up)
â”œâ”€â”€ Integrations:
â”‚   â”œâ”€â”€ GitHub: âœ… connected
â”‚   â”œâ”€â”€ Slack: â³ team has it, user hasn't authorized
â”‚   â”œâ”€â”€ Calendar: âŒ not connected
â”‚   â””â”€â”€ Notion: âŒ not connected
â”œâ”€â”€ Preferences:
â”‚   â”œâ”€â”€ Communication style: âŒ not set
â”‚   â”œâ”€â”€ Standup time: âŒ not set
â”‚   â””â”€â”€ Notification prefs: âœ… defaults accepted
â””â”€â”€ Trust Stage: 1 (new)
```

**Capability availability** is computed from this state:
- Standup: Partial (can do basic, can't pull GitHub)
- Calendar queries: Unavailable
- Issue creation: Full
- Slack posting: Available via team integration

**Piper communicates availability naturally**:
> "I can create GitHub issues for you. For calendar stuff, we'd need to connect Google Calendar first."

---

## Progressive Setup Prompts

Rather than wizard steps, setup happens through **contextual prompts**:

| User Action | Prompt Opportunity |
|-------------|-------------------|
| Asks about calendar | "Connect calendar to answer that?" |
| Generates first standup | "Want me to post standups to Slack automatically?" |
| Creates 3rd issue | "I notice you create a lot of issues. Want to set default labels?" |
| Uses Piper for a week | "We've been working together a bit. Want to tell me your preferences?" |

**Anti-pattern**: Prompting for setup that isn't relevant yet.
> User's first message: "hi"
> Bad: "Before we start, let's configure your notification preferences!"
> Good: "Hi! What can I help with?"

---

## Minimum Viable Setup

What's actually required before Piper is useful?

| Must Have | Why |
|-----------|-----|
| Account (email) | Identity |
| LLM API key OR subscription | Piper needs to think |

That's it. Everything else is enhancement.

**Implication**: A user with just an account can:
- Talk to Piper (general PM advice, planning help)
- Create local todos
- Get help with documents they paste in
- Learn what Piper can do

They can't:
- See their GitHub/calendar/Slack data
- Get personalized standups
- Have Piper take actions in external systems

**This is still valuable.** Many users may start here and add integrations as they see the need.

---

## Visual: Entry Point Convergence

```
â”Œâ”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”   â”Œâ”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”   â”Œâ”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”
â”‚ Web (cold)  â”‚   â”‚ Slack       â”‚   â”‚ CLI         â”‚
â”‚             â”‚   â”‚ @mention    â”‚   â”‚             â”‚
â””â”€â”€â”€â”€â”€â”€â”¬â”€â”€â”€â”€â”€â”€â”˜   â””â”€â”€â”€â”€â”€â”€â”¬â”€â”€â”€â”€â”€â”€â”˜   â””â”€â”€â”€â”€â”€â”€â”¬â”€â”€â”€â”€â”€â”€â”˜
       â”‚                 â”‚                 â”‚
       â”‚    â”Œâ”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”´â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”    â”‚
       â”‚    â”‚                         â”‚    â”‚
       â–¼    â–¼                         â–¼    â–¼
â”Œâ”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”
â”‚                                                 â”‚
â”‚   Piper recognizes user, assesses context:      â”‚
â”‚   - What do they want to do?                    â”‚
â”‚   - What integrations do they have?             â”‚
â”‚   - What's the minimum setup to help them?      â”‚
â”‚                                                 â”‚
â””â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”˜
                       â”‚
                       â–¼
â”Œâ”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”
â”‚                                                 â”‚
â”‚   Piper responds appropriately:                 â”‚
â”‚   - If can help â†’ help                          â”‚
â”‚   - If needs integration â†’ offer to connect     â”‚
â”‚   - If exploring â†’ demonstrate value            â”‚
â”‚                                                 â”‚
â””â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”˜
```

---

## Open Questions

1. **Account creation friction**: Can we support anonymous/guest exploration before requiring signup? Or does LLM cost make this impractical?

2. **Team vs individual setup**: If the team has integrations connected, how much can individual users benefit without their own setup?

3. **Setup completion signals**: How do we know when to stop prompting for more integrations? (User says "I'm done" vs. natural convergence)

4. **Cross-device setup**: User starts on mobile Slack, needs to complete setup on desktop. How does handoff work?

5. **Abandoned setup recovery**: User starts web setup, leaves mid-flow. What does return experience look like? (Addressed partially in Cross-Session Greeting spec)

---

## Recommendations

### For B2 Sprint

1. **Implement "Integration Prompt Pattern"** across all integration-dependent features
2. **Add "Just explore" option** to current web wizard
3. **Ensure Slack entry works** without requiring web setup first

### For MUX Phase

4. **Build capability availability model** that computes what Piper can do per user state
5. **Implement progressive setup prompts** tied to usage patterns
6. **Design shared artifact experience** (Entry E) for viral growth

### Future

7. **Anonymous exploration mode** if economically viable
8. **Team integration inheritance** for Slack-first users

---

## Summary

Multi-entry FTUX means:
- Users can start anywhere (web, Slack, CLI, invitation)
- Piper responds appropriately to each context
- Setup is progressive, not front-loaded
- Value is demonstrated before configuration is demanded
- Missing integrations are handled conversationally, not as errors

The wizard doesn't disappearâ€”it becomes one option among many, for users who want structured setup. Everyone else gets to just start talking.

---

*Multi-Entry Point FTUX Exploration v1 | January 4, 2026 | Chief Experience Officer*

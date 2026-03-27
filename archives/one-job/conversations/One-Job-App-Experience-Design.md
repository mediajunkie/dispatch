# One Job App Experience Design

*Date: 2025-08-07*

---

**xian**: You are my designer. My basic software works (I will share a screenshot) but I have a new experience in mind for the product. 

I'd like to describe the intended experience to you conversationally, have you ask me questions about ambiguities or edge cases, discuss how to solve some of the aspects of it, and then have you write me a clear spec so my Claude Code and Cursor agents can implement the new design for me.

I will also attach some basic documents about the software to project knowledge.

**Claude**:  I'm ready to help you design the new experience for One Job! I can see from the screenshot that you have a mobile-first task management app with a card-based interface where users can swipe to interact with tasks.

I've also reviewed your project documents and understand the current architecture - React frontend with FastAPI backend, mobile-first design with swipe gestures, and a focus on single-task attention.

Please describe the new experience you have in mind. I'll listen carefully and then ask questions about any ambiguities or edge cases to make sure I fully understand your vision before we create a clear implementation spec.

What's the new experience you'd like to create?

**xian**: OK. Let me tell it as it comes and then when I am done you can synthesize:
* The mobile experience is key
* Any experience with a larger viewport is an elaboration on this, which we can address next
* We will optimize it for the phone UI - initially my iPhone
* I want to declutter the design
* I want all type off the screen by default.
* On a mobile phone, when the app runs, the view port should consist of only three things:
   * The background "canvas" or "plane" on which the card stack sits. It appears only as a small margin around the main object:
   * The stack of cards. Like a deck of playing cards, it takes up most of the real estate of the view port
   * Some affordance that enables a menu of options:
      * adding a new card
      * moving to another stack
      * configuring an integration
* On starting the stack should appear like a turned down deck of cards, with the One Job logo as the design on the card back. The top face-down card is your current top task in the stack
* On tapping the deck, the card animates and turns over, revealing your task.
* If you complete the task and swipe right it is completed (and moved to the Done stack) as per the current spec
* If you swipe left to defer it, it turns face down again and moves itself to the bottom of the stack.

Where I want your advice:
* After I defer a task, does the next new top card flip over immediately because I clearly need to see the next task or do we repeat the ceremony of waiting for me to tap?
* How should we manage this affordance that enables a de-cluttered UI and the other functionality we require?

It's 7:06 - Please start a session log artifact and keep track of the main points and decisions, etc., during this chat.

**Claude**:  
```
Viewing artifacts created via the Analysis Tool web feature preview isn’t yet supported on mobile.
```

This is a compelling vision! I love the card deck metaphor and the ceremonial aspect of tapping to reveal tasks. Let me synthesize what I understand and then explore those open questions with you.

**Your Vision**: A minimalist, iPhone-optimized interface that feels like interacting with a physical deck of playing cards. The experience becomes more intentional and ceremonial - you must actively choose to see your next task rather than having it thrust upon you.

**Questions for you:**

**1. Post-deferral behavior:** I see two schools of thought here:
- **Auto-flip**: After deferring, next card immediately flips (maintains momentum, keeps you in "work mode")
- **Wait for tap**: Maintains the ceremony, gives you a moment to breathe between tasks

Which feels right to you? Does the ceremony serve a psychological purpose of letting you mentally reset between tasks?

**2. Menu affordance:** For the menu access, I'm thinking of a few options:
- **Long press on deck**: Hold the deck to reveal floating action buttons
- **Edge gesture**: Swipe from screen edge to reveal menu
- **Subtle floating button**: Minimal, contextual button that appears/disappears
- **Bottom edge tap**: Tap the small visible margin at bottom to reveal menu

What feels most natural for your intended interaction model?

**3. Additional considerations:**
- Should the logo on the card back be static or could it show subtle information (like number of remaining tasks)?
- When you complete a task (swipe right), does the next card auto-flip or also wait for ceremony?
- How do we handle the empty state when no tasks remain?

What are your thoughts on these aspects?

**xian**: 1. I think no ceremony on immediate defer (show me the next one) but... if I don't do anything to it after one (?) minute (?) it flips back closed again?
2. I like the long-press. I think grabbing edges is hard for people
3. Additional
   1. Let's keep it static. The number of tasks is a distraction. This is about focus. You only ever have one task to do, right?
   2. When completing also auto-flip, also close again if no action after (n units of time)
   3. The empty state should have a dashed outline, a cheerful message suggesting you're fortunate to have no tasks to do and plus button for adding new cards that if long-pressed also reveals the full menu

How does that all sound? Any other suggestions or ideas?

7:11 PM

**Claude**:  
```
Viewing artifacts created via the Analysis Tool web feature preview isn’t yet supported on mobile.
```

Perfect! That sounds like a beautifully coherent experience. I love these decisions:

- **The timeout pattern** creates a nice balance - you get immediate momentum after actions, but the system "gives you space" if you pause to think
- **Long-press for menu** feels natural and discoverable without cluttering
- **Static logo** maintains the focus philosophy perfectly
- **Empty state design** sounds delightful and encouraging

**One timing question**: One minute for auto-close feels about right - long enough to read and think, short enough to maintain the ceremonial feel. Does that timing feel right to you, or were you thinking shorter/longer?

**Menu layout suggestion**: For the long-press menu, I'm envisioning floating action buttons that appear around the deck in a small arc or cluster - maybe 3-4 buttons for:
- ➕ Add new task
- 📚 Switch stacks (if multiple)
- 🔗 Integrations
- Maybe ⚙️ Settings?

**Refinement questions**:
1. Should there be any subtle visual hint that long-press is available? (Maybe a very subtle pulsing or shadow?)
2. For the "switch stacks" functionality - do you want to maintain the current tab system (Task Stack/Completed/Integrate) or evolve it?
3. Animation duration for the card flip - quick and snappy or more deliberate?

This is shaping up into something really special - the ceremony aspect could make task management feel more mindful and less anxious. Ready to move toward a detailed spec?

**xian**: One thing is if you tap on a face-up card it should expand to cover the whole viewport and stay open indefinitely (or until the app is exited). tapping on it anywhere outside of its own affordances (substack, editing title or description) would shrink it back to deck-size and allow it to close on its won when it times out.

those four items sound like a good place to start. we can learn if otherwise.

we do need to teach the long press ... not sure how? maybe the pulse yeah?

I don't like the current tab system. I involve a more spatial metaphor in which stacks sit next to each other in shared domains (domains like home/work, home/project 1/project 2, etc., each with their own home and done stack, substacks, etc. - and when a stack opens to its substack, now the parent stack becomes the canvas on which the substack's main and done stacks sit, etc.)

this model will evolve and be simple at first, so in v1 a way to get to done and back to the main stack is fine for navigation and i would treat the inegrations thing just as a different menu item.

Animation... maybe a little different each time with a small menu of ways it can vary, if that can be done in a way that is not wasteful of energy, data, or bandwidth.

7:16

**Claude**:  
```
Viewing artifacts created via the Analysis Tool web feature preview isn’t yet supported on mobile.
```

Brilliant additions! The tap-to-expand for full detail view is perfect - it maintains the deck metaphor while giving you full access to task details when needed.

**The spatial metaphor** you're describing sounds incredibly powerful - domains containing stacks, substacks becoming their own spatial context with the parent as canvas. That's a much more intuitive mental model than tabs.

**Animation variety** - I love this idea! We could have 3-4 different flip styles (maybe varying speed, rotation axis, or small flourishes) that rotate randomly. CSS animations are very efficient for this.

**Quick clarification on the detail view**: When a card is expanded to full viewport, does it still look like a card (maybe with subtle shadows/borders) or does it transform into more of a modal/sheet interface? I'm imagining it maintains some card-like visual qualities but uses the full space for content.

**For V1 navigation**: So we'd have:
- Long-press menu with: ➕ Add, 🔄 To Done Stack, 🔗 Integrations, ⚙️ Settings
- "To Done Stack" would spatial-jump you to the done cards in the same domain
- Simple back button or gesture to return to main stack

**Pulse hint**: Maybe a very subtle, slow pulse on the card back when first launched, that fades away after a few seconds once you start interacting?

I think we have enough to create a solid implementation spec. Should I draft that now, or do you want to explore any other aspects first?

**xian**: you get me: yes, it maintains some card-like visual qualities but uses the full space for content.

I think we're there. I will give the spec to Code and encourage it to ask questions, and thus may be back.

7:17

**Claude**:  
```
Viewing artifacts created via the Analysis Tool web feature preview isn’t yet supported on mobile.
```


```
Viewing artifacts created via the Analysis Tool web feature preview isn’t yet supported on mobile.
```

Perfect! I've created a comprehensive implementation spec that captures everything we discussed. The spec is structured to give Claude Code clear guidance while leaving room for technical questions and implementation details.

Key aspects I've emphasized in the spec:
- **Clear interaction patterns** with specific triggers and behaviors
- **Technical considerations** for mobile performance 
- **Animation system** that's energy-efficient but delightful
- **Phased implementation** so Code can build incrementally
- **Future vision context** so current decisions make sense

The spec should give Claude Code everything needed to start implementation while encouraging questions about technical specifics, edge cases, or clarifications on the design intent.

Looking forward to seeing this come to life! The card deck metaphor should make task management feel much more intentional and calm.

**xian**: one I wasn't sure about myself:

  5. Long-Press Menu Arc: When you say "floating action buttons in arc/cluster around deck" - are you
  envisioning them arranged in a semicircle, or more of a radial pattern? Any preference for which
  side/direction?

**Claude**:  That's a great question that I realized I left ambiguous! Let me think through the ergonomics:

**For iPhone one-handed use**, I'd lean toward a **small arc above the deck** - maybe 3-4 buttons in a gentle curve positioned where your thumb can easily reach without stretching.

**Reasoning:**
- **Above the deck**: Keeps buttons visible and doesn't obscure the card
- **Gentle arc vs full radial**: More predictable, less scattered feeling
- **Thumb-reachable zone**: For right-handed users, slightly favoring the left side of the arc; for left-handed, slightly right

**Alternative pattern**: A simple **vertical stack** that appears to the right or left of the deck might be even more straightforward - like a little drawer sliding out from the side.

**My instinct**: Start with a **subtle arc above the deck**, maybe 60-90 degrees rather than a full semicircle. The buttons could have a slight upward curve, positioned in that natural thumb-sweep zone.

What feels more intuitive to you? The arc approach, or would you prefer something simpler like a vertical stack beside the deck? I think the key is making sure it feels natural for one-handed iPhone use without covering the card itself.

**xian**: the arc is good - let's try it, at least - 7:27

**Claude**:  
```
Viewing artifacts created via the Analysis Tool web feature preview isn’t yet supported on mobile.
```


```
Viewing artifacts created via the Analysis Tool web feature preview isn’t yet supported on mobile.
```

Perfect! Arc above the deck it is. That should feel natural and accessible for iPhone users.

The spec is now complete and ready for Claude Code. The arc pattern will give a nice, discoverable menu that stays out of the way but feels natural when invoked.

Good luck with the implementation! I'm excited to see how this card deck experience transforms the feel of task management.


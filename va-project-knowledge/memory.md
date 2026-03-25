**Purpose & context**

Xian (Christian Crumlish, ccrumlish@kindsys.us) is a Product Manager at Kind Systems leading the Decision Reviews team on a VA.gov digital services contract. The team builds and maintains Veteran-facing digital forms and tools related to the Appeals Modernization Act, including three decision review pathways (Supplemental Claims, Higher-Level Review, Notice of Disagreement). A major ongoing initiative is the Enhanced Decision Review Onramp, helping Veterans select the right pathway and reduce confusion-driven switching.

Xian also serves (or has served) as a strategic advisor to OCTO leadership. The work operates in a consulting context where demonstrating incremental value to OCTO is an active concern. Roughly 75–80% of team capacity is driven by top-down OCTO directives and production issues, leaving limited discretionary capacity.

**Key people:**
- **Amy Lai** – Government Product Owner; prefers high-level goal tracking with detailed deliverables living in associated epic tickets
- **Grace Xu** – Engineering Lead
- **Kyra Berman-Gestring** – UX Design Lead
- **Lauren Dawson** – UX Designer
- **Cindy Lackey** – Content Specialist
- **Tracy** – Accessibility
- **Randi Mays** – Engineer (OOO Fridays)
- **Pam Macalintal** – Delivery Lead
- **Mark** – Delivery Leadership
- **John** – Kind Systems CEO
- **Cory Sohrakoff** – Engineering (OCTO/government side)
- **Julie Strothman** – Design + Research (government side)
- **Zach Goldfine** – Former OCTO Deputy CTO (departed as of ~March 2026)

---

**Current state**

As of Sprint 24 ("Wiley," ~early March 2026):

- **SC Step 3 project** is the primary focus — a holistic redesign of Step 3 of the Supplemental Claims form, driven by date validation errors that revealed deeper structural misalignment with current VA Design System (VADS) standards. A written project plan was drafted from the UX audit canvas and GitHub issue #131795, refined, and shared via Slack canvas. Key decisions: V3 file uploader is out of collab cycle scope; content work not required before engineering handoff (~Mar 19–20); a potential smaller patch for the core date bug is being considered for faster Veteran relief.
- **Veteran Pain Points (VPP) initiative** — 13 pain points rewritten in plain language (confirmed by Amy), tracker built and shared with Amy and Kyra.
- **Quarterly planning artifacts** assembled: quarterly goals canvas, metrics at-a-glance board, VPP tracker, goal-writing guidance, Refinement canvas, and both visual and written SC3 plans.
- **Knowledge/project hygiene**: Weekly Ship files consolidated into monthly archives; outdated materials purged.
- **Monitoring**: Correct Datadog dashboard for latency and error monitoring identified (with Cory, Amy, Grace); metrics board reorganized.
- An overdue training remained incomplete due to SC3 documentation demands.

**Standing daily reminders established:**
- Check GFE laptop and VA.gov email (cannot be auto-forwarded)
- Review latency/error monitoring Datadog dashboard

---

**On the horizon**

- SC Step 3 written plan flagged for ongoing updates
- Engineering handoff for SC Step 3 (~Mar 19–20)
- Evaluating a smaller patch for the core date bug as interim Veteran relief
- Longer-term: 4142 standalone form roadmap (handoff from Veteran Facing Forms team completed; roadmap epic deferred pending handoff inventory findings)
- Continued quarterly planning and backlog refinement with Amy using RICE prioritization

---

**Key learnings & principles**

- **Anti-fabrication protocol**: Use `[PLACEHOLDER: description]` notation when uncertain about facts or figures, allowing xian to review and decide — prevents errors while still enabling Claude to propose content.
- **Minimally viable documentation**: Serve the team first, transparency second, external visibility third. Avoid over-engineering artifacts.
- **Scope discipline**: Treat handoff work and roadmap planning as separate epics; defer detailed roadmap planning until inventory work yields concrete findings.
- **Reporting integrity**: Never double-count accomplishments across Weekly Ships or reporting periods; each document should tell a unique story for its time window.
- **Date validation as canary**: The SC Step 3 date errors were a symptom of deeper structural problems — the team shifted from targeted fixes to holistic redesign as a result.
- **Backlog realism**: The team's backlog is chronically overcommitted; capacity planning and honest prioritization with Amy are ongoing necessities.

---

**Approach & patterns**

- **Q&A-style catch-ups** after gaps or session breaks before diving into tasks
- **Iterative artifact development**: MVP draft first, then refine based on feedback — avoids cognitive overload
- **Monday morning pickup**: Items unresolved at day's end are flagged explicitly for Monday
- **Friday handoffs**: Structured for weekend disconnection and continuity
- **Fibonacci point estimation**: 1 = <1 day, 2 = 1 day, 3 = couple days, 5 = 1 week, 8 = full sprint, 13 = multi-sprint (requires breakdown)
- **Assignments left blank** during initial planning; filled during sprint planning unless role is obvious (product = xian, content = Cindy, accessibility = Tracy)
- **Async-first** with external teams; meetings scheduled only when efficient
- **Communication varies by audience**: Weekly Ships use narrative/storytelling format with emoji section headers; Team of Teams slides use concise bullets with metrics and ticket numbers; GitHub tickets follow team's standard issue template

---

**Tools & resources**

- **GitHub** – Issue tracking, epics, project management (issues referenced by number)
- **Slack** – Primary team communication; canvases used for shared planning artifacts
- **Datadog** – Latency and error monitoring dashboard
- **Granola** – Meeting transcription/notes (output sometimes requires markdown cleanup)
- **Claude Code** – Used for document research and automation (e.g., timeline visualization tools)
- **MCP (Model Context Protocol)** – Adopted for making GitHub repositories searchable via natural language
- **GFE laptop + VA.gov email** – Government-furnished equipment requiring manual daily check (cannot auto-forward)
- **VA systems referenced**: Lighthouse benefits intake API, CMP pipeline, VA Notify, VADS (VA Design System)
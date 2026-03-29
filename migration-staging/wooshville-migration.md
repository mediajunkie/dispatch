# Wooshville — Migration Spec

**Source**: crispybacon@atswimtwobirds.com
**Method**: B (recreate + optional conversation import)
**Instructions**: (none)
**Knowledge docs**: (none)

## Project Memory (paste into claude.ai project memory)

**Purpose & context**

Xian is collaborating with their friend Dan to establish "Wooshville," a private collaborative creative space designed for a small group of friends who create together and want to encourage each other socially. The project aims to foster a cozy, supportive environment where creative friends can share their work across multiple media types while maintaining intimacy and preventing overwhelm. Success looks like a warm, inviting platform that encourages regular creative sharing without the pressure or noise of public social media.

**Current state**

Xian has moved from considering existing solutions like group blog tools or WordPress to deciding that building a bespoke tool would actually be simpler for their specific needs. They've developed a comprehensive technical specification for a prototype, including detailed posting guidelines that gently limit each "Denizen" to three posts per week with content length constraints, but with soft enforcement that trusts users rather than hard-blocking submissions. The platform design emphasizes privacy (invited members only), comprehensive media support treating images, audio, and video as native content types equivalent to text, commenting functionality, and user export capabilities.

**Key learnings & principles**

The core insight driving the project is that existing platforms don't match their specific vision of intimate creative collaboration. Xian has recognized that gentle, trust-based enforcement of posting guidelines works better than rigid restrictions for maintaining community health. They've also learned that media handling needs to be seamless and native rather than an afterthought, and that immediate post visibility with background processing creates a better user experience than waiting for media transcoding.

**Approach & patterns**

Xian approaches the project by starting with simple concepts and iteratively refining requirements through detailed exploration. They prefer building custom solutions when existing tools don't fit rather than forcing their vision into inappropriate frameworks. Their design philosophy emphasizes user trust, soft boundaries, and creating "cozy" experiences that prioritize community warmth over technical complexity.

**Tools & resources**

The technical stack centers on Python with Flask/FastAPI, SQLite for data storage, and FFmpeg for media transcoding. Hosting will likely be on a small VPS like Hetzner for cost-effectiveness. The system includes asynchronous media processing to handle various upload formats while maintaining immediate post publication.
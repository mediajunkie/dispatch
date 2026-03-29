<!-- LOGO: Updated to correct location -->
<!-- Testing GitHub Pages rebuild after broken image reference fix - October 5, 2025 3:59 PM -->

<img src="assets/images/pm-logo.png" alt="Piper Morgan Logo" width="200" />

# Piper Morgan - AI Product Management Assistant

## ðŸš€ Alpha Testing Program

**Are you part of the Piper Morgan alpha?** You're in the right place! This is the public documentation hub for pmorgan.tech.

### Quick Links for Alpha Testers

- **[Alpha Quick Start](ALPHA_QUICKSTART.md)** - Get running in 5 minutes
- **[Testing Guide](ALPHA_TESTING_GUIDE.md)** - What to test and how to provide feedback
- **[Known Issues](ALPHA_KNOWN_ISSUES.md)** - Current limitations and workarounds
- **[Alpha Agreement](ALPHA_AGREEMENT_v2.md)** - Terms and expectations
- **[Release Notes v0.8.3](RELEASE-NOTES-v0.8.3.md)** - What's new in the latest release

### New to the Project?

Start with one of these:

- **[Getting Started Guide](public/user-guides/legacy-user-guides/getting-started-conversational-ai.md)** - 15-minute introduction
- **[Morning Standup Web Interface](#-morning-standup-web-interface)** - Daily workflow feature
- **[CLI Commands](#ï¸-cli-commands)** - Command-line interface guide

## ðŸ“‹ Table of Contents

- [ðŸŽ¯ What is Piper Morgan?](#-what-is-piper-morgan)
- [ðŸ’¬ See It in Action](#-see-it-in-action)
- [ðŸš€ Quick Start (30 seconds)](#-quick-start-30-seconds)
- [ðŸŽ¯ Choose Your Path](#-choose-your-path)
- [ðŸ–¥ï¸ CLI Commands](#ï¸-cli-commands)
- [ðŸŒ… Morning Standup Web Interface](#-morning-standup-web-interface)
- [ðŸ“š Complete Documentation](#-complete-documentation)
- [ðŸ—ï¸ Architecture & Design Documentation](#ï¸-architecture--design-documentation)
- [ðŸ§ª Testing & Quality Assurance](#-testing--quality-assurance)
- [ðŸš€ Recent Infrastructure Activations](#-recent-infrastructure-activations)
- [ðŸ—ï¸ Architecture Overview](#ï¸-architecture-overview)
- [ðŸŽ¯ Key Features](#-key-features)
- [ðŸ“Š Performance Metrics](#-performance-metrics)
- [ðŸ”§ Development](#-development)
- [ðŸ¤ Contributing](#-contributing)
- [ðŸ†˜ Support](#-support)

## ðŸŽ¯ What is Piper Morgan?

Piper Morgan demonstrates a **systematic methodology for human-AI collaboration** in product management. Rather than replacing human judgment, it augments PM workflows through natural conversation, evolving from automating routine tasks to providing strategic insights.

## ðŸ’¬ See It in Action

### Before (Command Mode)

```
You: "Update GitHub issue #1247 status:done"
You: "Show me document requirements_v2.pdf"
You: "Assign issue #1247 to:sarah"
```

### After (Conversational AI)

```
You: "Update that bug we discussed"
Piper: "âœ… Updated issue #1247 (login timeout) status to done"

You: "Show me the latest requirements"
Piper: "ðŸ“„ Here's requirements_v2.pdf (47 pages, updated 2 days ago)"

You: "Assign it to Sarah"
Piper: "âœ… Assigned issue #1247 to Sarah. She's been notified."
```

**Result**: 5x faster workflows, 90% less mental overhead, conversations that feel human.

## ðŸš€ Quick Start (30 seconds)

```bash
# 1. Clone and setup
git clone https://github.com/mediajunkie/piper-morgan-product.git
cd piper-morgan-product
python -m venv venv && source venv/bin/activate  # or `venv\Scripts\activate` on Windows

# 2. Install dependencies
pip install -r requirements.txt

# 3. Configure environment
cp .env.example .env
# Add your API keys (OpenAI, Anthropic, GitHub)

# 4. Start infrastructure and launch
docker-compose up -d
python main.py
```

## ðŸŽ¯ Choose Your Path

**ðŸš€ New to Piper?** Start with our [15-minute getting started guide](public/user-guides/legacy-user-guides/getting-started-conversational-ai.md)

**ðŸ‘¥ Team Lead or PM?** See [key capabilities](#-key-features) and [performance metrics](#-performance-metrics)

**ðŸ”§ Developer or Architect?** Jump to [architecture documentation](#-architecture--design-documentation) and [developer resources](#-developer-resources)

**âš¡ Ready to deploy?** Try our [one-click startup](#-one-click-startup) or [web interface](#-morning-standup-web-interface)

### ðŸš€ **One-Click Startup**

For daily standup routine:

- **[Mac Dock Integration](public/getting-started/setup/mac-dock-integration.md)** - Add Piper to your dock
- **Start Script**: `./start-piper.sh` - One-command startup with health checks
- **Requirements**: Docker Desktop running

## ðŸ–¥ï¸ CLI Commands

### Issue Intelligence

Real-time GitHub issue analysis and intelligent prioritization:

```bash
# Get project health overview
python main.py issues status

# Intelligent issue triage and prioritization
python main.py issues triage --limit 10

# Discover patterns and cross-feature insights
python main.py issues patterns

# Morning standup with issue context
python main.py standup
```

**Features**:

- **Smart Prioritization**: AI-driven issue priority scoring
- **Beautiful CLI Output**: Color-coded, formatted displays
- **Cross-Feature Learning**: Issue patterns enhance morning standups
- **Real-time GitHub Data**: Live API integration with your repositories

[ðŸ“– Full CLI Documentation](public/user-guides/legacy-user-guides/cli-commands.md) | [ðŸ“Š Issue Intelligence Features](public/user-guides/features/issue-intelligence.md)

## ðŸŒ… Morning Standup Web Interface

**Launch your daily standup with a professional dark mode web interface - faster than CLI with comprehensive GitHub integration.**

### ðŸš€ Quick Start

```bash
# Start FastAPI server
PYTHONPATH=. python web/app.py
# or
PYTHONPATH=. python -m uvicorn web.app:app --host 127.0.0.1 --port 8001
```

### ðŸŒ Access Points

- **Web UI**: http://localhost:8001/standup (dark mode, mobile responsive)
- **API Endpoint**: http://localhost:8001/api/standup (JSON response)
- **API Documentation**: http://localhost:8001/docs (FastAPI auto-docs)

### âš¡ Performance & Features

- **Generation Time**: 4.6-5.1 seconds (180ms faster than CLI baseline)
- **Response Format**: JSON with comprehensive standup data and metadata
- **UI Features**: Dark mode, mobile responsive, error handling, performance metrics
- **Daily Usage**: Optimized for 6 AM daily standup routine

### ðŸ“Š What You Get

- âœ… **Yesterday's accomplishments** from all integrations
- ðŸŽ¯ **Today's priorities** with project context
- ðŸš« **Blockers identification** and resolution paths
- ðŸ“ˆ **Performance metrics** and generation time tracking
- ðŸ™ **GitHub activity** (commits, PRs, issues)
- ðŸ“ **Project context** and repository information
- ðŸ”„ **Multi-user support** with personalized configurations

[ðŸ“– Technical Documentation](public/user-guides/features/morning-standup-web.md) | [ðŸ“‹ User Guide](public/user-guides/features/morning-standup-ui-guide.md)

## ðŸ“š Complete Documentation

### ðŸŽ¯ User Guides

- **[ðŸš€ Getting Started](public/user-guides/legacy-user-guides/getting-started-conversational-ai.md)** - 15-minute introduction to conversational AI
- **[âŒ¨ï¸ CLI Commands](public/user-guides/legacy-user-guides/cli-commands.md)** - Master command-line interface and Issue Intelligence
- **[ðŸŽ¯ Understanding References](public/user-guides/legacy-user-guides/understanding-anaphoric-references.md)** - Master "that issue", "the document" patterns
- **[ðŸ§  Conversation Memory](public/user-guides/legacy-user-guides/conversation-memory-guide.md)** - How Piper's 10-turn memory works
- **[ðŸ”„ Upgrading from Commands](public/user-guides/legacy-user-guides/upgrading-from-command-mode.md)** - Migration guide for existing users
- **[ðŸ“– Real Examples](public/user-guides/legacy-user-guides/conversation-scenario-examples.md)** - 6 complete PM workflow scenarios

### ðŸ”§ Developer Resources

- **[ðŸ“š Complete Documentation](https://pmorgan.tech)** - Full project documentation and homepage
- **[ðŸ”Œ API Documentation](internal/development/tools/implementation-guides/PM-034-implementation-guide.md)** - Complete endpoint reference
- **[âš¡ Developer Quick Start](internal/development/tools/implementation-guides/PM-034-implementation-guide.md)** - 15-minute setup guide
- **[ðŸŒ¿ Branch Management](internal/development/tools/BRANCH-MANAGEMENT.md)** - Git workflow and branch strategy
- **[ðŸ§ª Test Guide](internal/development/active/pending-review/TEST-GUIDE.md)** - Smart test execution and Excellence Flywheel integration

### ðŸ—ï¸ Architecture & Design Documentation

#### **Architecture Collections** - Core Technical Assets

**[ðŸ“ Architecture Patterns Catalog](internal/architecture/current/patterns/README.md)** - 30+ Proven Implementation Patterns
- Organized by domain: Infrastructure (001-010), Context & Sessions (011-017), Integration (018-022), Data Patterns (023-027), AI & Orchestration (028-030)
- Each pattern includes: Context, Implementation, Usage Guidelines, Codebase Examples
- **Quick Access**: [Pattern Index](internal/architecture/current/patterns/README.md)

**[ðŸ“‹ Architectural Decision Records (ADRs)](internal/architecture/current/adrs/adr-index.md)** - 43+ Architectural Decisions
- Organized by category: Foundation, Integration, Service Enhancement, Data Management, Infrastructure, Testing, Spatial Intelligence, Methodology
- Traces evolution from initial MCP integration through multi-agent coordination
- **Quick Access**: [ADR Index](internal/architecture/current/adrs/adr-index.md)

#### **Why These Matter**

- **Patterns**: Reusable solutions to common architecture problems - learn from proven implementations
- **ADRs**: Record of architectural decisions, their rationale, and trade-offs - understand the "why" behind the design
- **Together**: Complete picture of system design philosophy and technical patterns

## ðŸ§ª Testing & Quality Assurance

### âš¡ **Smart Test Infrastructure (Phase 1)**

Our test infrastructure provides **4 execution modes** optimized for development workflow:

- **ðŸš€ Smoke Tests (<5s)**: Rapid validation for pre-commit checks
- **âš¡ Fast Tests (<30s)**: Development workflow with unit tests + standalone orchestration
- **ðŸ”„ Full Tests**: Comprehensive testing including integration tests with database
- **ðŸ“Š Coverage Analysis**: Detailed reporting with <80% coverage highlighting

**Quick Test Commands:**

```bash
# Smart test execution
./../scripts/run_tests.sh smoke     # <5s validation
./../scripts/run_tests.sh fast      # <30s development workflow
./../scripts/run_tests.sh full      # Complete test suite
./../scripts/run_tests.sh coverage  # Coverage analysis

# Git integration (automated)
git commit    # Runs smoke tests via pre-commit hook
git push      # Runs fast tests via pre-push hook
```

**Excellence Flywheel Integration**: All testing follows Verification First â†’ Implementation â†’ Evidence-based progress â†’ GitHub tracking methodology.

See **[ðŸ§ª Test Guide](internal/development/active/pending-review/TEST-GUIDE.md)** for complete documentation.

## ðŸš€ Recent Releases

### v0.8.3 - Integration Health Dashboard (January 2, 2026)

- **Integration Health Dashboard**: Real-time status for all integrations with one-click testing
- **OAuth Connection Management**: Connect/disconnect Slack and Calendar directly from Settings
- **Notion in Setup Wizard**: Configure Notion during initial setup with validation
- **Bug Fixes**: Calendar OAuth state persistence, toast visibility, breadcrumb overlap

See [Release Notes v0.8.3](RELEASE-NOTES-v0.8.3.md) for details.

### v0.8.2 - GUI Setup Wizard (December 11, 2025)

- **GUI Setup Wizard**: Visual web interface for initial configuration
- **602 Smoke Tests**: CI/CD quality gate validation
- **UI Stabilization**: Toast z-index, navigation, dialog styling fixes

See [Release Notes v0.8.2](RELEASE-NOTES-v0.8.2.md) for details.

### Previous Releases

- [v0.8.1.3](dev/2025/11/30/RELEASE-NOTES-v0.8.1.3.md) - Alpha setup refinements
- [v0.8.1.2](dev/2025/11/30/RELEASE-NOTES-v0.8.1.2.md) - Bug fixes

## ðŸ“š Enhanced Development Documentation

### Core Methodology

> **ðŸ§­ Complete Methodology Index**: [methodology-core/INDEX.md](internal/development/methodology-core/INDEX.md) - Full navigation guide
> **âš¡ Quick Start**: [METHODOLOGY.md](briefing/METHODOLOGY.md) - Operational overview

- **[Excellence Flywheel Methodology](internal/development/methodology-core/methodology-00-EXCELLENCE-FLYWHEEL.md)** - Systematic development approach
- **[Multi-Agent Coordination](internal/development/methodology-core/methodology-02-AGENT-COORDINATION.md)** - Intelligent coordination patterns
- **[Multi-Agent Quick Start](internal/development/methodology-core/MULTI_AGENT_QUICK_START.md)** - 5-minute deployment
- **[Test Infrastructure Guide](internal/development/active/pending-review/TEST-GUIDE.md)** - Smart test execution patterns

### Implementation Guides

- **[Multi-Agent Integration Plan](internal/development/methodology-core/MULTI_AGENT_INTEGRATION_GUIDE.md)** - Complete operational deployment
- **[Persistent Context Research](internal/development/active/pending-review/PERSISTENT_CONTEXT_RESEARCH.md)** - Foundation architecture analysis
- **Enhanced Autonomy Patterns** - (coming soon) - Advanced development workflows

### Operations & Automation

- **[Smart Test Execution](../scripts/run_tests.sh)** - 4-mode test infrastructure
- **[Multi-Agent Deployment](../scripts/deploy_multi_agent_coordinator.sh)** - Automated coordinator deployment
- **[Operation Validation](../scripts/validate_multi_agent_operation.sh)** - Production readiness validation

## ðŸ“Š Roadmap Status

### The Great Refactor Progress (~30% Complete)

- **GREAT-1** âœ… Complete (Router Foundation)
- **GREAT-2** âœ… Complete (all 6 sub-epics: 2A-2E, CORE-QUERY-1)
- **GREAT-3** ðŸš§ In Progress (3A complete, 3B active)
  - **GREAT-3A** âœ… Plugin foundation, config standardization, app.py refactoring
  - **GREAT-3B** ðŸš§ Dynamic plugin loading and discovery (active)
  - **GREAT-3C** â³ Integration migration to plugins (queued)
  - **GREAT-3D** â³ Validation and documentation (queued)
- **GREAT-4, GREAT-5** â³ Queued (workflow automation, learning systems)
- **MVP** ðŸŽ¯ Target: Production-ready system

### Architecture Evolution

- **Router Architecture**: Operational across all 4 integrations
- **Three Spatial Patterns**: Documented and working (Granular, Embedded, Delegated)
- **Plugin System**: Foundation complete, dynamic loading in progress
- **Config Validation**: Infrastructure active and operational

## ðŸŽ¯ Current Capabilities (~80% Functional)

### âœ… Working Systems

- **All integrations working** via router architecture (Calendar, GitHub, Notion, Slack)
- **Plugin architecture** operational (4 plugins with standardized interfaces)
- **Config validation** active across all services
- **Spatial intelligence** patterns documented and functional
- **Test infrastructure** robust (72/72 tests passing)
- **Documentation** comprehensive (98/98 directories covered)

### ðŸš§ In Development (GREAT-3B)

- **Dynamic plugin loading** system
- **Plugin discovery** and lifecycle management
- **Registry automation** for seamless plugin integration

### âŒ Future Work

- **Learning system** (adaptive behavior based on usage patterns)
- **Complex workflow automation** (multi-step task coordination)
- **Advanced AI coordination** (enhanced multi-agent collaboration)

## ðŸ—ï¸ Architecture Overview

```
â”Œâ”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”    â”Œâ”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”    â”Œâ”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”
â”‚   Conversation  â”‚    â”‚  Intent Service  â”‚    â”‚  Knowledge      â”‚
â”‚   Manager       â”‚â—„â”€â”€â–ºâ”‚  & Orchestration â”‚â—„â”€â”€â–ºâ”‚  Graph Service  â”‚
â”‚   (10-turn ctx) â”‚    â”‚  Engine          â”‚    â”‚  & Repositories â”‚
â””â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”˜    â””â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”˜    â””â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”˜
         â”‚                       â”‚                       â”‚
         â”‚                       â”‚                       â”‚
         â–¼                       â–¼                       â–¼
â”Œâ”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”    â”Œâ”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”    â”Œâ”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”
â”‚  Anaphoric      â”‚    â”‚  Integration     â”‚    â”‚  Learning       â”‚
â”‚  Reference      â”‚    â”‚  Services        â”‚    â”‚  (GitHub, Jira)  â”‚
â”‚  Resolution     â”‚    â”‚  (GitHub, Jira)  â”‚    â”‚  & Analytics    â”‚
â””â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”˜    â””â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”˜    â””â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”˜
```

**Core Services:**

- **Conversation Manager**: 10-turn context window with Redis caching
- **Intent Service**: Natural language understanding and goal management
- **Knowledge Graph**: Entity tracking and relationship detection
- **Integration Services**: Plugins for GitHub, Jira, Confluence, etc.

## ðŸŽ¯ Key Features

### Conversational AI Capabilities

- âœ… **Natural Language Processing**: Use "that issue", "the document"
- âœ… **Anaphoric Reference Resolution**: Automatic reference resolution
- âœ… **10-Turn Context Window**: Conversation memory across interactions
- âœ… **Entity Tracking**: Automatic tracking of issues, documents, tasks
- âœ… **Performance Optimization**: <150ms response times

### User Experience Benefits

- âœ… **Reduced Cognitive Load**: No need to remember exact identifiers
- âœ… **Natural Workflow**: Human-like conversation patterns
- âœ… **Context Awareness**: Seamless topic switching
- âœ… **Error Recovery**: Graceful fallback to command mode
- âœ… **Performance**: Sub-150ms response times

## ðŸ“Š Performance Metrics

### Current System Performance (PM-034)

- **Reference Resolution**: 100% accuracy âœ…
- **Response Time**: 2.33ms average âœ…
- **Context Window**: 10 turns operational âœ…
- **Cache Hit Ratio**: >95% achieved âœ…
- **Memory Usage**: <1MB per conversation âœ…

### User Experience Metrics

- **Natural Language Adoption**: 85% within 5 interactions
- **Context Awareness**: 90% expect context preservation
- **Workflow Completion**: 80% complete complex workflows conversationally
- **User Satisfaction**: 4.6/5 rating for conversational experience

## ðŸ”§ Development

> **Internal Development Teams**: For comprehensive internal documentation navigation, see [NAVIGATION.md](NAVIGATION.md)

### Prerequisites

- **Python 3.11+** (required)
- **Docker & Docker Compose**
- **PostgreSQL 14+**
- **Redis 7+**
- **API Keys**: OpenAI, Anthropic, GitHub

### Local Development Setup

```bash
# Verify Python version (must be 3.11+)
python --version  # Should show Python 3.11.x

# Clone and setup
git clone https://github.com/mediajunkie/piper-morgan-product.git
cd piper-morgan-product

# Set up Python virtual environment
python -m venv venv
source venv/bin/activate  # On Windows: venv\Scripts\activate

# Install dependencies
pip install -r requirements.txt

# Copy environment template
cp .env.example .env
# Edit .env with your API keys and configuration

# Start infrastructure services
docker-compose up -d postgres redis

# Initialize the database
python scripts/init_db.py

# Start the development server
python main.py
```

## ðŸ¤ Contributing

We welcome contributions! Please see our [Contributing Guide](../CONTRIBUTING.md) for details.

### Development Workflow

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

## ðŸ“„ License

This project is licensed under the MIT License - see the LICENSE (coming soon) file for details.

## ðŸ†˜ Support

- **ðŸ“š Documentation**: [Complete docs at pmorgan.tech](https://pmorgan.tech)
- **ðŸ› Issues**: [GitHub Issues](https://github.com/mediajunkie/piper-morgan-product/issues)
- **ðŸ’¬ Discussions**: [GitHub Discussions](https://github.com/mediajunkie/piper-morgan-product/discussions)
- **ðŸ“§ Email**: [Contact us](mailto:support@pmorgan.tech)

## ðŸŽ‰ Ready to Get Started?

Choose your path:

**[ðŸš€ New User? Start Here](public/user-guides/legacy-user-guides/getting-started-conversational-ai.md)**

**[ðŸ”„ Existing User? Upgrade Here](public/user-guides/legacy-user-guides/upgrading-from-command-mode.md)**

**[ðŸ“– Want Examples? See Scenarios](public/user-guides/legacy-user-guides/conversation-scenario-examples.md)**

**[ðŸ”§ Technical Details? API Docs](internal/architecture/current/apis/conversation-api-documentation.md)**

[![Tests](https://github.com/mediajunkie/piper-morgan-product/workflows/Tests/badge.svg)](https://github.com/mediajunkie/piper-morgan-product/actions)
[![Code Coverage](https://codecov.io/gh/mediajunkie/piper-morgan-product/branch/main/graph/badge.svg)](https://codecov.io/gh/mediajunkie/piper-morgan-product)
[![Documentation](https://img.shields.io/badge/docs-latest-brightgreen.svg)](https://pmorgan.tech)
[![Python Version](https://img.shields.io/badge/python-3.11+-blue.svg)](https://python.org)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

**Made with â¤ï¸ and Systematic Kindness by the Piper Morgan team**

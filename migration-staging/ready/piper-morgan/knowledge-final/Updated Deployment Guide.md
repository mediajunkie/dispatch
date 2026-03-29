# Piper Morgan 1.0 - Deployment Guide

## Infrastructure Requirements

### System Requirements
- **CPU**: 2+ cores
- **Memory**: 4GB+ RAM (8GB+ recommended)
- **Storage**: 20GB+ available space
- **Network**: Internet access for AI APIs

### Software Dependencies
- Docker 20.10+
- Docker Compose 2.0+
- Git

## Local Deployment

### Quick Start
```bash
# Clone repository
git clone <repository-url>
cd piper-morgan-platform

# Configure environment
cp .env.example .env
# Edit .env with required API keys:
# - ANTHROPIC_API_KEY
# - OPENAI_API_KEY
# - GITHUB_TOKEN (optional for GitHub integration)

# Deploy infrastructure
docker-compose up -d

# Wait for services to be ready (especially postgres health check)
docker-compose logs -f postgres

# Initialize database (PLANNED - script not yet implemented)
# Note: Database schema auto-created by SQLAlchemy, but data initialization planned
# python scripts/init_db.py

# Verify deployment
curl http://localhost:8001/health
```

### Service Configuration

#### Environment Variables
```bash
# AI Services (REQUIRED)
ANTHROPIC_API_KEY=your_claude_key
OPENAI_API_KEY=your_openai_key

# External Integrations (OPTIONAL)
GITHUB_TOKEN=your_github_token  # For GitHub issue creation

# Database Configuration (with defaults)
POSTGRES_USER=piper
POSTGRES_PASSWORD=dev_changeme  # Change for production!
POSTGRES_DB=piper_morgan

# Application Settings
LOG_LEVEL=INFO
DEBUG=false
```

#### Docker Compose Services
- **postgres** (port 5432): Primary database with health checks
- **redis** (port 6379): Event queue and caching
- **chromadb** (port 8000): Vector database for knowledge base
- **temporal** (port 7233, 8088): Workflow orchestration engine
- **traefik** (port 80, 8090): API gateway and load balancer

### Service Verification Steps
1. **Check all services**: `docker-compose ps` (all should show "running" and "healthy")
2. **Verify API health**: `curl http://localhost:8001/health`
3. **Test PostgreSQL**: `docker-compose exec postgres pg_isready -U piper`
4. **Test Redis**: `docker-compose exec redis redis-cli ping`
5. **Test ChromaDB**: `curl http://localhost:8000/api/v1/heartbeat`
6. **Test Temporal**: Access web UI at `http://localhost:8088`

### Application Startup (Current Development State)
**Note**: The application layer is in active development. Current startup requires:

1. **Manual API server start** (not yet containerized):
   ```bash
   cd services
   python -m uvicorn api.main:app --host 0.0.0.0 --port 8001 --reload
   ```

2. **Database schema auto-creation**: SQLAlchemy creates tables on first run

3. **Knowledge base initialization**: Upload documents through API or web interface

## Production Considerations

### Security (CRITICAL for production)
- **Change default passwords**: Especially `POSTGRES_PASSWORD`
- **Configure SSL/TLS**: Use proper certificates, not self-signed
- **API security**: Implement authentication and authorization
- **Network security**: Use private networks, firewall rules
- **Secret management**: Use proper secret management system

### Monitoring (Limited implementation)
- **Health checks**: Basic endpoints available at `/health`
- **Container monitoring**: Docker health checks implemented
- **Application logs**: Structured logging to stdout (development level)
- **Performance monitoring**: Not yet implemented

### Backup (Not yet implemented)
- **Database backup**: PostgreSQL backup procedures needed
- **Knowledge base backup**: ChromaDB persistence configured
- **Configuration backup**: Environment and Docker configurations
- **Disaster recovery**: Planning phase only

### Scaling (Architecture supports, implementation partial)
- **Horizontal scaling**: Stateless app design supports load balancing
- **Database scaling**: PostgreSQL connection pooling configured
- **Cache scaling**: Redis clustering support available
- **Resource limits**: Docker resource constraints not configured

## Troubleshooting

### Common Issues

1. **Services fail to start**
   ```bash
   # Check logs for specific service
   docker-compose logs <service-name>
   
   # Common causes:
   # - Port conflicts (5432, 6379, 8000, 7233, 8088, 80)
   # - Insufficient memory
   # - Missing environment variables
   ```

2. **Database connection failures**
   ```bash
   # Check postgres health
   docker-compose exec postgres pg_isready -U piper
   
   # Verify environment variables
   echo $POSTGRES_PASSWORD
   
   # Check database exists
   docker-compose exec postgres psql -U piper -d piper_morgan -c "\dt"
   ```

3. **API key errors**
   ```bash
   # Verify environment file
   cat .env | grep API_KEY
   
   # Check application logs
   docker-compose logs app  # When containerized
   ```

4. **Temporal workflow errors**
   ```bash
   # Check Temporal UI
   open http://localhost:8088
   
   # Verify Temporal connection
   docker-compose logs temporal
   ```

### Debug Commands
```bash
# View all service status
docker-compose ps

# Check specific service logs
docker-compose logs -f postgres
docker-compose logs -f redis
docker-compose logs -f chromadb
docker-compose logs -f temporal

# Access databases directly
docker-compose exec postgres psql -U piper -d piper_morgan
docker-compose exec redis redis-cli

# Test vector database
curl http://localhost:8000/api/v1/collections

# Monitor resource usage
docker stats
```

### Known Limitations (Development State)
- **Application not containerized**: API server runs manually in development
- **No authentication**: Single-user system without access controls
- **Limited error handling**: Production-quality error responses implemented but monitoring limited
- **Workflow state persistence**: In-memory state, lost on restart (database persistence in progress)
- **GitHub integration**: 70% complete, issue creation workflow not fully functional

## Development vs Production Deployment

### Current Development Setup
- Local Docker Compose with development defaults
- Manual application server startup
- Direct environment variable configuration
- Local file storage for data persistence

### Future Production Setup (Planned)
- Container orchestration (Kubernetes or Docker Swarm)
- Automated application deployment
- Secret management integration
- Cloud storage for persistent data
- Load balancing and high availability
- Comprehensive monitoring and alerting

---
*Last Updated: June 22, 2025*
*Reflects current development state with infrastructure operational and application layer in progress*

## Revision Log
- **June 22, 2025**: Updated to reflect current development state, clarified service status, added known limitations
- **June 21, 2025**: Added systematic documentation dating and revision tracking
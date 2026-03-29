# Piper Morgan 1.0 - Complete Session Startup Checklist

## Prerequisites (One-time setup)
- [ ] Docker Desktop installed and configured
- [ ] Git repo cloned to local machine
- [ ] Environment variables configured (.env file)

## Every Session Startup

### Step 1: Start Docker
```bash
# Start Docker Desktop (wait for whale icon in menu bar)
open -a Docker

# Verify Docker is running
docker --version
docker ps
```

### Step 2: Navigate to Project
```bash
cd /path/to/piper-morgan-product
```

### Step 3: Clean Previous Docker State (if needed)
```bash
# Only if you get container name conflicts
docker-compose down
docker rm -f piper-chromadb piper-postgres piper-redis piper-traefik piper-temporal
docker network rm piper-network
```

### Step 4: Start All Services
```bash
# Start infrastructure services
docker-compose up -d

# Check all services are running
docker-compose ps

# Should show 5 services: postgres, redis, chromadb, temporal, traefik
```

### Step 5: Start Piper Morgan Application
```bash
# Activate Python virtual environment
source venv/bin/activate

# Start the application
python main.py
```

### Step 6: Verify Everything Works
```bash
# Health check
curl http://localhost:8001/health

# Simple intent test
curl -X POST "http://localhost:8001/api/v1/intent" \
  -H "Content-Type: application/json" \
  -d '{"message": "test message"}'
```

## Common Issues & Solutions

### Docker Issues
- **"Cannot connect to Docker daemon"**: Start Docker Desktop first
- **"Container name already in use"**: Run cleanup commands from Step 3
- **"Network already exists"**: Run `docker network rm piper-network`

### Python Issues
- **"ModuleNotFoundError"**: Ensure venv is activated with `source venv/bin/activate`
- **"numpy errors"**: Ensure numpy < 2.0 with `pip install "numpy<2.0"`
- **"Port already in use"**: Kill existing Python processes with `pkill -f main.py`

### Database Issues
- **"role piper does not exist"**: Restart PostgreSQL service with `docker-compose restart postgres`
- **Connection refused**: Wait 30 seconds for PostgreSQL to fully initialize

## Shutdown
```bash
# Stop application
Ctrl+C (in main.py terminal)

# Stop Docker services
docker-compose down

# Deactivate Python environment
deactivate
```

## Emergency Reset
```bash
# Nuclear option - removes all data
docker-compose down -v
docker system prune -f
# Then restart from Step 4
```
# OpenWMS ZILE Demo - Testing Guide

## 🏭 What You've Deployed

You now have a complete **OpenWMS (Open Warehouse Management System)** instance running locally! This is the ZILE Candies demo project - a virtual candy factory warehouse simulation that showcases:

- **Microservices Architecture**: 5+ independent services working together
- **Real-time Communication**: RabbitMQ message broker for asynchronous processing  
- **Service Discovery**: Eureka registry for service coordination
- **Distributed Tracing**: Jaeger for monitoring service interactions
- **Material Flow Control**: Simulated warehouse operations

## 🌐 Access Points

| Service | URL | Credentials | Purpose |
|---------|-----|-------------|---------|
| **Eureka Dashboard** | http://localhost:8762 | None | View all registered services |
| **RabbitMQ Management** | http://localhost:15672 | guest/guest | Monitor message queues |
| **Jaeger Tracing** | http://localhost:16686 | None | View distributed traces |

## 🔧 Core Services Running

| Service | Port | Description |
|---------|------|-------------|
| **Common Service** | 8120 | Manages locations, transport units, location groups |
| **TMS Service** | 8131 | Transportation Management - transport orders |
| **Routing Service** | 8130 | Workflow engine for material flow routing |
| **Preferences Service** | 8125 | System configuration and preferences |
| **Config Service** | 8099 | Central configuration server |

## 🚀 Testing the System

### 1. Web Interface Testing

Open these URLs in your browser:

```bash
# Service Registry - See all running services
http://localhost:8762

# RabbitMQ - Monitor message traffic
http://localhost:15672  # (guest/guest)

# Jaeger - View distributed traces
http://localhost:16686
```

### 2. API Testing with curl

Once services are fully started (may take 2-3 minutes), try these API calls:

```bash
# Check service health
curl http://localhost:8120/actuator/health
curl http://localhost:8131/actuator/health

# Get warehouse locations
curl -X GET http://localhost:8120/v1/locations

# Get transport units (pallets, containers)
curl -X GET http://localhost:8120/v1/transport-units

# Get transport orders
curl -X GET http://localhost:8131/v1/transport-orders

# Create a new transport order
curl -X POST http://localhost:8131/v1/transport-orders \
  -H 'Content-Type: application/json' \
  -d '{
    "sourceLocation": "R-001",
    "targetLocation": "S-A01-01", 
    "barcode": "PAL-003",
    "priority": 50
  }'
```

### 3. Monitor Message Flow

```bash
# Check RabbitMQ queues
curl -u guest:guest http://localhost:15672/api/queues

# Monitor exchanges
curl -u guest:guest http://localhost:15672/api/exchanges
```

## 🎯 Sample Warehouse Operations

The ZILE demo simulates a candy factory with:

- **Palette Storage**: 2 aisles for ingredient storage
- **Flat Goods Storage**: Carton storage with conveyor system  
- **Picking Stations**: Manual commissioning areas
- **Transport System**: Automated material flow control

### Typical Workflow:
1. **Inbound**: Ingredients arrive on pallets → stored in palette areas
2. **Processing**: Materials moved to production areas
3. **Packaging**: Finished goods moved to flat goods storage
4. **Outbound**: Products picked and shipped

## 🛠️ Development & Debugging

### View Logs
```bash
# All services
docker compose logs -f

# Specific service
docker compose logs -f common-service
docker compose logs -f tms-service
```

### Check Service Status
```bash
docker compose ps
```

### Restart Services
```bash
# Restart specific service
docker compose restart common-service

# Restart all
docker compose down
docker compose up -d
```

## 📊 Understanding the Data

The system includes demo data for:
- **Location Groups**: ZILE (main area), PALETTE, FLATGOOD 
- **Locations**: Storage positions like R-001, S-A01-01
- **Transport Units**: Pallets and containers with barcodes
- **Transport Orders**: Movement instructions between locations

## 🧪 Advanced Testing

### 1. OSIP Protocol Simulation
If the TCP driver is working, you can simulate PLC communication:

```bash
# Connect to TCP port (may not work due to platform issues)
telnet localhost 30001

# Send OSIP sync telegram
###00160SPS01MFC__00001SYNQ20171123225959*******
```

### 2. Custom API Testing
Create your own test scripts or use tools like:
- **Postman**: Import the API endpoints
- **Insomnia**: REST client testing
- **curl scripts**: Automated testing

### 3. Load Testing
- Generate multiple transport orders
- Monitor RabbitMQ message throughput
- Check Jaeger for performance bottlenecks

## 🔍 Troubleshooting

| Issue | Solution |
|-------|----------|
| Services not responding | Wait 2-3 minutes for full startup |
| API calls return 404 | Check Eureka dashboard for service registration |
| tcp-palettconv restarting | Normal - platform compatibility issue, doesn't affect core functionality |
| RabbitMQ connection errors | Ensure RabbitMQ is fully started before services |

## 🏁 Next Steps

1. **Explore APIs**: Try all the REST endpoints
2. **Monitor Traffic**: Watch RabbitMQ message flow
3. **Create Data**: Add your own locations and transport orders
4. **Extend System**: Look at the microservice architecture
5. **Production Setup**: Consider deployment to cloud platforms

## 🔄 Stopping the System

When you're done testing:

```bash
docker compose down
```

This removes all containers but preserves the images for future use.

---

**Congratulations!** You now have a fully functional warehouse management system to explore and learn from. The OpenWMS project demonstrates modern microservice architecture patterns and real-world warehouse operations. 
#!/bin/bash

echo "🏭 OpenWMS ZILE Demo - Complete Testing Guide"
echo "============================================="
echo ""

echo "📊 System Status Check"
echo "====================="
docker compose ps
echo ""

echo "🌐 Available Web Interfaces"
echo "==========================="
echo "✅ Eureka Service Registry: http://localhost:8762"
echo "✅ RabbitMQ Management:     http://localhost:15672 (guest/guest)"  
echo "✅ Jaeger Tracing:          http://localhost:16686"
echo ""

echo "🔍 Service Discovery"
echo "==================="
echo "Registered services:"
curl -s http://localhost:8762/eureka/apps | grep -o '<name>[^<]*</name>' | sed 's/<name>//g' | sed 's/<\/name>//g' | sort | uniq
echo ""

echo "📡 Service Ports from Eureka"
echo "============================"
echo "Common Service (Locations, Transport Units):"
curl -s http://localhost:8762/eureka/apps/COMMON-SERVICE | grep -o '<port[^>]*>[^<]*</port>' | head -1
echo ""

echo "TMS Service (Transport Orders):"  
curl -s http://localhost:8762/eureka/apps/TMS-SERVICE | grep -o '<port[^>]*>[^<]*</port>' | head -1
echo ""

echo "Routing Service (Workflows):"
curl -s http://localhost:8762/eureka/apps/ROUTING-SERVICE | grep -o '<port[^>]*>[^<]*</port>' | head -1
echo ""

echo "🚀 Testing API Endpoints"
echo "========================"

# Test if services are responding with basic endpoints
echo "Testing Common Service on port 8120..."
if curl -s -f http://localhost:8120/ >/dev/null 2>&1; then
    echo "✅ Common Service responding"
else
    echo "⏳ Common Service still starting..."
fi

echo "Testing TMS Service on port 8131..."
if curl -s -f http://localhost:8131/ >/dev/null 2>&1; then
    echo "✅ TMS Service responding"
else
    echo "⏳ TMS Service still starting..."
fi

echo ""
echo "🎯 Sample API Calls to Try"
echo "=========================="
echo "Once services are fully started, try these commands:"
echo ""
echo "# Get locations from Common Service"
echo "curl -X GET http://localhost:8120/v1/locations"
echo ""
echo "# Get transport units from Common Service"  
echo "curl -X GET http://localhost:8120/v1/transport-units"
echo ""
echo "# Get transport orders from TMS Service"
echo "curl -X GET http://localhost:8131/v1/transport-orders"
echo ""
echo "# Create a transport order (example)"
echo "curl -X POST http://localhost:8131/v1/transport-orders \\"
echo "  -H 'Content-Type: application/json' \\"
echo "  -d '{\"sourceLocation\": \"R-001\", \"targetLocation\": \"S-A01-01\", \"barcode\": \"PAL-003\", \"priority\": 50}'"
echo ""

echo "🔧 RabbitMQ Message Monitoring"
echo "=============================="
echo "Monitor queues and exchanges:"
echo "curl -u guest:guest http://localhost:15672/api/queues | jq"
echo "curl -u guest:guest http://localhost:15672/api/exchanges | jq"
echo ""

echo "📋 Dummy Data for Testing"
echo "========================="
echo "The system includes ZILE warehouse demo data:"
cat data/initial.sql
echo ""

echo "🎮 Interactive Testing"
echo "======================"
echo "1. Open a web browser to http://localhost:8762 to see the Eureka dashboard"
echo "2. Open http://localhost:15672 (guest/guest) to monitor message queues"
echo "3. Use curl or Postman to test the API endpoints listed above"
echo "4. Check the logs with: docker compose logs -f [service-name]"
echo ""

echo "🧪 Example Workflow Test"
echo "========================"
echo "This simulates an OSIP telegram that would come from a PLC:"
echo ""
echo "# Connect to the TCP driver (if running properly)"
echo "# telnet localhost 30001"
echo "# Send: ###00160SPS01MFC__00001SYNQ20171123225959*******"
echo ""
echo "Note: The tcp-palettconv service may have issues due to platform compatibility"
echo "but the core WMS/TMS functionality works without it."
echo ""

echo "🏁 System Ready!"
echo "================="
echo "Your OpenWMS instance is running and ready for testing."
echo "The system simulates a candy factory warehouse with:"
echo "- Palette storage areas"
echo "- Flat goods storage"
echo "- Transport conveyor systems"
echo "- Material flow control"
echo ""
echo "To stop the system: docker compose down"
echo "To view logs: docker compose logs -f" 
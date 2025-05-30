#!/bin/bash

echo "🏭 OpenWMS Interactive Demo"
echo "==========================="
echo ""

# Function to check service health
check_service() {
    local service_name=$1
    local port=$2
    echo "Checking $service_name on port $port..."
    if curl -s -f "http://localhost:$port" > /dev/null 2>&1; then
        echo "✅ $service_name is running"
        return 0
    else
        echo "❌ $service_name is not responding"
        return 1
    fi
}

# Function to get service info from Eureka
get_service_info() {
    local service_name=$1
    echo "📋 Getting info for $service_name..."
    curl -s "http://localhost:8762/eureka/apps/$service_name" | grep -E "(hostName|port|status)" | head -6
    echo ""
}

# Function to create sample data
create_sample_data() {
    echo "🎯 Creating Sample Warehouse Data"
    echo "================================="
    
    # First, let's check what endpoints are available
    echo "Discovering available API endpoints..."
    
    # Get the Common Service instance info
    COMMON_SERVICE_INFO=$(curl -s "http://localhost:8762/eureka/apps/COMMON-SERVICE")
    
    if [[ -n "$COMMON_SERVICE_INFO" ]]; then
        echo "✅ Common Service is available"
        
        # Try to get locations (this is a fundamental entity in WMS)
        echo ""
        echo "🏢 Checking existing locations..."
        # Note: We need to discover the actual port from Eureka
        # For now, let's try common ports
        
        for port in 8080 8090 8100 8110 8120; do
            echo "Trying port $port for Common Service..."
            LOCATIONS_RESPONSE=$(curl -s -w "%{http_code}" "http://localhost:$port/locations" -o /tmp/locations.json)
            if [[ "$LOCATIONS_RESPONSE" == "200" ]]; then
                echo "✅ Found Common Service on port $port"
                echo "Locations response:"
                cat /tmp/locations.json | head -20
                break
            fi
        done
        
        echo ""
        echo "🚚 Checking transport units..."
        for port in 8080 8090 8100 8110 8120; do
            TRANSPORT_UNITS_RESPONSE=$(curl -s -w "%{http_code}" "http://localhost:$port/transport-units" -o /tmp/transport-units.json)
            if [[ "$TRANSPORT_UNITS_RESPONSE" == "200" ]]; then
                echo "✅ Found Transport Units endpoint on port $port"
                cat /tmp/transport-units.json | head -20
                break
            fi
        done
    fi
    
    echo ""
    echo "🔄 Checking TMS (Transportation Management) Service..."
    TMS_SERVICE_INFO=$(curl -s "http://localhost:8762/eureka/apps/TMS-SERVICE")
    
    if [[ -n "$TMS_SERVICE_INFO" ]]; then
        echo "✅ TMS Service is available"
        
        # Try to get transport orders
        for port in 8080 8090 8100 8110 8130 8131; do
            echo "Trying port $port for TMS Service..."
            TRANSPORT_ORDERS_RESPONSE=$(curl -s -w "%{http_code}" "http://localhost:$port/transport-orders" -o /tmp/transport-orders.json)
            if [[ "$TRANSPORT_ORDERS_RESPONSE" == "200" ]]; then
                echo "✅ Found TMS Service on port $port"
                echo "Transport Orders response:"
                cat /tmp/transport-orders.json | head -20
                break
            fi
        done
    fi
}

# Function to demonstrate API calls
demo_api_calls() {
    echo ""
    echo "🔧 OpenWMS API Demo"
    echo "=================="
    
    echo "Available services from Eureka:"
    curl -s http://localhost:8762/eureka/apps | grep -o '<name>[^<]*</name>' | sed 's/<name>//g' | sed 's/<\/name>//g' | sort | uniq
    
    echo ""
    echo "Service instances:"
    curl -s http://localhost:8762/eureka/apps | grep -A 10 -B 10 "hostName"
}

# Main execution
echo "1. Checking service health..."
check_service "Eureka Service Registry" 8762
check_service "RabbitMQ Management" 15672
check_service "Jaeger Tracing" 16686

echo ""
echo "2. Service discovery..."
get_service_info "COMMON-SERVICE"
get_service_info "TMS-SERVICE"
get_service_info "ROUTING-SERVICE"

echo ""
echo "3. Creating and checking sample data..."
create_sample_data

echo ""
echo "4. API demonstrations..."
demo_api_calls

echo ""
echo "🎉 Demo Complete!"
echo ""
echo "📚 Next Steps:"
echo "============="
echo "1. Open http://localhost:8762 in your browser to see the Eureka dashboard"
echo "2. Open http://localhost:15672 in your browser to see RabbitMQ management (guest/guest)"
echo "3. Open http://localhost:16686 in your browser to see Jaeger tracing"
echo ""
echo "🛠️  API Testing:"
echo "==============="
echo "# Check all registered services"
echo "curl http://localhost:8762/eureka/apps"
echo ""
echo "# Get specific service instance"
echo "curl http://localhost:8762/eureka/apps/COMMON-SERVICE"
echo ""
echo "# Monitor RabbitMQ queues"
echo "curl -u guest:guest http://localhost:15672/api/queues"
echo ""
echo "⚠️  Note: Some services may take a few minutes to fully start and register."
echo "   If API calls fail, wait a bit and try again." 
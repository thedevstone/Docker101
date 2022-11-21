# COMMANDS FOR MANAGING SERVICES (more than container)
docker-compose config                       # Check compose file correctness
docker-compose up -d --build                # Build image, create container from image in background, run
docker-compose up -d --build service_name   # Up single service
docker-compose logs                         # Get log from services
docker-compose ps                           # List services containers
docker-compose images                       # List services images
docker-compose down                         # Stop the services
docker-compose down -v                      # Stop and delete volume    
docker-compose restart                      # Restart the services


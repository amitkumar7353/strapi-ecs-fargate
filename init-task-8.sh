#!/bin/bash

# Define base folder
BASE_DIR="Task-8/strapi-ecs-fargate"

# Create directories
mkdir -p $BASE_DIR/.github/workflows
mkdir -p $BASE_DIR/terraform/ecs
mkdir -p $BASE_DIR/strapi-app

# Create files
touch $BASE_DIR/.github/workflows/ci-cd.yml
touch $BASE_DIR/terraform/variables.tf
touch $BASE_DIR/terraform/outputs.tf
touch $BASE_DIR/terraform/provider-backend.tf
touch $BASE_DIR/terraform/ecs/ecs-cluster-service.tf
touch $BASE_DIR/terraform/ecs/task-definition.tf
touch $BASE_DIR/terraform/ecs/cloudwatch.tf
touch $BASE_DIR/strapi-app/Dockerfile
touch $BASE_DIR/README.md

echo "✅ Task-8 project structure created successfully at $BASE_DIR"


.PHONY: help docker-build docker-sh docker-rstudio docker-post-render docker-post-preview \
         post-render clean check-renv test

# Variables
DOCKER_IMAGE ?= ls-since-blog:latest
DOCKER_BUILDKIT ?= 1
PROJECT_DIR := $(shell pwd)

# Help
help:
	@echo "ZZCOLLAB Blog Post: ls_since.sh Utility"
	@echo ""
	@echo "Available targets:"
	@echo "  docker-build          Build Docker image"
	@echo "  docker-sh             Start container with shell access"
	@echo "  docker-rstudio        Start RStudio Server (localhost:8787)"
	@echo "  docker-post-render    Build image, render blog post in container"
	@echo "  docker-post-preview   Start interactive preview (localhost:8080)"
	@echo "  post-render           Render blog post (requires Quarto locally)"
	@echo "  check-renv            Validate renv configuration"
	@echo "  clean                 Remove generated files and Docker images"
	@echo "  help                  Show this help message"

# Docker build target
docker-build:
	docker build -t $(DOCKER_IMAGE) \
		--build-arg BUILDKIT_INLINE_CACHE=1 \
		-f Dockerfile .
	@echo "Docker image built: $(DOCKER_IMAGE)"

# Interactive shell in container
docker-sh: docker-build
	docker run --rm -it \
		-v "$(PROJECT_DIR):/project" \
		-w /project \
		$(DOCKER_IMAGE) \
		/bin/bash

# RStudio Server in container
docker-rstudio: docker-build
	@echo "Starting RStudio Server at http://localhost:8787"
	@echo "Username: rstudio"
	@echo "Password: (leaving blank)"
	docker run --rm -d \
		-p 8787:8787 \
		-e DISABLE_AUTH=true \
		-v "$(PROJECT_DIR):/project" \
		-w /project \
		--name ls-since-rstudio \
		$(DOCKER_IMAGE)
	@echo "Run 'docker stop ls-since-rstudio' to stop the server"

# Render blog post in container
docker-post-render: docker-build
	docker run --rm \
		-v "$(PROJECT_DIR):/project" \
		-w /project \
		$(DOCKER_IMAGE) \
		quarto render analysis/paper/index.qmd --output-dir /tmp/output && \
		cp /tmp/output/index.html analysis/paper/ || true
	@echo "Blog post rendered to analysis/paper/index.html"

# Preview blog post in container
docker-post-preview: docker-build
	docker run --rm \
		-p 8080:8080 \
		-v "$(PROJECT_DIR):/project" \
		-w /project \
		$(DOCKER_IMAGE) \
		quarto preview analysis/paper/index.qmd --host 0.0.0.0 --port 8080
	@echo "Blog preview available at http://localhost:8080"

# Local render (requires Quarto installed)
post-render:
	quarto render analysis/paper/index.qmd
	@echo "Blog post rendered to analysis/paper/index.html"

# Validate renv setup
check-renv:
	@echo "Checking renv configuration..."
	@if [ -f "renv.lock" ]; then \
		echo "✓ renv.lock found"; \
	else \
		echo "✗ renv.lock not found"; \
	fi
	@if [ -f ".Rprofile" ]; then \
		echo "✓ .Rprofile found"; \
	else \
		echo "✗ .Rprofile not found"; \
	fi
	@if [ -d "renv" ]; then \
		echo "✓ renv directory found"; \
	else \
		echo "✗ renv directory not found"; \
	fi

# Clean generated files
clean:
	@echo "Cleaning generated files..."
	rm -f analysis/paper/index.html
	rm -rf analysis/paper/*_files/
	docker rmi $(DOCKER_IMAGE) 2>/dev/null || true
	@echo "Clean complete"

# Test targets (optional for blog posts)
test:
	@echo "No automated tests configured for blog post"

# Default target
.DEFAULT_GOAL := help

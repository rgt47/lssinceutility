FROM rocker/rstudio:latest

# Install Quarto
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    quarto \
    && rm -rf /var/lib/apt/lists/*

# Copy renv infrastructure
COPY renv.lock renv.lock
COPY .Rprofile .Rprofile

# Activate renv and restore packages on R startup
RUN R --vanilla --slave -e 'renv::restore()'

# Set working directory
WORKDIR /project

# Default command
CMD ["R"]

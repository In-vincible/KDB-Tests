# Base image
FROM ubuntu:latest

# Environment variables
ENV QHOME /opt/kdb/
ENV PATH $QHOME:$PATH

# Install dependencies
RUN apt-get update && apt-get install -y \
    curl \
    unzip \
    && rm -rf /var/lib/apt/lists/*

# Copy the downloaded KDB+ file into the container
COPY l64arm.zip /opt/kdb/l64arm.zip
COPY kc.lic ${QHOME}/kc.lic

# Install KDB+
WORKDIR /opt/kdb
RUN unzip l64arm.zip && rm l64arm.zip

# Copy writer and reader scripts
COPY writer.q /opt/kdb/
COPY reader.q /opt/kdb/

# Expose default port
EXPOSE 5000

# Start KDB+ process with the q.k executable
CMD ["/opt/kdb/l64arm/q", "-p", "5000"]

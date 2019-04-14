FROM python:3.7.3

LABEL \
  maintainer="Peter Evans <mail@peterevans.dev>" \
  org.opencontainers.image.title="locust" \
  org.opencontainers.image.description="Docker image for Locust load testing tool." \
  org.opencontainers.image.authors="Peter Evans <mail@peterevans.dev>" \
  org.opencontainers.image.url="https://github.com/peter-evans/locust-docker" \
  org.opencontainers.image.vendor="https://peterevans.dev" \
  org.opencontainers.image.licenses="MIT"

# Install packages
COPY requirements.txt /tmp/
RUN pip install --requirement /tmp/requirements.txt

# Add tasks directory
COPY locust-tasks /locust-tasks

# Set the entrypoint
COPY docker-entrypoint.sh /
RUN chmod +x /docker-entrypoint.sh
ENTRYPOINT ["/docker-entrypoint.sh"]

EXPOSE 5557 5558 8089
# Use the official uv python base image (very fast, pre-configured)
FROM ghcr.io/astral-sh/uv:python3.12-bookworm-slim

# Set working directory
WORKDIR /app

# Install the StarRocks MCP server into the system Python
# We use --system because inside a container, we don't need a virtual environment
RUN uv pip install --system mcp-server-starrocks

# Expose the port
EXPOSE 8000

# Run the server
# Note: We call the module directly or use the installed binary
ENTRYPOINT ["mcp-server-starrocks"]
CMD ["--mode", "streamable-http", "--host", "0.0.0.0", "--port", "8000"]

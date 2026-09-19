FROM supercorp/supergateway:uvx

WORKDIR /app

COPY . .

RUN uv sync --frozen --no-dev

COPY railway-entrypoint.sh /usr/local/bin/slack-lists-mcp-sse
RUN chmod +x /usr/local/bin/slack-lists-mcp-sse

ENTRYPOINT ["/usr/local/bin/slack-lists-mcp-sse"]

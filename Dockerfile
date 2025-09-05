# Production Dockerfile
FROM node:20-alpine AS build

# Set working directory
WORKDIR /app

# Copy package files
COPY package*.json ./

# Install dependencies
RUN npm ci --only=production

# Copy source code
COPY . .

# Build the project
RUN npm run build

# Production stage
FROM node:20-alpine AS runtime

WORKDIR /app

# Copy built application
COPY --from=build /app/dist ./dist
COPY --from=build /app/node_modules ./node_modules
COPY package*.json ./

# Create non-root user
RUN addgroup -g 1001 -S nodejs && \
    adduser -S astro -u 1001

# Change ownership
RUN chown -R astro:nodejs /app
USER astro

# Expose port
EXPOSE 4321

# Health check
HEALTHCHECK --interval=30s --timeout=3s --start-period=5s --retries=3 \
  CMD node -e "http.request('http://localhost:4321/').on('response', () => process.exit(0)).on('error', () => process.exit(1)).end()"

# Start application
CMD ["npm", "start"]

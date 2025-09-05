# Astro Docker Template

A production-ready Astro template designed to connect with existing backend containers. Features Docker development/production environments, GitHub Actions CI/CD, and multi-backend API support.

## ✨ Features

- 🚀 **Astro** - Modern static site generator with server-side rendering
- 🐳 **Docker** - Complete containerization for development and production
- 🔧 **Multi-Backend** - Connect to WordPress, Node.js, Python, .NET and more
- 🔄 **CI/CD** - GitHub Actions workflow for automatic deployment
- 🔒 **Production Ready** - SSL, reverse proxy, and security configurations
- ⚡ **Hot Reload** - Real-time development with file watching
- 📱 **TypeScript** - Full TypeScript support

## 🚀 Quick Start

### Prerequisites
- Docker and Docker Compose
- Node.js 20+ (for local development)
- Git

### 1. Clone and Setup
```bash
git clone <your-repo-url>
cd astro-docker-template
cp .env.example .env
```

### 2. Configure Environment
Edit `.env` file with your backend URLs:
```bash
# Example configuration
WP_API_URL=http://localhost:8000/wp-json/wp/v2
NODE_API_URL=http://localhost:3001/api
BACKEND_API_URL=http://localhost:8080/api
```

### 3. Development Mode
```bash
# Start with hot reload
docker-compose -f docker-compose.dev.yml up -d

# View at http://localhost:4321
```

### 4. Production Mode
```bash
# Build and start production containers
docker-compose up -d
```

## 🏗️ Project Structure

```
astro-docker-template/
├── src/
│   ├── layouts/         # Astro layouts
│   ├── pages/           # Routes and pages
│   │   ├── index.astro  # Homepage
│   │   └── api-test.astro # API testing page
│   └── env.d.ts         # TypeScript declarations
├── public/              # Static assets
├── .github/
│   └── workflows/       # GitHub Actions
├── docker-compose.yml   # Production configuration
├── docker-compose.dev.yml # Development configuration
├── Dockerfile           # Production image
├── Dockerfile.dev       # Development image
├── astro.config.mjs     # Astro configuration
└── .env.example         # Environment variables template
```

## 🔧 Configuration

### Backend APIs
Configure your backend connections in `.env`:

| Variable | Description | Default |
|----------|-------------|---------|
| `WP_API_URL` | WordPress REST API | `http://localhost:8000/wp-json/wp/v2` |
| `NODE_API_URL` | Node.js API endpoint | `http://localhost:3001/api` |
| `BACKEND_API_URL` | Generic backend API | `http://localhost:8080/api` |
| `PYTHON_API_URL` | Python/FastAPI endpoint | `http://localhost:8001` |
| `DOTNET_API_URL` | .NET API endpoint | `http://localhost:5000` |

### Production Deployment
Configure these secrets in GitHub for automatic deployment:

| Secret | Description |
|--------|-------------|
| `VPS_HOST` | Your server IP address |
| `VPS_USER` | SSH username (e.g., `ubuntu`) |
| `VPS_SSH_KEY` | SSH private key for server access |
| `VPS_SSH_PORT` | SSH port (default: 22) |

## 🐳 Docker Commands

### Development
```bash
# Start development environment
docker-compose -f docker-compose.dev.yml up -d

# View logs
docker-compose -f docker-compose.dev.yml logs -f

# Stop development environment
docker-compose -f docker-compose.dev.yml down
```

### Production
```bash
# Start production environment
docker-compose up -d

# Update with new image
docker-compose pull && docker-compose up -d

# View logs
docker-compose logs -f astro
```

## 🚀 Deployment

### Automatic Deployment (Recommended)
1. Push to main branch
2. GitHub Actions builds and pushes Docker image
3. Deploys automatically to your VPS

### Manual Deployment
```bash
# Build image
docker build -t your-registry/your-project:latest .

# Push to registry
docker push your-registry/your-project:latest

# On server: pull and restart
docker-compose pull && docker-compose up -d
```

## 🔒 Production Setup

### 1. Traefik Reverse Proxy
This template includes Traefik configuration for:
- ✅ SSL certificates (Let's Encrypt)
- ✅ HTTP to HTTPS redirects
- ✅ Domain routing
- ✅ Load balancing

### 2. Environment Variables
Production environment variables:
```bash
DOMAIN=yourdomain.com
LETSENCRYPT_EMAIL=admin@yourdomain.com
```

### 3. Security Features
- Non-root container user
- Health checks
- Multi-stage builds
- Minimal attack surface

## 🔄 API Testing

Visit `/api-test` to test your backend connections:
- Real-time connection testing
- Status monitoring
- Error debugging

## 📝 Development Workflow

1. **Local Development**: Use `docker-compose.dev.yml` for hot reload
2. **Backend Integration**: Configure APIs in `.env`
3. **Testing**: Use `/api-test` page to verify connections
4. **Deployment**: Push to main branch for automatic deployment

## 🛠️ Customization

### Adding New APIs
1. Add environment variable to `.env.example`
2. Update `astro.config.mjs` with new variable
3. Add to `src/env.d.ts` for TypeScript support
4. Use in your Astro components

### Custom Styling
- Modify `src/layouts/Layout.astro` for global styles
- Add CSS/SCSS files to `src/styles/`
- Update color scheme in CSS custom properties

### Additional Routes
- Add `.astro` files to `src/pages/`
- Create API routes in `src/pages/api/`
- Add components in `src/components/`

## 🤝 Contributing

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Test with both development and production Docker configs
5. Submit a pull request

## 📄 License

MIT License - feel free to use this template for your projects!

## 🆘 Support

- Check the `/api-test` page for connection issues
- Review Docker logs: `docker-compose logs -f`
- Ensure backend services are running and accessible
- Verify environment variables are correctly set

---

**Happy coding with Astro and Docker!** 🚀

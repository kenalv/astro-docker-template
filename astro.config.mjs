import { defineConfig } from 'astro/config';
import node from '@astrojs/node';

// https://astro.build/config
export default defineConfig({
  output: 'server',
  adapter: node({
    mode: 'standalone'
  }),
  server: {
    host: '0.0.0.0',
    port: 4321
  },
  // Configure for different backend APIs
  vite: {
    server: {
      allowedHosts: ['localhost', '127.0.0.1'],
      watch: {
        usePolling: true,
        interval: 1000
      }
    },
    define: {
      // Environment variables for backend connections
      __BACKEND_API_URL__: JSON.stringify(process.env.BACKEND_API_URL || 'http://localhost:8080'),
      __WP_API_URL__: JSON.stringify(process.env.WP_API_URL || 'http://localhost:8000/wp-json/wp/v2'),
      __NODE_API_URL__: JSON.stringify(process.env.NODE_API_URL || 'http://localhost:3001/api'),
    }
  }
});

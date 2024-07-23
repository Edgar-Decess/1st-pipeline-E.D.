# Use a Node.js base image
FROM node:14-alpine

# Set working directory
WORKDIR /app

# Copy package.json to install dependencies
COPY package.json .

# Install dependencies
RUN npm install

# Copy index.html and any other static assets
COPY index.html .

# Expose port 82 (adjust as per your application)
EXPOSE 82

# Command to start a simple HTTP server serving index.html
CMD ["node", "-e", "const http = require('http'); const fs = require('fs'); const server = http.createServer((req, res) => { fs.readFile('index.html', (err, data) => { if (err) { res.writeHead(404); res.end(JSON.stringify(err)); return; } res.writeHead(200); res.end(data); }); }); server.listen(82); console.log('Server running at http://localhost:82/');"]


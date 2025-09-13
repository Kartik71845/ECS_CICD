# Use official Node.js runtime
FROM node:18-alpine

# Set working directory
WORKDIR /app

# Copy package.json and package-lock.json first
COPY package*.json ./

# Install Dependencies
RUN npm install

# Copy app source code
COPY . .

# Expose port
EXPOSE 3000

# Start the app
CMD ["node", "server.js"]

# Use official Node.js image
FROM node:14-alpine

# Set working directory
WORKDIR /usr/src/app

# Install dependencies
COPY package*.json ./
RUN npm install

# Copy application code
COPY . .

# Expose the app port
EXPOSE 3000

# Start the application
CMD ["node", "app.js"]


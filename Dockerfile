# Stage 1: Build the React application
FROM node:15.14.0 as build-stage

# Set the working directory to /app
WORKDIR /app

# Copy the package.json and package-lock.json files to the container
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of the application code to the container
COPY . .

# Build the React application
RUN npm run build && npm prune --production

# Stage 2: Serve the React application using Node.js
FROM node:15.14.0-alpine

# Create a non-root user to run the application
RUN addgroup -g 1001 appuser && adduser -S -u 1001 -G appuser appuser

# Set the working directory to /app
WORKDIR /app

# Copy the built React app from the previous stage
COPY --from=build-stage --chown=appuser:appuser /app/build /app

# Switch to the non-root user
USER appuser

# Create a directory for npm packages in the home directory of the user
RUN mkdir -p /home/appuser/.npm-global
ENV PATH=/home/appuser/.npm-global/bin:$PATH
ENV NPM_CONFIG_PREFIX=/home/appuser/.npm-global

# Install a simple http server to serve the React app
RUN npm install -g http-server

# Expose the port where the application will be served (default for http-server is 8080)
EXPOSE 8080

# Set the NODE_ENV to production
ENV NODE_ENV=production

# Start the http server to serve the React application
CMD ["http-server", "-p", "8080"]
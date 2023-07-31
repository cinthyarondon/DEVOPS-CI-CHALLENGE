# Use an official Node runtime as a parent image
FROM node:15 as build-stage

# Set the working directory to /app
WORKDIR /app

# Copy the package.json and package-lock.json files to the container
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of the application code to the container
COPY . .

# Build the React application
RUN npm run build

# Stage 2: Serve the React application using Node.js
FROM node:15-alpine

WORKDIR /app

# Copy the built React app from the previous stage
COPY --from=build-stage /app/build /app

# Install a simple http server to serve the React app
RUN npm install -g http-server

# Expose the port where the application will be served (default for http-server is 8080)
EXPOSE 8080

# Start the http server to serve the React application
CMD ["http-server", "-p", "8080"]
# Use the official Node.js 16 image as the base (includes Node and npm on Linux)
FROM node:16

# Set the working directory inside the container; later commands run from here
WORKDIR /app

# Copy package files first so Docker can cache the dependency install layer
COPY package*.json ./

# Install the app's dependencies listed in package.json
RUN npm install

# Copy the rest of the application source code into the container
COPY . .

# Document that the app listens on port 3000 (publishing happens in docker run)
EXPOSE 3000

# Default command that starts the app when the container launches
CMD ["npm", "start"]
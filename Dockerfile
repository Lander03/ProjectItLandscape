# Use the official Node.js image as a base
FROM node:18

# Set working directory
WORKDIR /usr/src/app

# Copy package.json and install dependencies
COPY package*.json ./
RUN npm install

# Copy the rest of the application
COPY . .

# Expose the application on port 3000
EXPOSE 3000

# Run the app
CMD ["npm", "start"]
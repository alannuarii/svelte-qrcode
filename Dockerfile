FROM node:18-alpine

WORKDIR /app

# Copy only the package.json and package-lock.json to leverage Docker cache
COPY package*.json .

# Install dependencies
RUN npm install

# Copy the rest of the application code
COPY . .

# Command to run the application
CMD ["npm", "run", "dev"]

FROM node:alpine

# Install app dependencies
# A wildcard is used to ensure both package.json AND package-lock.json are copied
COPY package*.json ./
# Production build
RUN npm ci --only=production

# TODO continue here!

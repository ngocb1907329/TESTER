FROM node:latest
WORKDIR /app
COPY . /apps
RUN npm install && npm run build
EXPOSE 3000
CMD ["node", "index.js"]
# This Dockerfile sets up a Node.js environment, installs dependencies, builds the application, and

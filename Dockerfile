FROM node:latest
WORKDIR /app
COPY . /apps
RUN npm install && npm run build
EXPOSE 3000
CMD ["node", "index.js"]


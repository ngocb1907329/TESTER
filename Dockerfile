FROM node:latest
WORKDIR /apps
COPY . /apps
RUN npm install && npm run build
EXPOSE 3000
CMD ["node", "index.js"]


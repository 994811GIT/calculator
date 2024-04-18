FROM node:19-alpine AS base
WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .
CMD npm start
FROM base AS final
RUN npm install --production
COPY . .
EXPOSE 3000
CMD ["npm", "start"]

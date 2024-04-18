FROM node:16-alpine As base
WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .
EXPOSE 3000
FROM base AS final
RUN npm install --production
COPY . .
CMD ["npm", "start"]

FROM node:16-alpine As build
WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .
RUN npm build

FROM nginx:stable-alpine
COPY --from=build /app/build /usr/share/nginx/html
COPY nginx.conf /etc/nginx/nginx.conf
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]

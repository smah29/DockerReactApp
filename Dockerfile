FROM node:16-alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

FROM nginx
#elasticbeanstalk use this port to map to outside world for incoming traffic
EXPOSE 80
COPY --from=builder /app/build /usr/share/nginx/html
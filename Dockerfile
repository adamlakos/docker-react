FROM node:alpine as something 
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

FROM nginx
EXPOSE 80
COPY --from=something /app/build /usr/share/nginx/html



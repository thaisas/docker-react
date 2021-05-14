FROM node:alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm instal
COPY --chown=node:node . .
RUN npm run build

FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html
# COPY --from=0 /app/build /usr/share/nginx/html


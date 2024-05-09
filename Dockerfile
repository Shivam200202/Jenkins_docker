FROM node:latest as builder
WORKDIR '/app'
COPY . .
RUN npm install --legacy-peer-deps
RUN npm run build

FROM nginx:latest
COPY --from=builder /app/build /usr/share/nginx/html

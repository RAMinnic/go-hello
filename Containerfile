# Stage 1: BUilding Application
FROM node:20 AS builder
WORKDIR /app
COPY . .
RUN npm install && npm run build

# Stage 2: Serve the applicaiton
FROM nginx:alpine
COPY --from=builder /app/dist /usr/share/nginx/html
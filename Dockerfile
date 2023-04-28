# stage 1

FROM node:alpine AS angular-crash-course
WORKDIR /app
COPY . .
RUN npm ci && npm run build

# stage 2

FROM nginx:alpine
COPY --from=angular-crash-course /app/dist/app-to-run-inside-docker /usr/share/nginx/html
EXPOSE 4200

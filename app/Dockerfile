# ---------- Build stage ----------
FROM node:18-alpine AS build
WORKDIR /app
# Install dependencies separately for better caching
COPY package.json package-lock.json* yarn.lock* ./
RUN if [ -f yarn.lock ]; then yarn install --frozen-lockfile; \
elif [ -f package-lock.json ]; then npm ci; \
else npm install; fi

# Copy source
COPY . .
# Build production artifacts
RUN npm run build

# ---------- Runtime stage ----------
FROM nginx:1.27-alpine
# Copy SPA-friendly nginx config
COPY nginx.conf /etc/nginx/conf.d/default.conf
# Copy build output
COPY --from=build /app/build /usr/share/nginx/html
EXPOSE 80
HEALTHCHECK --interval=30s --timeout=3s \
CMD wget -qO- http://127.0.0.1:80/ || exit 1
CMD ["nginx", "-g", "daemon off;"]

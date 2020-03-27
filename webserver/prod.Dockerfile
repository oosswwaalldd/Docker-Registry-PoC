FROM node:10-slim

# Misc
RUN alias lsd='ls -aslh'

# Folders
RUN mkdir -p /app/public

# Packages
COPY ./package*.json /app/
WORKDIR /app
RUN yarn install --production


# Sources
COPY ./dist /app/server
COPY ./public /app/public

# Express
CMD ["node", "/app/server/server.js"]
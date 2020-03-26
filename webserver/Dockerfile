FROM node:10-slim
RUN mkdir /server
WORKDIR /server
COPY package*.json /server/
RUN npm install
ENV PATH /server/node_modules/.bin:$PATH 
CMD ["npm", "run", "dev"]
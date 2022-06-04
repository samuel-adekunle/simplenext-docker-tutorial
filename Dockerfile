FROM node:alpine as build

WORKDIR "/app"

RUN npm install -g pm2

COPY package.json .
RUN npm install

COPY . .
RUN npm run build

EXPOSE 3000

USER node

CMD [ "pm2-runtime", "npm", "--", "start" ]
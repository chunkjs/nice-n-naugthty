##  image taken from https://hub.docker.com/_/node
FROM node:15

##set the working diredtory where our app will live
RUN mkdir /app/
WORKDIR /app/

##package-lock for installing node dependencies
COPY package*.json ./


# intall dependencies
RUN npm ci

## copy source files, pay attention to the dockerignore file that makes sure to ignore files when we do this
COPY . .
 ## build it on the .nextjs folder that will be created
RUN npm run build

##exposing the port used by nextjs to expose the app
EXPOSE 3000


CMD ["npm", "start"]

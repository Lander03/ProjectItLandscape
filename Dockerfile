FROM node:18

WORKDIR /usr/src/app

# Kopieer package-bestanden expliciet
COPY ./package*.json ./

# Installeer dependencies
RUN npm install

# Kopieer de rest van de app
COPY . .

EXPOSE 3000
CMD ["npm", "start"]

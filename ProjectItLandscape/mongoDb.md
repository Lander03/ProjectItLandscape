# 1 MongoDB

<p align="center">
  <img src="fotos/mongoDB/MongoDB.jpeg" width="500" style="border-radius: 15px; box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);" />
</p>

## 1.1 What is MongoDB?

MongoDB is a source-available, cross-platform, document-oriented database program. These databases ensure that your data is stored in flexible, JSON-like documents. It doesn't matter which programming language you use because MongoDB has drivers for almost every language.

MongoDB has become increasingly popular. Since its release in 2009, MongoDB has grown to become one of the most widely used NoSQL databases worldwide.

<p align="center">
  <img src="fotos/mongoDB/mongoDBArchitecture.png" width="700" style="border-radius: 15px; box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);"/>
</p>

---

## 1.2 The three main components of MongoDB

Within MongoDB, there are three very important essential components:

- **Documents** 📄  
  A document is the basic unit of data in MongoDB. It's similar to a row in SQL but more flexible, as it can store complex hierarchical data structures.

- **Collections** 📁  
  Collections are groups of documents. You can think of them as tables in SQL databases, but without a fixed schema.

- **Database** 💾  
  A database is a physical container for collections. Each database has its own set of files on the file system.

---

## 1.3 Why use MongoDB?

### ✅ Advantages

✔ **Flexible Schema** – Adapt to changing data requirements without downtime  
✔ **Scalability** – Easily scale horizontally across multiple servers  
✔ **High Performance** – Built-in support for sharding and load balancing  
✔ **Rich Queries** – Powerful query language for complex data operations

### ❌ Disadvantages

❌ **Memory Usage** – Can be memory-intensive for certain operations  
❌ **Limited Join Operations** – Not ideal for complex relationships  
❌ **Transaction Limitations** – Multi-document transactions only added in recent versions

---

<details>
<summary><strong>MongoDB Timeline</strong></summary>
<br>

| Version | Release Date   | Key Features              |
| ------- | -------------- | ------------------------- |
| 1.0     | August 2009    | Initial Release           |
| 2.0     | September 2011 | Enhanced Replication      |
| 3.0     | March 2015     | WiredTiger Storage Engine |
| 4.0     | June 2018      | ACID Transactions         |
| 5.0     | July 2021      | Time Series Support       |
| 6.0     | July 2022      | Encrypted Fields          |
| 7.0     | August 2023    | Vector Search             |
| 8.0     | October 2024   | Latest Release            |

</details>

---

# Installation and Setup of MongoDB 🛠️

## 2.1 Starting MongoDB with Docker Compose

To install MongoDb, we need to make a 'docker-compose.yml' file. That is the file that wil contain all the information about the MongoDB container that we are going to run.

```yaml

version: "3.8"

services:
  mongo:
    image: mongo:6.0
    container_name: mongodb
    restart: always
    ports:
      - 27017:27017
    environment:
      MONGO_INITDB_ROOT_USERNAME: root
      MONGO_INITDB_ROOT_PASSWORD: example
    volumes:
      - dbdata6:/data/db
  mongo-express:
    image: mongo-express
    restart: always
    ports:
      - 8081:8081
    environment:
      ME_CONFIG_MONGODB_ADMINUSERNAME: root
      ME_CONFIG_MONGODB_ADMINPASSWORD: example
      ME_CONFIG_MONGODB_SERVER: mongo # Must match MongoDB service name
    depends_on:
      - mongo

volumes:
  dbdata6:


```

- **services**: This section defines the services that will be run in the Docker containers.
- **mongodb**: This is the name of the MongoDB service.
  - **image**: Specifies the Docker image to use for MongoDB.
  - **container_name**: Sets a custom name for the MongoDB container.
  - **ports**: Maps port 27017 on the host to port 27017 in the container.
  - **environment**: Sets environment variables for MongoDB, including the root username and password.
  - **volumes**: Mounts a named volume `dbdata6` to persist MongoDB data.
- **mongo-express**: This is the name of the Mongo Express service.
  - **image**: Specifies the Docker image to use for Mongo Express.
  - **container_name**: Sets a custom name for the Mongo Express container.
  - **ports**: Maps port 8081 on the host to port 8081 in the container.
  - **environment**: Sets environment variables for Mongo Express, including the admin username and password, and the MongoDB server address.
  - **depends_on**: Ensures that the MongoDB service is started before Mongo Express.
- **volumes**: This section defines named volumes that can be used to persist data across container restarts.

## 2.2 Starting the MongoDB Container
If you did all of that correctly, you need to go to your terminal and navigate to the folder where you created the `docker-compose.yml` file. Make sure the docker Desktop is running, otherwise the commands won't work. Then run the following command:

```bash
docker-compose up -d
```
This command will start the MongoDB and Mongo Express containers in detached mode. You can check if the containers are running by executing:

```bash
docker ps
```

<p align="center">
  <img src="fotos/mongoDB/MongoDbStartCommands.png" width="700" style="border-radius: 15px; box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);"/>
</p>

# Docker Commands for MongoDB 🐳

## 3.1 Common MongoDB Commands
| Command                                 | Description                                      |
| --------------------------------------- | ------------------------------------------------ |
| `docker ps`         | Shows all the active containers with there name, ports and other things    |
| `docker stop mongodb` | Stops the MongoDB container with the name mongodb     |
| `docker start mongodb` | This is to start a stopped MongoDb container     |
| `docker restart mongodb` | This is to restart a MongoDB container     |
| `docker rm mongodb` | This command delete's a MongoDB container |
| `docker logs mongodb` | Shows the logs of the MongoDB container          |

<p align="center">
  <img src="fotos/mongoDB/DockerPs.png" width="700" style="border-radius: 15px; box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);"/>
</p>

<p align="center">
  <img src="fotos/mongoDB/DockerStop.png" width="700" style="border-radius: 15px; box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);"/>
</p>

<p align="center">
  <img src="fotos/mongoDB/DockerStart.png" width="700" style="border-radius: 15px; box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);"/>
</p>

<p align="center">
  <img src="fotos/mongoDB/DockerRestart.png" width="700" style="border-radius: 15px; box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);"/>
</p>

<p align="center">
  <img src="fotos/mongoDB/DockerRm.png" width="700" style="border-radius: 15px; box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);"/>
</p>

<p align="center">
  <img src="fotos/mongoDB/DockerLogs.png" width="700" style="border-radius: 15px; box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);"/>
</p>


# Installation of management tools 🛠️

## 4.1 Mongo Express
Mongo Express is a web-based MongoDB admin interface written in Node.js, it allows you to manage your MongoDB databases through a user friendly and easy web interface.

You can use it by adding this to your docker-compose.yml file:

```yaml
services:
  mongo-express:
    image: mongo-express
    container_name: mongo-express
    ports:
      - "8081:8081"
    environment:
      ME_CONFIG_MONGODB_ADMINUSERNAME: root
      ME_CONFIG_MONGODB_ADMINPASSWORD: example
      ME_CONFIG_MONGODB_SERVER: mongodb
    depends_on:
      - mongodb
```
And you need to make sure that the MongoDB service has an enviroment varible:
```yaml
  mongodb:
    image: mongo:6-jammy
    container_name: mongodb
    environment:
      MONGO_INITDB_ROOT_USERNAME: root
      MONGO_INITDB_ROOT_PASSWORD: example
```

After you added those to the yml, you can start the container using the command:
```bash
docker-compose up -d
```

Then, if you did all above, you can access Mongo Express by going to `http://localhost:8081` in your browser.

If you go to the localohst in your browser, you will need to login with the credentials you set in the docker-compose.yml file, which are `admin` as username and `pass` as password.


<p align="center">
  <img src="fotos/mongoDB/MongoDbLogin.png" width="700" style="border-radius: 15px; box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);"/>
</p>
<p align="center">
  <img src="fotos/mongoDB/MongoDbExpress.png" width="700" style="border-radius: 15px; box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);"/>
</p>

---

# Database Management with MongoDB 🗄️

# 5.1 Making back-ups
If you are using a Database in a project, or something else. It is always verry important to make back-ups of your database. I will explain how to do that in this section.

You can make a back-up of your database by using the `mongodump` command in the docker compose terminal. This command will create a dump of your database, which you can then use to restore your database later on.
```bash
docker exec mongodb mongodump --username root --password example --authenticationDatabase admin --out /data/backup
```
After that we will need to run 1 more command, this one is to write the dump to a folder on you own device.

```bash
docker cp mongodb:/data/backup ./backup
```

<p align="center">
  <img src="fotos/mongoDB/MongoDbDump.png" width="700" style="border-radius: 15px; box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);"/>
</p>
<p align="center">
  <img src="fotos/mongoDB/MongoDbBack.png" width="700" style="border-radius: 15px; box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);"/>
</p>
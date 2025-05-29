# 1 WordPress

<p align="center">
  <img src="fotos/WordPress/WordPress.jpg" width="700" style="border-radius: 15px; box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);"/>
</p>

---

## 1.1 Why WordPress?

I chose WordPress because I like the name. I selected one that is well known and has a large community behin it. WordPress is also one of the most popular CMS (Content Management System) in the world, it is open source so it is free to use. WordPress is also very easy to use making it user friendly for both beginner, advanced developers and individuals of small companies. 💻 Because WordPress is so popular, there are already many plugins written that you can easily use in your project compeltely for free.

WordPress also has an impressive market share it powers more than 43.5% of all websites on the internet! 🚀 This means there is always of support available if you have questions or any problems with installing or errors.

---

## 1.2 The Main Concepts of WordPress

### The Functions

WordPress offers the ability to customize page layouts from themes or custom template files. This allows you to bypass the default design of the website. There are many plugins available that provide functions like spam filters or login pages, this makes the usage much easier without knowing how to make those plugins yourself.knowledge.

WordPress also has a user management system that is build into it. This allows you to have multiple authors and administrators with different acces levels to each of them. This usage is perfect for larger websites with multiple contributors. 👥

---

### The Themes

WordPress also supports a lot of themes that can be easily installed and switched from via the Dashboard or the FTP. Themes can change the appearance and functionality of the site. You can get theme's for free, or you can pay for theme's(same with the plugins).

It is supper handy to know that there are thousands of free themes available, but there are also premium themes that often offer more features and better support. The positive side of a theme is that a good theme can make your website look professional without having to have trobbles with the code. ✨

---

### The Plugins

There are enormous amount of plugins available in the WordPress.org database. Just like the Themes, there are free and paid themes on WordPress. Some of the most popular plugins of WordPress are:

- [Elementor Website Builder](https://wordpress.org/plugins/elementor/)
- [Automatic YouTube Gallery](https://wordpress.org/plugins/automatic-youtube-gallery/)
- [Jetpack – WP Security, Backup, Speed, & Growth](https://wordpress.org/plugins/jetpack/)
- [Akismet Anti-spam: Spam Protection](https://wordpress.org/plugins/akismet/)

I also searched a bit in the plugin directory, and I found a plugin that in my opinion is super awesome:

- [the Dinosaur Game](https://wordpress.org/plugins/dinosaur-game/)

---

### The Widgets

Widgets in WordPress are small functionalities that can be added to the sidebar and footer of a website via drag and drop system. these widgets can contain text, images, links, and other content.
There are a lot of usefull usages of widgets

- A sreach bar
- Recent posts
- Recent comments
- Categories
- Archives
- .....

The handy thing about widgets is that you can add them to your wbesite without writing a single line of code. So it is a simple way to customize your website so it suits your needs. 🧩

---

### The Gutenberg Editor

In the newer version of WordPress you can use the Gutenberg editor. It is a block based editor that makes creating pages and posts much easier. It is a lot like the drag and drop system of the widgets. It gives you much more control over the layout of your website/content. 🎭

---

## 1.3 Popular Websites Using WordPress

- Microsoft 💻
- NASA 🚀
- Harvard University 🎓
- The Walt Disney Company 🏰
- Sony Music 🎵
- The New York Times 📰
- ....

WordPress is flexible enough to power everything from small blogs to super large websites. The adaptability of WordPress makes it an awesome choice for almost any project! 🌈

---

# 2 Using WordPress with Docker

I chose to create a WordPress website with MySQL and PhpMyAdmin so you can see that I know what I'm doing.

Docker makes it super easy to run WordPress and all the necessary services in containers therefor making installations and management much easier. 🧪

---

## 2.1 Install Docker Compose

To use WordPress on Docker we need to first install Docker itself. If you have followed the previous Docker documentation, you already have it installed. If you did not, then go to this link and download it.

👉 [Docker Desktop Installation](https://docs.docker.com/desktop/setup/install/windows-install/)

Docker Desktop is available for Windows, macOS, and Linux, so you can install it on any operating system you use. The installation process is super simple and super good documentated. 🖥️

---

## 2.2 Installing and Reviewing Dependencies

We need to use 3 official images for this tutorial, the images I will use are:

1. WordPress 🌐
2. MySQL 🗄️
3. PhpMyAdmin 🔧

We use PhpMyAdmin to be able to view the tables we have in the database.

These three services work together to create a fully functional WordPress installation:

- WordPress contains the CMS software itself
- MySQL stores all the data on a database
- PhpMyAdmin provides a graphical interface to manage the data on the database

---

## 2.3 Creating the yml file

If you have installed Docker Desktop then you need to start it before we continue. We need to do that, beacuse otherwise the commands that we will use, they will not be recognised. After you have done that, you need to create a new yml file called:

```sh
docker-compose.yml
```

Then you need to add the following lines in the yml file:

```sh
version: '3'

services:
  # Database
  db:
    image: mysql:5.7
    volumes:
      - db_data:/var/lib/mysql
    restart: always
    environment:
      MYSQL_ROOT_PASSWORD: password
      MYSQL_DATABASE: wordpress
      MYSQL_USER: wordpress
      MYSQL_PASSWORD: wordpress
    networks:
      - wpsite
  # PhpMyAdmin
  phpmyadmin:
    depends_on:
      - db
    image: phpmyadmin/phpmyadmin
    restart: always
    ports:
      - '8080:80'
    environment:
      PMA_HOST: db
      MYSQL_ROOT_PASSWORD: password
    networks:
      - wpsite
  # WordPress
  wordpress:
    depends_on:
      - db
    image: wordpress:latest
    ports:
      - '8000:80'
    restart: always
    volumes: ['./:/var/www/html']
    environment:
      WORDPRESS_DB_HOST: db:3306
      WORDPRESS_DB_USER: wordpress
      WORDPRESS_DB_PASSWORD: wordpress
    networks:
      - wpsite
networks:
  wpsite:
volumes:
  db_data:
```

This code installs WordPress, MySQL, and PhpMyAdmin so we can use it in the Docker container. Once you have done that, you need to go to the directory where you created that file (in the terminal). And the you need to run this command:

```sh
docker-compose up -d
```

It will then install the dependencies from the yml file and then run them. The `-d` flag is to ensure the containers run in the background. 🚀
If the command works fine you will eventually see this in your terminal. That means that everything is downloading.

<p align="center">
  <img src="https://github.com/Lander03/ProjectItLandscape/raw/master/WordPress/dependenciesWordPress.png" width="700" />
</p>

---

## 2.4 The URL in the Web Browser

If you have done all of the steps above and the Docker container is running, then you need to go to this url where the docker is running:

```sh
http://localhost:8000
```

Then a window like this wil open:

<p align="center">
  <img src="https://github.com/Lander03/ProjectItLandscape/raw/master/WordPress/LanguagesWordpress.png
  " width="700" />
</p>

In that view you can choose the language you want to use in WordPress. After that you need to follow the instructions on the screen to install WordPress. If that is done you need to log in with the username and password you set. If all of that worked correctly you will see a page like this appear:

<p align="center">
  <img src="https://github.com/Lander03/ProjectItLandscape/raw/master/WordPress/HomeWordpress.png
  " width="700" />
</p>
Now you can go to the pages tab on the left, then you clikc on **add page**. Now you can begin your journy for creating awesome websites!🎉

---

## 2.5 How To Acces PhpMyAdmin

If your WordPress server is correctly running, and you want to see and manage the database. You need to go to the url where PhpMyAdmin is running at. It will be this url if you copied the yml file from above, otherwise you need to check the yml file for the port.:

```sh
http://localhost:8080
```

There you will need to log in with your username and password. Then you can edit, view and create tables in the database. Good luck! 🛠️

---

## 2.6 Customizing and Developing WordPress

Now that you have WordPress installed with Docker, you can start customizing your website. You can do this in some ways, but the most popular are these:

1. Installing and customizing themes 🎭
2. Adding plugins for extra functionality 🔌
3. Creating pages and posts with the Gutenberg editor ✏️
4. Adding widgets to your sidebar and footer 📦
5. Creating menus for navigation 🧭

You can also develop your own themes and plugins if you want more control over the functionality and the layout of your website. WordPress also has extensive documentation for developers that you can use to guide you through the process. 📚

```sh
https://developer.wordpress.org
```

---

## 2.7 The Benefits of WordPress with Docker

Using WordPress with Docker has a lot of adventages:

1. **Isolation**: Each service runs in its own container, so they do not affect each other. 🧪
2. **Portability**: You can easily move your entire development environment to another computer or device. 🧳
3. **Version control**: You can use specific versions of WordPress, MySQL, and PhpMyAdmin in you containers. 🔄
4. **Scalability**: It is easy to scale for larger projects. 📈
5. **Quick setup**: With one command you can set up a fully functioning WordPress environment/website. ⚡

---

## 2.8 Troubleshooting

If you encounter any problem with your WordPress Docker installation, here are some common issues and solutions:

### Cannot connect to the database

You need to check if the MySQL container is running with. You can do this with this command:

```sh
docker ps
```

If the container is not running, you can try this:

```sh
docker-compose up -d db
```

### Permission problems with files

If you have issues with the file permissions, you can try this command:

```sh
chmod -R 777 ./
```

Note: This command is not recommended for production environments due to security risks.

### Stopping Docker containers

When you are done working, you can stop the containers with this command:

```sh
docker-compose down
```

And if you want to start these docker containers again later, you can do that with this command:

```sh
docker-compose up -d
```

---

# 3 Making My Own CV Website in WordPress

---

## 3.1 Setting Up Your CV Website

You first need to complete all the steps in the previous sections to install WordPress in Docker. Once you have WordPress up and running, we can proceed with creating a professional CV website.

---

## 3.2 Creating Your First Page

To start building your CV website, you need to add a new page. You do this by:

1. Navigating to the **Pages** tab on the left sidebar of your WordPress dashboard
2. Clicking on the **Add New** button at the top

<p align="center">
  <img src="https://github.com/Lander03/ProjectItLandscape/raw/master/WordPress/creatingPage.png" width="700" />
</p>

After clicking it, you will see an empty page editor like this:

<p align="center">
  <img src="https://github.com/Lander03/ProjectItLandscape/raw/master/WordPress/newPage.png" width="700" />
</p>

---

## 3.3 Uploading Your CV as a PDF

Now we need to give your page a title and upload your CV, we do that by:

1. Entering a descriptive title such as "My CV" or "Professional Resume"
2. Clicking on the blue **+** icon in the top left of the editor
3. Searching for and selecting the **File** block option

<p align="center">
  <img src="https://github.com/Lander03/ProjectItLandscape/raw/master/WordPress/PDFImportOne.png" width="700" />
</p>

Once you have added the File block, you need to:

1. Click on the **Upload** button
2. Select your CV PDF file from your computer
3. And wait for the upload to complete

<p align="center">
  <img src="https://github.com/Lander03/ProjectItLandscape/raw/master/WordPress/PDFImportTwo.png" width="700" />
</p>

After it was a successful upload, you will see your CV displayed on the page like this:

<p align="center">
  <img src="https://github.com/Lander03/ProjectItLandscape/raw/master/WordPress/PDFImportThree.png.png" width="700" />
</p>

---

# 1 CI/CD Pipeline Introduction
<p align="center">
  <img src="fotos/PipelineCiCd/CDPipeline.jpg" width="700" style="border-radius: 15px; box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);"/>
</p>
## 1.1 Overview

In this world of software development, a CI/CD pipeline is essential for automating the process of integrating code changes, running tests, and deploying applications. This document outlines the key components, and all the steps to set a CI/CD pipeline up in Github.

---

## 1.2 What is CI/CD?

**Continuous Integration (CI)** or CI. This refers to the process of regularly merging code changes into a shared repository. That means that each change is automatically tested and built. This nesures that the integrating issues are identified super early.

**Continuous Deployment (CD)** or CD. This builds on CI by automatically deploying and validated changes to production environments without manual needs. This leads to faster delivery cycles and way more consistent releases.

In this documentation about CI/CD, we will make a CI/CD pipeline in Github. This pipeline will/ or can automatically build, test, and deploy a simple application whenever changes are made to the codebase.

---

## 1.3 Why should you combine CI/CD with Docker?

That is verry simple, docker is a powerful tool for containers that you can use in applications. This means that you can package your application and its dependencies into a portable container that can run anywhere. When CI/CD is combined with Docker, the build and deployment processes become automated. This leads to better and more consistend releases, faster delivery cycles and platform independence. Docker ensures that the application runs consistently across different environments. That also reduces the "it works on my machine" problem.

### The key benefits

|        Benefit         | Description                                                                    |
| :--------------------: | :----------------------------------------------------------------------------- |
|      ✅ **Speed**      | New application versions can be automatically built and deployed on every push |
|   ✅ **Reliability**   | Automated tests and builds reduce human error                                  |
|   ✅ **Consistency**   | Development, test, and production environments are identical                   |
| ✅ **Reproducibility** | Every build is identical and can be reproduced at any time                     |
|  ✅ **Transparency**   | Every step of the process is logged and visible in GitHub Actions              |

## 1.4 Why GitHub Actions?

**GitHub Actions** is a powerfull tool that you can use to set up a CI/CD pipeline. It is built directly into GitHub. That makes it so super easy to use. You can also automate, build, test, and deploy your code right from your repositories on GitHub.

### Benefits of GitHub Actions

|      Benefit       | Description                                                   |
| :----------------: | :------------------------------------------------------------ |
| ✅ **Integration** | Super easy to integrate with GitHub repositories              |
| ✅ **Flexibility** | Supports a wide range of programming languages and frameworks |
|  ✅ **Community**  | Large community with many prebuilt actions available          |
| ✅ **Marketplace** | Access to a marketplace with over 11,000 actions              |

---

# 2 Setting Up a CI/CD Pipeline in GitHub

Now we are going to set up a CI/CD pipeline in GitHub. To set it up, we are going to need a few things:

- A GitHub repository to host the code
- The latest version of Docker desktop
- An IDE or a text editor to edit the files

If you have all of those 3 things, then we can proceed.

## 2.1 Getting And builing the App
We do not have the source code for the application, so we need to clone the git to get the source code on your own machine. You can do this by running the following command in your terminal:

```bash
git clone https://github.com/docker/getting-started-app.git
```

<p align="center">
  <img src="fotos/PipelineCiCd/ClondeCiCd.png" width="700" style="border-radius: 15px; box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);"/>
</p>

Now that we have the source code, we will need to build the image. We can do that by going tinot the **getting-started-app** folder, and we need to create a file namd Dockerfile. In this file, we will write the following code:

```dockerfile
# syntax=docker/dockerfile:1

FROM node:lts-alpine
WORKDIR /app
COPY . .
RUN yarn install --production
CMD ["node", "src/index.js"]
EXPOSE 3000
```

After that, we will need to build the image. We can do that by running the following command in the terminal:

First we need to navigate to the folder where the Dockerfile is located:

```bash
cd getting-started-app
```

<p align="center">
  <img src="fotos/PipelineCiCd/Navigate.png" width="700" style="border-radius: 15px; box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);"/>
</p>

Then we can build the image by running the following command:

```bash
docker build -t getting-started .
```

<p align="center">
  <img src="fotos/PipelineCiCd/BuildCiCd.png" width="700" style="border-radius: 15px; box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);"/>
</p>

## 2.1 Running the Container
Now that we have the image, we can run the container. We can do that by running the following command in the terminal:

```bash
docker run -d -p 127.0.0.1:3000:3000 getting-started
```
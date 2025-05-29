# 1 CI/CD Pipeline Introduction

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

For this example, I chose to use a basic application. I chose one based on the Docker tutorial that I made. you can find the link to it under this line, or you can find it in the navigation bar on the right side of this page.:

[Docker Tutorial](Docker#2-how-to-install-docker)

If you want to, you can always create your own. You can do that by altering the Dockerfile and the docker-compose.yml file. You can also add your own code to the application. If you want to do that, you can find the files in the repository of this project.

## 2.1 Creating a GitHub Repository

We have a few steps we need to take in orde to set up a CI/CD pipeline in GitHub.

1. **Create a new repository** on GitHub. First we need to make a new repository on GitHub. You can do that by going to the GitHub website and clicking on the "New" button in the top right corner of the page. Give your repository a name, description, and choose whether you want it to be public or private.
   You can also fork another repository if you want to use an existing one. For this example, I will use the repository that I am using for my documentation. You can find it here: [ProjectItLandscape](https://github.com/Lander03/ProjectItLandscape/tree/master)

2. **Adding Actions** to the Repository. After you have created your repository, you need to add the actions to it. You will need to press the Actions on the topp navigation.

<p align="center">
  <img src="fotos/PipelineCiCd/PipelineActionsSet.png" width="700" style="border-radius: 15px; box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);"/>
</p>

We will make our own yml file, so we are going to set up a workflow ourself.
You can do that by pressing the **set up a workflow yourself** button. This will create a new file in the `.github/workflows` directory of your repository.

<p align="center">
  <img src="fotos/PipelineCiCd/PipelineActionSetUp.png" width="700" style="border-radius: 15px; box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);"/>
</p>

After you pressed the **set up a workflow yourself** button, you will be redirected to a new page where you can edit and name the yml file. You can name the file whatever you want. I am going to name it **CiCdPipelineLandscape**.

3. **Editing the YML file**. Now that you have created the yml file, you can start editing it. You are already in the edit mode, so you can start making the yml file.
   I made a yml that builds a Docker image and pushes it to the Docker Hub. It does that every time I/someone push to the master branch.
   My yml file, if you want to copy it:

```yaml
name: CI/CD Pipeline

on:
  push:
    branches: [master]

jobs:
  build:
    runs-on: ubuntu-latest

    steps:
      - name: Checkout repository
        uses: actions/checkout@v3

      - name: Log in to Docker Hub
        uses: docker/login-action@v2
        with:
          username: ${{ secrets.DOCKER_USERNAME }}
          password: ${{ secrets.DOCKER_PASSWORD }}

      - name: Build Docker image
        run: docker build -t my-node-app:latest .

      - name: Push Docker image
        run: docker push my-node-app:latest
```

You need to replace the `{ secrets.DOCKER_USERNAME }` and `{ secrets.DOCKER_PASSWORD }` with your own Docker Hub username and password.

If you made a yml file and pasted/ put another code in there and maked the right credentials, then you can press on the **Commint Changes** button in the top right corner of the page. This will save your changes and commit them to the repository.

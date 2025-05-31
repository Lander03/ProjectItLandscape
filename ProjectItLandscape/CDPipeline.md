# 1 CI/CD Pipeline Introduction

<p align="center">
  <img src="fotos/PipelineCiCd/CDPipeline.jpg" width="500" style="border-radius: 15px; box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);"/>
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

---

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

If you have done all the things above, you are ready to set up a CI/CD pipeline in GitHub. This section will guide you through the steps to create a simple CI/CD pipeline using GitHub Actions.

---

## 2.1 Actions

GitHub Actions are workflows that you can use to automate tasks in your GitHub repository. You can create workflows that build, test, and deploy your code whenever you push changes to your repository.
If you ant to make one, you need to press the actions button on the top of the screen.

<p align="center">
  <img src="fotos/PipelineCiCd//PipelineActionsSet.png" width="500" style="border-radius: 15px; box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);"/>
</p>

---

## 2.2 Creating a Workflow

To create a  wrokflow, you need to press the create a workflow yourself. This is beacuse we are going to set up a custom workflow of ourself.

<p align="center">
  <img src="fotos/PipelineCiCd/PipelineActionSetUp.png" width="500" style="border-radius: 15px; box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);"/>
</p>

---

## 2.3 Writing the Workflow File

If you have followed the steps above, you will be in the editor to write your workflow file. This file is written in YAML format and defines the steps that GitHub Actions will take when you push changes to your repository.
The yml that i made:
```yaml
name: Build and Publish Docker Image

on:
  push:
    branches:
      - main
  workflow_dispatch:

jobs:
  build:
    runs-on: ubuntu-latest

    steps:
      - name: Checkout code
        uses: actions/checkout@v4

      - name: Check if GHCR_TOKEN secret is available
        run: |
          if [ -z "${{ secrets.GHCR_TOKEN }}" ]; then
            echo "❌ ERROR: GHCR_TOKEN secret is missing!"
            exit 1
          fi

      - name: Log in to GitHub Container Registry with PAT
        uses: docker/login-action@v2
        with:
          registry: ghcr.io
          username: Lander03
          password: ${{ secrets.GHCR_TOKEN }}

      - name: Build Docker image
        run: docker build -t ghcr.io/lander03/projectitlandscape:latest .

      - name: Push Docker image
        run: docker push ghcr.io/lander03/projectitlandscape:latest
```

This YAML file defines a GitHub Actions workflow that builds and publishes a Docker image to the GitHub Container Registry (GHCR) whenever changes are pushed to the `main` branch or when manually triggered.

---

## 2.4 Workflow Components Breakdown

| Component | Description | Purpose |
|:----------|:------------|:---------|
| **name** | "Build and Publish Docker Image" | Identifies the workflow in the GitHub Actions interface |
| **on** | Defines trigger events (`push` to `main` branch, `workflow_dispatch`) | Specifies when the workflow should run automatically or manually |
| **jobs** | Contains the `build` job definition | Groups related steps that run together on the same runner |
| **runs-on** | `ubuntu-latest` | Specifies the operating system for the runner environment |

### Workflow Steps Breakdown

| Step | Action/Command | Description |
|:-----|:---------------|:------------|
| **Checkout code** | `actions/checkout@v4` | Downloads the repository code to the runner environment |
| **Check GHCR_TOKEN** | Custom shell script | Validates that the required authentication token is available |
| **Login to GHCR** | `docker/login-action@v2` | Authenticates with GitHub Container Registry using the PAT token |
| **Build Docker image** | `docker build` command | Creates a Docker image from the Dockerfile in the repository |
| **Push Docker image** | `docker push` command | Uploads the built image to GitHub Container Registry |

### Key Features of This Workflow

- ✅ **Automatic Triggers**: Runs on every push to the main branch
- ✅ **Manual Execution**: Can be triggered manually via `workflow_dispatch`
- ✅ **Security Check**: Validates required secrets before proceeding
- ✅ **Container Registry**: Publishes images to GitHub Container Registry
- ✅ **Error Handling**: Stops execution if authentication token is missing

---

## 2.5 Saving and Committing the Workflow

Once you made your workflow file, you will need to save and commit it to your repository. You can do that by pressing the green **Commit changes** button at the top right corner. You will then need to put amessage and commit again.

<p align="center">
  <img src="fotos/PipelineCiCd/PipelineActionSetYml.png" width="500" style="border-radius: 15px; box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);"/>
</p>

---

## 2.6 Personal Acces Token

To  let the yml run properly, you will need to create a Personal Access Token(classic) in GitHub. This token is used to authenticate with the GitHub Container Registry (GHCR) and allows you to push Docker images to your repository.

You can do that by going to the settings of your account.

<p align="center">
  <img src="fotos/PipelineCiCd/SettingsPAT.png" width="500" style="border-radius: 15px; box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);"/>
</p>

Then you will need to go to the developer settings.

<p align="center">
  <img src="fotos/PipelineCiCd/DeveloperSettings.png" width="500" style="border-radius: 15px; box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);"/>
</p>

And then you will need to go to the Personal Access Tokens (classic) section.

<p align="center">
  <img src="fotos/PipelineCiCd/SettingsKey.png" width="500" style="border-radius: 15px; box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);"/>
</p>

Then you will need to generate a new token. You can do that by pressing the **Generate new token** button. Adn then you press on the **Generate new token (classic)** button.

<p align="center">
  <img src="fotos/PipelineCiCd/GenerateNewToken.png" width="500" style="border-radius: 15px; box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);"/>
</p>

You can give your token a name, and set the expiration date. I would recommend to set it to 90 days, so you can renew it every 3 months. You will also need to select the scopes that you want to give to the token. For this workflow, you will need to select the:

- `repo` scope: This allows the token to access your repositories.
- `write:packages` scope: This allows the token to publish packages to GitHub Container Registry.
- `read:packages` scope: This allows the token to read packages from GitHub Container Registry.

<p align="center">
  <img src="fotos/PipelineCiCd/NewTokenInit.png" width="500" style="border-radius: 15px; box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);"/>
</p>

After that you will press on generate new token. Then you will see the token appear. You will need to copy this token and save it somewhere safe, because you will not be able to see it again.

## 2.7 Adding the Token to GitHub Secrets

To use the token in your workflow, you will need to add it to your GitHub repository secrets. You can do that by going to the settings of your repository.

<p align="center">
  <img src="fotos/PipelineCiCd/PipelineSecretsSettings.png" width="500" style="border-radius: 15px; box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);"/>
</p>

After that you will need to go to the secrets and variables section, and then to the actions section.
In there you can choose to makee a **New repository secret**. You can do that by pressing the **New repository secret** button.

<p align="center">
  <img src="fotos/PipelineCiCd/PipelineSecretsNew.png" width="500" style="border-radius: 15px; box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);"/>
</p>

Then you will need to give your secret a name, and paste the token that you copied earlier in the value field. You need to name the secret `GHCR_TOKEN`. This is beacuse we used this name in the workflow file. After that you can press the **Add secret** button to save the secret.

<p align="center">
  <img src="fotos/PipelineCiCd/SecretsAdd.png" width="500" style="border-radius: 15px; box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);"/>
</p>

## 2.8 Creating the json file

To make the workflow work, you will need to create a json file in the root of your repository. This file is used to store the metadata for the Docker image that you are going to build and publish. You can create a file called `package.json` and add the following content to it:

```json
{
  "name": "projectitlandscape",
  "version": "1.0.0",
  "description": "Een voorbeeldproject voor CI/CD met Docker",
  "main": "index.js",
  "scripts": {
    "start": "node index.js",
    "test": "echo \"Geen tests gedefinieerd\" && exit 0"
  },
  "author": "Lander Cuypers",
  "license": "MIT",
  "dependencies": {
    "express": "^4.18.2"
  }
}

```

### Package.json Components Breakdown

| Field | Value | Description |
|:------|:------|:------------|
| **name** | `"projectitlandscape"` | The name of your project/package |
| **version** | `"1.0.0"` | Current version of the application using semantic versioning |
| **description** | `"Een voorbeeldproject voor CI/CD met Docker"` | Brief description of what the project does |
| **main** | `"index.js"` | Entry point file for the Node.js application |
| **author** | `"Lander Cuypers"` | The person who created/maintains the project |
| **license** | `"MIT"` | The license under which the project is distributed |

---

## 2.9 Running the Workflow

To run the workflow you can either push changes to the `main` branch or manually trigger it from the Actions tab in your GitHub repository. If you want to run it manually, you can do that by pressing the **Run workflow** button.

If everything is set up correctly, you should see the workflow start running. You can monitor the progress in the Actions tab, where you can view logs and see if any steps fail.
If the workflow runs successfully, you will see a green checkmark next to the workflow run.


<p align="center">
  <img src="fotos/PipelineCiCd/WorkflowRunSucces.png" width="500" style="border-radius: 15px; box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);"/>
</p>
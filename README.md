# GitLab Runner as a Clever Cloud application

You can use Clever Cloud to deploy a GitLab runner within a Docker container for your CI/CD pipelines. You'll need a [Clever Cloud account](https://console.clever-cloud.com/) and [Clever Tools](https://github.com/CleverCloud/clever-tools).

## Setup Clever Tools

```bash
npm i -g clever-tools
clever login
```

## Create your GitLab Runner

In your GitLab's project parameters: 

- Go to `CI/CD` > `Runners`
- Create and configure a new Linux runner
- Get the registration token, keep it for later use

## Configure your Clever Cloud application

Clone this repository and create a new Clever Cloud application:

```bash
git clone https://github.com/davlgd/cc-gitlab-runner
cd cc-gitlab-runner
clever create -t docker
clever env set CC_MOUNT_DOCKER_SOCKET "true"
```

Edit the `config.toml` file (at least `name`, `url`, `token`) to match your runner configuration. You'll find details about the configuration in the official GitLab documentation:
- https://docs.gitlab.com/runner/configuration/advanced-configuration.html
- https://docs.gitlab.com/runner/executors/docker.html#use-the-docker-executor

# Git push

Then, you can deploy your application:

```bash
git add . && git commit -m "First deploy"
clever deploy
```

Once the application is deployed, you can check the logs to see if the runner is correctly registered. After that, you can use it for your CI/CD pipelines. When you're done, you can stop the runner from the [Clever Cloud Console](https://console.clevercloud.com) or using Clever Tools:

```bash
clever stop
```
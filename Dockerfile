FROM gitlab/gitlab-runner:latest

COPY config.toml /etc/gitlab-runner/config.toml

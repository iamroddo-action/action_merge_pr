FROM ubuntu:20.04

LABEL "com.github.actions.name"="Automerge pull request"
LABEL "com.github.actions.description"="Automatically merges a GitHub pull request that has passed checks"

LABEL version="0.1.0"
LABEL repository="https://github.tools.sap/netinfra/action_merge_pr"
LABEL maintainer="Rod Oliver"

RUN apt update && \
  apt install gnupg jq software-properties-common -y

RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-key C99B11DEB97541F0 && \
  apt-add-repository https://cli.github.com/packages && \
  apt update && \
  apt install gh -y

COPY entrypoint.sh /
ENTRYPOINT ["entrypoint.sh"]

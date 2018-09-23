FROM debian:latest

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update -y && apt-get install zip unzip curl bash -y
ADD SDKMAN_VERSION .
ADD sdk /bin/sdk
RUN curl "https://get.sdkman.io" | sed -e 's/SDKMAN_VERSION=.*//' | SDKMAN_VERSION="$(cat SDKMAN_VERSION)" bash
ENTRYPOINT ["/bin/bash", "-c", "/bin/sdk"]

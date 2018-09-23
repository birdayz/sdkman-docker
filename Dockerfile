FROM alpine:3.8

ADD SDKMAN_VERSION .
RUN apk update && apk add zip unzip curl bash
SHELL ["/bin/bash", "-c"]
RUN curl "https://get.sdkman.io" | sed -e 's/SDKMAN_VERSION=.*//' | SDKMAN_VERSION="$(cat SDKMAN_VERSION)" bash
RUN echo "shopt -s expand_aliases" >> /root/.bashrc
RUN source /root/.sdkman/bin/sdkman-init.sh
RUN source /root/.bashrc >> /root/.profile
RUN source /root/.bashrc && sdk
ENTRYPOINT ["/bin/bash"]

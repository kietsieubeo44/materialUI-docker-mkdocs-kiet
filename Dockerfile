FROM ubuntu:latest
ARG DEBIAN_FRONTEND=noninteractive

LABEL maintainer="Zobair Qauomi https://github.com/ZobairQ"

RUN apt-get update && apt-get install -y python3-pip

RUN pip3 install mkdocs-material
# Goi theme mở rong
RUN pip3 install mkdocs-material[swiss] mkdocs-material[dark]


RUN apt-get remove -y python3-pip

# Copy only the necessary files
COPY mkdocs.yml .
COPY docs/ ./docs
# Copy the screenshots directory into the container
COPY docs/ ./docs/screenshots


WORKDIR /doc

EXPOSE 8000

ENTRYPOINT [ "mkdocs" ]
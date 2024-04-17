# Sử dụng image ubuntu phiên bản mới nhất làm base image
FROM ubuntu:latest

# Thiết lập biến môi trường để tránh yêu cầu nhập dữ liệu từ người dùng
ARG DEBIAN_FRONTEND=noninteractive

# Đặt nhãn maintainer để mô tả người duy trì Dockerfile và thông tin liên hệ
LABEL maintainer="Zobair Qauomi https://github.com/ZobairQ"

# Cập nhật gói và cài đặt pip3 để cài đặt MkDocs
RUN apt-get update && apt-get install -y python3-pip

# Cài đặt gói MkDocs và theme Material
RUN pip3 install mkdocs-material
RUN pip3 install mkdocs-material[swiss] mkdocs-material[dark]

# Gỡ bỏ gói python3-pip sau khi đã sử dụng xong
RUN apt-get remove -y python3-pip

# Sao chép các tệp cần thiết vào container
COPY mkdocs.yml .
COPY docs/ ./docs
COPY docs/ ./docs/screenshots

# Thiết lập thư mục làm việc mặc định cho container
WORKDIR /doc

# Mở cổng 8000 để có thể truy cập MkDocs web server
EXPOSE 8000

# Thiết lập lệnh mặc định khi container được khởi chạy
ENTRYPOINT [ "mkdocs" ]

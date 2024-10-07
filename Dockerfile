FROM ubuntu:latest
MAINTAINER Lam Truong <truongb2111965@student.ctu.edu.vn>
RUN apt update -y && \
    apt install -y python3-pip python3-dev python3-venv build-essential
ADD . /flask_app
WORKDIR /flask_app
RUN python3 -m venv venv
RUN ls -la venv/bin
RUN ./venv/bin/python -m pip install --upgrade pip && \
    ./venv/bin/python -m pip install --timeout=600 -r requirements.txt
CMD ["./venv/bin/python", "flask_docker.py"]

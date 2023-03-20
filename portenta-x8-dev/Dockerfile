FROM python:slim-buster

WORKDIR /usr/src/app

COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt

COPY src/ .

RUN git clone https://github.com/crosstyan/mpu6050-py.git && \
    cd mpu6050-py && \
    pip install -e .

# ENTRYPOINT [ "python", "serialrpc.py" ]

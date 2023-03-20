FROM python:3-alpine3.15

RUN set -ex \
    && apk add --no-cache --virtual .build-dep \
        git build-base python3-dev

RUN set -ex \
    && git clone https://github.com/crosstyan/mpu6050-py.git \
    && cd mpu6050-py \
    && pip install -e . \
    && cd ..

RUN set -ex \
    && apk del .build-dep

WORKDIR /usr/src/app

COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt

# COPY src/ .

ENV UDEV=1

# ENTRYPOINT [ "python", "serialrpc.py" ]

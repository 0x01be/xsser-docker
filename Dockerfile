FROM 0x01be/xsser:build as build

FROM alpine

COPY --from=build /opt/xsser/ /opt/xsser/

RUN apk add --no-cache --virtual xsser-runtime-dependecies \
    python3 \
    curl \
    libffi \
    firefox-esr

RUN adduser -D -u 1000 xsser

USER xsser

ENV PATH ${PATH}:/opt/xsser/bin/
ENV PYTHONPATH /usr/lib/python3.8/site-packages/:/opt/xsser/lib/python3.8/site-packages/

CMD "xsser"


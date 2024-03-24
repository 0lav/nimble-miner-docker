FROM python:3.8-slim-buster


WORKDIR /usr/src/app

RUN git clone https://github.com/nimble-technology/nimble-miner-public.git


WORKDIR /usr/src/app/nimble-miner-public


RUN make install

# Copy the entrypoint script and make it executable
COPY entrypoint.sh /usr/src/app/entrypoint.sh
RUN chmod +x /usr/src/app/entrypoint.sh

# Set the entrypoint script
ENTRYPOINT ["/usr/src/app/entrypoint.sh"]
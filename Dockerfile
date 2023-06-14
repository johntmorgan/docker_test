# syntax=docker/dockerfile:1
FROM ubuntu:22.04

# install app dependencies
RUN apt-get update && apt-get install -y python3 python3-pip
RUN pip install flask==2.1.*

# install app
COPY hello_world.py /

# final configuration
ENV FLASK_APP=hello_world
EXPOSE 8000
CMD ["/bin/bash", "-c", "trap 'kill -INT $$' INT; exec /bin/bash"]
CMD flask run --host 0.0.0.0 --port 8000
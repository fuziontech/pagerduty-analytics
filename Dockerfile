FROM python:2.7
MAINTAINER fuziontech

RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

# PIP stuff
# Super stable/slow requirements
RUN pip --version
RUN pip install --src=/tmp/pip-src --no-cache-dir 'pip>=7,<8'
RUN pip install --src=/tmp/pip-src --no-cache-dir uwsgi==2.0.10

# App requirements
COPY requirements.txt /usr/src/app/requirements.txt
RUN pip install --src=/tmp/pip-src --no-cache-dir -r requirements.txt

# Copy application code
COPY . /usr/src/app

RUN python setup.py install

# Set environment variables for the app
ENV APP_ROOT /usr/src/app

EXPOSE 80 443 8000

ENTRYPOINT [ "/usr/src/app/entrypoint.sh" ]
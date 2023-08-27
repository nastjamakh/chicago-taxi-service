FROM python:3.11.4-slim-buster

ARG TARGETPLATFORM
ARG BUILDPLATFORM

RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get -y install curl build-essential openssh-client procps

ENV WORKDIR /opt/chicago-taxi-service
ENV PYTHONPATH $PYTHONPATH:$WORKDIR/src
WORKDIR $WORKDIR

# Add user jumbo
RUN adduser --system jumbo --group
RUN chown -R jumbo:jumbo $WORKDIR

# install and configure poetry
RUN curl -sSL https://install.python-poetry.org | POETRY_HOME=/opt/poetry python3 && \
    cd /usr/local/bin && \
    ln -s /opt/poetry/bin/poetry && \
    poetry config virtualenvs.create false
ENV PATH="/.local/share/pypoetry/bin/poetry:/home/jumbo/.local/bin:/home/jumbo/.poetry/bin:/home/jumbo/.local/share/pypoetry:${PATH}"

# install python dependencies
COPY pyproject.toml poetry.lock $WORKDIR/
RUN poetry install
RUN poetry lock --no-update

# use Dockerignore
COPY --chown=jumbo:jumbo . $WORKDIR

ARG GIT_COMMIT_HASH
ENV GIT_COMMIT_HASH=${GIT_COMMIT_HASH}

FROM python:3.10 as requirements-stage
WORKDIR /tmp
RUN pip install poetry
COPY ./pyproject.toml ./poetry.lock* /tmp/
RUN poetry export -f requirements.txt --output requirements.txt --without-hashes

FROM python:3.10
WORKDIR /code
COPY --from=requirements-stage /tmp/requirements.txt /code/requirements.txt
COPY scripts/entrypoint.sh /code/scripts/entrypoint.sh
RUN chmod +x /code/scripts/entrypoint.sh
RUN pip install --no-cache-dir --upgrade -r /code/requirements.txt


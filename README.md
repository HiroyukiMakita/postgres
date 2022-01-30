# PostgreSQL in Docker

# Usage

1. Clone this repository.

2. Create `.env`. by copied `.env.example`, and please set it up all values.

```
$ cp .env.example .env
```

3. Container build and starting up use below command.

```
$ make
```

You can’t use make commands, alternative below command.

```
$ docker-compose build && docker-compose up -d
```

4. You will be can access to pgAdmin to bellow address.

`http://localhost:{your “PGADMIN_PORT” value .env file (default: 80)}`

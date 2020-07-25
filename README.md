# bref-hello-world

This is a first example of a HTTP application using [bref](https://bref.sh/).

## Provisioning

To ease local development you have to install [Docker CE](https://www.docker.com/),
at least version 18.06.0.

**Note**: It is recommended to follow [this guide](https://docs.docker.com/install/linux/linux-postinstall/#manage-docker-as-a-non-root-user) in order to manage Docker as a non-root user.

First of all, the project image has to be built, executing from project's root folder the following command:

```
docker build -t eugcar/php-serverless:7.4 .
```

To install project dependencies, from project's root folder, run:

```
docker run --rm --interactive --tty --volume $PWD:/app --user $(id -u):$(id -g) composer install
```

## Asynchronous tasks

### Deploy the application
To deploy the application, from project's root folder, run:

```
docker run -it --rm --user $(id -u):$(id -g)  -v "$PWD":/usr/src/myapp -v "$PWD"/.aws:/.aws -v "$PWD"/.serverless:/.serverless -w /usr/src/myapp eugcar/php-serverless:7.4 serverless deploy
```
# USERS API

[![Build Status](https://travis-ci.org/SouUmLucas/user-project.svg?branch=master)](https://travis-ci.org/SouUmLucas/user-project) [![Maintainability](https://api.codeclimate.com/v1/badges/84723b8231f475e73ef1/maintainability)](https://codeclimate.com/github/SouUmLucas/user-project/maintainability) [![Coverage Status](https://coveralls.io/repos/github/SouUmLucas/user-project/badge.svg)](https://coveralls.io/github/SouUmLucas/user-project)

Disponível em: http://ec2-34-229-214-99.compute-1.amazonaws.com:3000/users

Documentação: http://ec2-34-229-214-99.compute-1.amazonaws.com/users-api-doc/

##### Configurando

Para facilitar tanto o deploy, quanto o desenvolvimento, esse projeto roda sobre o Docker. Logo, todos os serviços e dependências estão contidos nesse único projeto. Não se esqueça de instalar o Docker Compose para facilitar ainda mais o deploy.

As versão mínima recomendada para o Docker é a seguinte:

```
Docker version 17.09.0-ce
docker-compose version 1.16.1
```

##### Variáveis de ambiente

As seguintes variáveis de ambiente devem ser definidas:

```
DATABASE_DEVELOPMENT_NAME:
DATABASE_DEVELOPMENT_HOST:
DATABASE_DEVELOPMENT_PORT:
DATABASE_DEVELOPMENT_USERNAME:
DATABASE_DEVELOPMENT_PASSWORD:

DATABASE_TEST_NAME:
DATABASE_TEST_HOST:
DATABASE_TEST_PORT:
DATABASE_TEST_USERNAME:
DATABASE_TEST_PASSWORD:

DATABASE_PRODUCTION_NAME:
DATABASE_PRODUCTION_HOST:
DATABASE_PRODUCTION_PORT:
DATABASE_PRODUCTION_USERNAME:
DATABASE_PRODUCTION_PASSWORD:
```

Você também pode criar o arquivo ```config/local_env.yml``` e definir essas variáveis.

Depois de definidas as variáveis de ambiente, rode o seguinte comando para executar as migrações:

```
$ docker-compose run web rake db:create db:migrate
```

### Executando os teste
```
$ docker-compose run web rspec
```

### Executando

Finalmente, para ver a API, basta executar:

```
$ docker-compose up
```

E tudo certo!
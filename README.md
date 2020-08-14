# Authentication service

## About
This is the authentication service for [goods-shop-rest] project. This service intended for retrieving
JWT token from credentials.

## If you find a bug, or you have any suggestions
You can follow the next link and describe your problem/suggestion: https://github.com/vladsmirn289/AuthenticationService/issues

## Running
If you want to run this service separately, you can run it from your IDE, or use the next command:
```shell script
docker-compose up
```
from a root folder of the project. However, docker-compose.yml file start the postgreSQL database on the port
5432, you can add the next option to postgreSQL service in the docker-compose.yml:
```shell script
network_mode: "host"
```
You also need to have the shop_db database with filled clients.

## Using
After start, you can use a **[postman]** application or follow the next link http://localhost:8081/auth-server-swagger.
The second variant is the swagger documentation, where you also can perform any http requests (GET, POST, PUT, etc.).
The first variant is more universal method with using third-party application.

## Package structure
The diagram of the package structure:
*   GoodsShop
    *   data (database data for separately running)
    *   logs
    *   src
        *   [main]
            *   [java]
                *   [com.shop.AuthenticationService]
                    *   [Config] (Mostly security configs)
                        *   [JWT] (Contain JwtUtils class for generating token)
                    *   [Controller] (LoginController which generate token, and RootController for swagger)
                    *   [DTO] (Request and response classes)
                    *   [Model] (JPA entities)
                    *   [Repository] (Spring Data repos)
                    *   [Service] (Service for finding client by a login)
                    *   [GoodsShopApplication.java] (Main class for, Spring Boot)
            *   [resources]
                *   [application.properties] (Stores various properties of the database, JWT and swagger)
                *   [log4j2.xml] (Stores log4j2 properties)
        *   [test]

## License
Authentication service is the service released under version 2.0 of the [Apache License](https://www.apache.org/licenses/LICENSE-2.0).

[goods-shop-rest]: https://github.com/vladsmirn289/GoodsShopRest
[postman]: https://www.postman.com/

[main]: ./src/main
[java]: ./src/main/java
[com.shop.AuthenticationService]: ./src/main/java/com/shop/AuthenticationService
[Config]: ./src/main/java/com/shop/AuthenticationService/Config
[JWT]: ./src/main/java/com/shop/AuthenticationService/Config/JWT
[Controller]: ./src/main/java/com/shop/AuthenticationService/Controller
[DTO]: ./src/main/java/com/shop/AuthenticationService/DTO
[Model]: ./src/main/java/com/shop/AuthenticationService/Model
[Repository]: ./src/main/java/com/shop/AuthenticationService/Repository
[Service]: ./src/main/java/com/shop/AuthenticationService/Service
[GoodsShopApplication.java]: ./src/main/java/com/shop/AuthenticationService/AuthenticationServiceApp.java

[resources]: ./src/main/resources
[application.properties]: ./src/main/resources/application.properties
[log4j2.xml]: ./src/main/resources/log4j2.xml

[test]: ./src/test
# Docker files


## Structure

```

project-file
    |
    |--- docker-app
    |       |
    |       |--- .env
    |       |
    |       |--- docker-compose.yml
    |       |
    |       |--- Dockerfile
    |       |
    |       |--- setup.sh
    |       |
    |       |--- start.sh
    |
    |--- docker-base
    |       |
    |       |--- Dockerfile
    |       |
    |       |--- setup.sh
    |
    |--- target
    |       |
    |       |--- pack
    |       |       |
    |       |       |--- bin
    |       |       |
    |       |       |--- lib
    |       |
    |       |--- scala-x.xx
    |               |
    |               |--- projectName_scalaVersion-projectVersion.jar
    |
    |--- resources

```


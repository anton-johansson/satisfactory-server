# Satisfactory dedicated server

This is a Docker image for Satisfactory dedicated server in Update 5.


## Building

```shell
$ docker build --tag antonjohansson/satisfactory-server:u5-176027 .
```


## Running

```shell
$ docker run --detach --name satisfactory --volume /var/satisfactory-server/game-saves:/home/steam/.config/Epic/FactoryGame/Saved/SaveGames/server/ --publish 7777:7777/udp --publish 15000:15000/udp --publish 15777:15777/udp antonjohansson/satisfactory-server:u5-176027
```

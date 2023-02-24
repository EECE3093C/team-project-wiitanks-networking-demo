# Peer2Peer Networking Demo Project

Ryan Williams

Adopted from [this](https://youtu.be/MNCJTP8xXcI) tutorial on Youtube.

## Goal

Connect a host player to client player and synchronize actions in a simple game. 

## Basic Class (Scene) Diagram

```mermaid
flowchart LR
    Begin --> Lobby.tscn
    Lobby.tscn ---> Game.tscn
    Game.tscn -..->|Completed game| Lobby.tscn
```

## Lobby.tscn

```mermaid
flowchart LR
    
    
    subgraph Lobby.tscn
        
        direction TB
        Begin --> host-btn.gd
        host-btn.gd --> Lobby.gd
        id1(User Clicks Host) -.->|Method Connection| host-btn.host
        host-btn.host --> network.initialize_server
        host-btn.host -.->|Signal| connecting-bg.gd

        id3(User Clicks Join) -.->|Method Connection| join-btn.join
        join-btn.join --> id5[/Is entered IP valid?/]
        id5 -->|yes| join-btn.client_connect
        join-btn.client_connect --> network.init_client
        join-btn.client_connect -.->|Signal| connecting-bg.gd

        lobby.connect_callback --> begin_game
        lobby.connect_callback -.->|rpc call| id2[begin_game of clients]

    end

    subgraph Game.tscn

        direction TB
        game.gd._ready --> network.set_ids
        game.gd._ready --> game.create_players
        game.create_players -->|For Each Player| game.create_player
        game.create_player --> game.create_players

    end

```

## Game.tscn
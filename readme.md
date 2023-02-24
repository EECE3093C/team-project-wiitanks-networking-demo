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

## In more detail

```mermaid
flowchart TD
    Begin --> host-btn.gd

    subgraph Lobby.tscn
    host-btn.gd --> Lobby.gd
    id1(User Clicks Host) -.->|Method Connection| host-btn.host
    host-btn.host --> network.initialize_server
    host-btn.host --> host-btn.client-connect 
    host-btn.client-connect -.->|Signal| connecting-bg.gd

    lobby.connect_callback --> begin_game
    lobby.connect_callback -.-> clients_begin_game

    end

```
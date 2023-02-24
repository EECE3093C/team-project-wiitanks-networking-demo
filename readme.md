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
    id1(User Clicks Host) -->|Method Connection| join-btn.join
    join-btn.join --> join-btn.client-connect 
    join-btn.client-connect -.->|Signal| connecting-bg.gd


    end



```
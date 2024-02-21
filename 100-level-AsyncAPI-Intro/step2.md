As Eve and Chan begin building a communication system using AsyncAPI inside Chan's spaceship control room, Chan asks Eve if there is a standardized way of defining the communication system or if she defines the communication systems differently based on the particular use case.

Eve replies that AsyncAPI has a standardized way of defining communication systems. She explains to Chan that the communication system is defined using a specific structure within an AsyncAPI document. As it is much easier to understand things in action, Eve shows Chan how to structure components in an AsyncAPI document.

## Understanding AsyncAPI components 

- **Info**

Just as the name tag on Chan's spaceship provides essential details like the spaceship's name and model, the `info` section in AsyncAPI serves a similar purpose. It provides crucial information about the API, such as the title, version, and description. The `info` metadata helps developers understand the basic API details they're working with.

```yml
asyncapi: '3.0.0'
info:
  title: Space Communication API
  version: '1.0.0'
  description: API for communication between Chan's spaceship and Capuccinova
```

- **Servers**

Imagine that Chan's spaceship communicates with Eve on Capuccinova through various servers. In AsyncAPI, the `servers` section describes the servers our API will communicate with, including their hosts, protocols, and descriptions.

```yml
servers:
  production:
    host: mqtt://localhost
    protocol: mqtt
    description: Production server for space communication
```

- **Channels**

The spaceship's radio stations, which correspond to specific topics like communicating with Capuccinova, are similar to the `channels` in AsyncAPI. These channels represent paths for sending specific types of messages. Each channel uses an address, which is a template for the URL of the server, and can have parameters inside curly braces that can be replaced dynamically at runtime.

```yml
channels:
  chatRoom:
    address: chat/{roomId}
    messages:
      chatMessage:
        name: ChatMessage
        payload:
          type: object
          properties:
            userId:
              type: string
              description: The ID of the user who sent the message
            message:
              type: string
              description: The chat message
            spacename:
              type: string
              description: The unique spacename identifier for the message
```

- **Tags**

`Tags` in AsyncAPI are like the labels on the spaceship's control panel. They help categorize different operations, making it easier to understand what each part of the API does. Each tag consists of a name and an optional description.

```yml
tags:
  - name: chat
    description: Operations related to chat
```

- **Components**

`Component` is like the toolbox in Chan's spaceship. It contains reusable parts like message definitions and schemas that can be used across the API. Each component is linked to a particular schema, which describes the structure of the message content.

```yml
components:
  messages:
    ChatMessage:
      name: ChatMessage
      title: Chat Message
      contentType: application/json
      payload:
        $ref: '#/components/schemas/ChatMessagePayload'
  schemas:
    ChatMessagePayload:
      type: object
      properties:
        userId:
          type: string
          description: The ID of the user who sent the message
        message:
          type: string
          description: The chat message
```

## Operations, messages, and schemas

- **Operations**

`Operations` in AsyncAPI are like the instructions for the spaceship. They define what actions can be performed within each channel, such as sending or receiving messages. Each operation is associated with a channel and its messages.

```yml
operations:
  sendChatMessage:
    action: 'send'
    summary: Send a chat message to a specific room
    channel:
      $ref: '#/channels/roomidchat'
```

- **Messages**

`Messages` in AsyncAPI are the content exchanged during operations, just like the words Eve from Capuccinova and Chan from Brownieterra use to communicate. They describe the structure and content of the messages sent or received.


```yml
components:
  messages:
    ChatMessage:
      name: ChatMessage
      title: Chat Message
      contentType: application/json
      payload:
        $ref: '#/components/schemas/ChatMessagePayload'
```

- **Schemas**

`Schemas` in AsyncAPI are like the blueprints for the spaceship. They define the structure of the message content, ensuring that everything fits together correctly. Each schema is associated with a component and describes the structure and content of the messages.

```yml
components:
  schemas:
    ChatMessagePayload:
      type: object
      properties:
        userId:
          type: string
          description: The ID of the user who sent the message
        message:
          type: string
          description: The chat message
```


## Request/reply 
As Eve and Chan near the completion of their communication system setup, Eve takes a moment to elaborate on the request/reply pattern to Chan, emphasizing that it is a communication pattern rather than a separate component.

Eve clarifies to Chan that this pattern involves two key roles: a requestor and a replier.

In their setup, they establish a channel named `communication` to facilitate requests and enable communication. Now they can stay in touch and communicate about Eve's adventures and Chan's fascinating discoveries during his intergalactic travels. 

```yml
asyncapi: 3.0.0
info:
  title: Eve And Chan's Communication APP
  version: 1.0.0
channels:
  communication:
    address: /brownieterra
    messages:
      chit_chat:
        payload:
          type: string
      cool_discovery:
        payload:
          type: object
          properties:
            title:
              type: string
            info:
              type: string
            date:
              type: string
      confirmation:
        payload:
          type: boolean
operations:
  sendChit_Chat:
    action: send
    channel:
      $ref: "#/channels/communication"
    messages:
      - $ref: "#/channels/communication/messages/chit_chat"
    reply:
      channel:
        "$ref": '#/channels/communication'
      messages:
       - $ref: "#/channels/communication/messages/chit_chat"
  sendDiscovery:
    action: send
    channel:
      $ref: "#/channels/communication"
    messages:
      - $ref: "#/channels/communication/messages/cool_discovery"
    reply:
      channel:
        "$ref": '#/channels/communication'
      messages:
       - $ref: "#/channels/communication/messages/confirmation"
```

Chan wonders how Eve could reach him if he travels around and his address(reply address) is unknown. 

Eve teaches Chan how to set up a communication system and stay in touch even when the reply address is not known. 

```yaml 
channels:
  communication:
    address: /brownieterra
    messages:
      chit_chat:
        payload:
          type: string
      cool_discovery:
        payload:
          type: object
          properties:
            title:
              type: string
            info:
              type: string
            date:
              type: string
      confirmation:
        payload:
          type: boolean
  secret_channel:
    address: /cappucinova
    messages:
      secret_stuff:
        payload:
          type: string
operations:
  sendSecretMessage:
    action: send
    channel:
      "$ref": "#/channels/secret_channel"
    reply:
      address:
        "description": "Consumer inbox"
        "location": "$message.header#/secret_reply_channel"
  sendChit_Chat:
    action: send
    channel:
      $ref: "#/channels/communication"
    messages:
      - $ref: "#/channels/communication/messages/chit_chat"
    reply:
      channel:
        "$ref": '#/channels/communication'
      messages:
       - $ref: "#/channels/communication/messages/chit_chat"
  sendDiscovery:
    action: send
    channel:
      $ref: "#/channels/communication"
    messages:
      - $ref: "#/channels/communication/messages/cool_discovery"
    reply:
      channel:
        "$ref": '#/channels/communication'
      messages:
       - $ref: "#/channels/communication/messages/confirmation"
```

With the final pieces programmed and the communication system in place, Chan gets ready to return home. 

Making a promise to stay in touch, Chan takes off in his spaceship back to Brownieterra.

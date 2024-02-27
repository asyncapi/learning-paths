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

Imagine that Chan's spaceship communicates with Eve on Capuccinova through various servers.  In AsyncAPI, the `servers` section serves to describe both the servers that the application of the API communicates with and the servers that the application itself exposes, such as a websocket interface or HTTP Rest.

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
    address: chat
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
      contentType: application/json
      payload:
        $ref: '#/components/schemas/ChatMessagePayload'
```

- **Schemas**

`Schemas` in AsyncAPI are like the blueprints for the spaceship. They allows the definition of input and output data types.

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

- **Components**

`Component` is like the toolbox in Chan's spaceship. It contains a set of reusable objects for different aspects of the AsyncAPI specification. All objects defined within the components object will have no effect on the API unless they are explicitly referenced from properties outside the components object.

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

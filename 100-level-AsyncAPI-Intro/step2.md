
## Understanding AsyncAPI components 

- **Info**

Just as the name tag on Chan's spaceship provides essential details like the spaceship's name and model, the `info` section in AsyncAPI serves a similar purpose. It provides crucial information about the API, such as the title, version, and description. The `info` metadata helps developers understand the basic API details they're working with.

```yml
asyncapi: '3.0.0'
info:
  title: Space Communication API
  version: '1.0.0'
  description: API for communication between Chan's spaceship and Capuccinova

- **Servers**

Imagine that Chan's spaceship communicates with Eve on Capuccinova through various servers. In AsyncAPI, the `servers` section describes the servers our API will communicate with, including their hosts, protocols, and descriptions.

```yml
servers:
  production:
    host: space.mosquitto.org
    protocol: mqtt
    description: Production server for space communication

- **Channels**

The spaceship's radio stations, which correspond to specific topics like communicating with Capuccinova, are similar to the `channels` in AsyncAPI. These channels represent paths for sending specific types of messages. Each channel uses an address, which is a template for the URL of the server, and can have variables inside curly braces.

```yml
channels:
  roomidchat:
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

- **Tags**

`Tags` in AsyncAPI are like the labels on the spaceship's control panel. They help categorize different operations, making it easier to understand what each part of the API does. Each tag consists of a name and an optional description.

```yml
tags:
  - name: chat
    description: Operations related to chat

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

## Operations, messages, and schemas

- **Operations**

`Operations` in AsyncAPI are like the instructions for the spaceship. They define what actions can be performed within each channel, such as sending or receiving messages. Each operation is associated with a message and a schema.

```yml
operations:
  sendChatMessage:
    action: 'send'
    summary: Send a chat message to a specific room
    channel:
      $ref: '#/channels/roomidchat'
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

Now it's time to help Chan establish a sophisticated communication system with Eve on Capuccinova. With your new expertise in AsyncAPI, you'll assist him in creating an AsyncAPI document from scratch.


#### Exercise 1: Create AsyncAPI document


1. In the KillerCoda terminal, create a new file by typing `nano chan-to-capuccinova.yaml`.

2. Enter the following AsyncAPI document structure:
   ```yaml
   asyncapi: 3.0.0
   info:
     title: Space Communication API
     version: '1.0.0'
     description: API for communication between Chan's spaceship and Capuccinova

   servers:
     production:
       host: space.mosquitto.org
       protocol: mqtt
       description: Production server for space communication

   channels:
     roomidchat:
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

   operations:
     sendChatMessage:
       action: 'send'
       summary: Send a chat message to a specific room
       channel:
         $ref: '#/channels/roomidchat'
   ```

#### Exercise 2: Add new channel and define operations**

After successfully laying the groundwork for communication with Capuccinova, Chan is eager to extend his AsyncAPI document to include a channel for Brownieterra. 

1. Run the command `nano chan-to-capuccinova.yaml` to edit Chan's document.
2. Add a channel for Brownieterra, specifying the channel name, its address, and parameters.
```yaml
   brownieterra-chat:
     description: Channel for sending messages to Brownieterra
     address: brownieterra-chat/{spacename}
     parameters:
       spacename:
         description: The unique spacename identifier for Brownieterra communication
         schema:
           type: string

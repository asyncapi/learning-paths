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
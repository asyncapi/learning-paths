## Request/reply 
As Eve and Chan almost finish setting up the communication system, Eve explains to Chan about Request/reply pattern, which is not a component but a common communication pattern. 

Eve explains Chan that this is a type of communication pattern where there are two actors, a requestor and a replier. 

Here, they setup a channel called `communication`, which is a used to exchange messages, send requests asking how Eve's doing, what's she upto, general chit-chat or cool discoveries by chan as he travels around the galaxy. And the reply address as to where the response to his request needs to be delivered is known while defining the communication system.

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

But then, Chan wonders how would Eve be able to reach him if in case he is travelling around and his address(reply address) is not known. 

That is when Eve teaches Chan how they setup a communication system and stay in touch even when the reply address is not known at the time of design. 

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

With the final pieces programmed and the communication system in place, Chan gets ready to get back home. 

Making a promise to stay in touch, Chan takes off in his spaceship back to Brownieterra
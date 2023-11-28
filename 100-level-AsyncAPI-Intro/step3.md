When Chan goes back to his planet, he wants to communitcate with Eva. For communicating he needs to learn how to write AsyncAPI documentation and check if he can send a message to Eve.

### Writing an AsyncAPI Document from Scratch:

#### Setting Up the Basics:

Chan begins by setting up his space message plan. He writes:

```
asyncapi: 3.0.0
info:
  title: Sending Signal to Eve
  version: 0.1.0
```

This is like Chan saying, "I'm using the 3.0.0 space message rules, and I'm naming my plan `Sending Signal to Eve.`"

#### Creating Channels and Messages

Chan then decides on the path his message will take to Eve. He sets up a channel, like a route in space, and names it `userSignedUp` with an address `Earth/letter`. The document looks like:

```
channels:
  userSignedUp:
    address: Earth/letter
    messages:
      lettertoEarth:
        description: Communicating with Eve.
        payload:
          type: object
          additionalProperties: false
          properties:
            fullName:
              type: string
            email:
              type: string
              format: email
            age:
              type: integer
              minimum: 18
```

This part is like Chan detailing the contents of his message – like who it's from (full name), how to contact back (email), and making sure the receiver is old enough (age).

#### Setting Up Operations

Finally, Chan adds instructions for how the message should be sent. He writes:

```
operations: 
  userSignedUp:
    action: send
    channel: 
      $ref: '#/channels/lettertoEarth'
```

This tells his spaceship that it should `send` messages through the `userSignedUp` channel.

### Using AsyncAPI Tools for Validating the Document

After writing his space message plan, Chan uses a tool called AsyncAPI Studio to make sure everything is set up correctly. It's like a helper that checks his work to make sure there are no mistakes.

To use AsyncAPI Studio, Chan would first install it using the command `npm install -g @asyncapi/studio`. Then, he would open the AsyncAPI document in the studio using the command `asyncapi studio my-document.yaml`. The studio would then check the document for errors and provide suggestions for improvements.

### Hands-on Exercise

Chan wants to practice more. He thinks about adding a new property for a username and creating a new channel for messages to Mars. He updates his document with these new details and then uses AsyncAPI Studio to validate his changes.

#### Expected Outcome

After following these steps, Chan should be able to see his updated document in the AsyncAPI Studio. The studio should validate the document and show any errors or warnings.

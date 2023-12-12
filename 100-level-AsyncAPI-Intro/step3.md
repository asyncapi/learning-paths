When Chan has to go back to his planet, he wants to keep talking to Eve. Eve is a bit sad that Chan is leaving, but she's also excited to try sending messages across space. They decide that Chan will learn to write AsyncAPI documents so they can stay in touch.

### Writing an AsyncAPI Document

#### Starting Simple

Chan begins by setting up his space message plan. He writes:

```
asyncapi: 3.0.0
info:
  title: Sending Signal to Eve
  version: 0.1.0
```

This is like Chan saying, "I'm using the `3.0.0` space message rules, and I'm naming my plan `Sending Signal to Eve.`".

#### Making a Message Route

Next, Chan picks a path for his message. He makes a channel called `spaceMessage` with the address `Earth/letter`. Now his plan looks like this:

```
channels:
  spaceMessage:
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
            age:
              type: integer
              minimum: 18
```

Here, Chan is planning what to put in his message, like the sender's full name, and their age.

#### How to Send the Message

Last, Chan writes how to send the message:

```
operations: 
  spaceMessage:
    action: send
    channel: 
      $ref: '#/channels/spaceMessage'
```

This part tells his spaceship to send the message using the `spaceMessage` channel.

### Checking the Document

Chan uses AsyncAPI Studio to make sure his message plan is good. It's like a helper to check for mistakes.

He installs it with `npm install -g @asyncapi/studio` and opens his plan in the studio with `asyncapi studio my-document.yaml`. The studio looks for errors and gives tips.

He also uses the Web version of [AsyncAPI Studio](https://studio.asyncapi.com/) where he can simply paste his document and be able to check if he has any error there.

---

### Chan's Intergalactic Communication Adventure: Your Mission on Capuccinova

#### Prologue: A Galactic Call to Action

You have been selected to assist Chan in his quest to maintain an interstellar friendship with Eve and establish a new connection with a friend on the distant planet Capuccinova. Your knowledge in AsyncAPI will be crucial in bridging these cosmic distances.

#### Chapter 1: The Genesis of a Space Saga

**Your Mission: Crafting Chan's First AsyncAPI Message**

1. **Enter the Command Center**: Open the terminal and type `nano chan-to-eve.yaml` to start crafting an interstellar AsyncAPI document for communication with Eve.
2. **Lay the Foundation**: Create the basic structure for Chan's communication.
   ```yaml
   asyncapi: 3.0.0
   info:
     title: Sending Signal to Eve
     version: 0.1.0
   channels:
     spaceMessage:
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
               age:
                 type: integer
                 minimum: 18
   ```
3. **Insert a Personal Touch**: Add a `spacename` property.
   ```yaml
   spacename:
     type: string
   ```
4. **Seal the Galactic Message**: Save (`Ctrl + O`, `Enter`) and exit (`Ctrl + X`).

#### Chapter 2: Deepening the Cosmic Bond

**Your Mission: Enhancing the Message Structure**

1. **Revisit the Command Center**: Open `chan-to-eve.yaml` again.
2. **Add a Time Stamp**: Implement `timestamp` and `priority` fields.
   ```yaml
   timestamp:
     type: string
     format: date-time
   priority:
     type: integer
   ```
3. **Chronicle the Changes**: Save (`Ctrl + O`, `Enter`, `Ctrl + X`).

#### Chapter 3: Navigating the Starry Seas

**Your Mission: Charting the Message's Course**

1. **Galactic Navigator**: Edit `chan-to-eve.yaml`.
2. **Set the Course**: Define the sending protocol.
   ```yaml
   operations: 
     spaceMessage:
       action: send
       channel: 
         $ref: '#/channels/spaceMessage'
   ```
3. **Confirm the Trajectory**: Save (`Ctrl + O`, `Enter`, `Ctrl + X`).

#### Chapter 4: Expanding to Capuccinova

**Your Mission: Establishing Communication with Capuccinova**

1. **New Horizons**: Create `chan-to-capuccinova.yaml` using `nano`.
2. **Capuccinovan Messaging**: Craft a unique communication channel for this exotic planet.
3. **Bridge the Planets**: Save your Capuccinovan communication plan (`Ctrl + O`, `Enter`, `Ctrl + X`).

#### Chapter 5: Perfecting Distant Dialogues

**Your Mission: Fine-Tuning the Capuccinova Communication Protocol**

1. **Cosmic Engineer**: Open `chan-to-capuccinova.yaml`.
2. **Refine the Connection**: Add operations details for Capuccinova.
   ```yaml
   operations:
     capuccinovaMessage:
       action: send
       channel:
         $ref: '#/channels/capuccinovaMessage'
   ```
3. **Launch the Protocol**: Save your work (`Ctrl + O`, `Enter`, `Ctrl + X`).

#### Epilogue: The Symphony of the Stars

After each chapter, use **AsyncAPI Studio** to validate Chan's YAML documents, ensuring seamless communication with Eve and the new connection to Capuccinova. Your dedication and skills have not only kept a friendship alive across galaxies but also opened new interstellar pathways. The universe feels more connected thanks to your expertise in crafting these cosmic AsyncAPI communications.

#### Review and Intergalactic Comparison:
Compare your final AsyncAPI documents with Chan's original ideas to understand different communication strategies in the cosmos and solidify your understanding of AsyncAPI.
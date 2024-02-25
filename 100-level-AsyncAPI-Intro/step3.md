When Chan has to go back to his planet, he wants to keep talking to Eve. Eve is sad that Chan is leaving, but she's also excited to try sending messages across space. They decide to write AsyncAPI documents to stay in touch.

## Create an AsyncAPI Document

Chan begins by setting up his space message plan.

```yaml
asyncapi: 3.0.0
info:
  title: Sending Signal to Eve
  version: 0.1.0
```

Essentially, Chan is saying, "I'm using the `3.0.0` space message rules, and I'm naming my plan `Sending Signal to Eve.`".

## Message route

Next, Chan picks a path for his message. He makes a channel called `spaceMessage` with the address `Earth/letter`. 

```yaml
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

## Send message

Last, Chan sends the message via the `spaceMessage` channel.

```yaml
operations: 
  spaceMessage:
    action: send
    channel: 
      $ref: '#/channels/spaceMessage'
```

## Validate AsyncAPI document

Chan uses [AsyncAPI Studio](https://studio.asyncapi.com/) to validate that his messages are working. Studio is a tool that checks for mistakes. He can paste his document into Studio to validate his work.

## Generator

Generator automatically writes code in different languages based on Chan's blueprint, saving him time and effort to focus on the real message.

* Install Generator:

```bash
npm install -g @asyncapi/generator
```

* Generate code from your AsyncAPI file: 

```bash
asyncapi generate fromFile my-api.yaml
```

## Exercise 1: Chan's first AsyncAPI message

1. Open the terminal and type `nano chan-to-eve.yaml` to create an AsyncAPI document for communication with Eve.

2. Create the basic structure for Chan's communication:

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

3. Add a `spacename` property:

   ```yaml
   spacename:
     type: string
   ```

4. Save (`Ctrl + O`, `Enter`) and exit (`Ctrl + X`).

## Exercise 2: Message structure

1. Open `chan-to-eve.yaml` again.

2. Add `timestamp` and `priority` fields:

   ```yaml
   timestamp:
     type: string
     format: date-time
   priority:
     type: integer
   ```

3.  Save your changes (`Ctrl + O`, `Enter`, `Ctrl + X`).

## Exercise 3: Charting the Message's Course

1. Edit `chan-to-eve.yaml`.

2. Define the sending protocol:

   ```yaml
   operations: 
     spaceMessage:
       action: send
       channel: 
         $ref: '#/channels/spaceMessage'
   ```

3. Save your changes (`Ctrl + O`, `Enter`, `Ctrl + X`).

## Exercise 4: Establish communication with Capuccinova

1. Create `chan-to-capuccinova.yaml` using `nano`.

2. Add operations details for Capuccinova:

   ```yaml
   operations:
     capuccinovaMessage:
       action: send
       channel:
         $ref: '#/channels/capuccinovaMessage'
   ```

3. Save your work (`Ctrl + O`, `Enter`, `Ctrl + X`).

## Test your work

After each exercise, use **AsyncAPI Studio** to validate Chan's YAML documents. After all, you want to ensure seamless communication with Eve and the new connection to Capuccinova! Thanks to you, Eve and Chan can now keep their friendship alive by communicating across galaxies. 
Eve takes on the role of the problem solver once again and approaches the spaceship. Eve finds Chan, a fellow programming genius from [planet placeholder]. There was a technical glitch in the ship's communication system. 

Eve dives into action with her knowledge of Event-driven architecture and AsyncAPI. Eve plans to develop effective communication between the spaceship's components with Chan.

Eve starts by explaining event-driven architecture (EDA) and how to design eda with AsyncAPI to Chan.

## Event-driven architecture

An event is a change in the system's state that triggers an action to communicate between different services. EDA helps break an app into multiple loosely coupled components communicating through events. EDA is made up of event producers and consumers:

- An event producer detects an event and transmits the event's information to the event consumers through the event channel.
- An event consumer subscribed to an event channel to receive information and process events.

Depending on the use case, each component can act as an event producer, consumer, or both. 

Eve then remembers that she didn't offer Chan a beverage. So, she quickly rushes to make a cup of coffee for Chan. While making coffee, Eve considers a coffee shop as an example of an EDA: a customer(consumer) requests an espresso(event), communicating order details to the barista(producer) as a message. The following process happens,

1. The customer orders an espresso(an event), and the order details are told to the barista(a message).
1. The barista then processes the order and starts making an espresso(a response to an event).

So, event-driven architecture in a coffee shop is like the seamless flow of orders and drinks without everything stopping for one specific thing. It keeps things moving smoothly.

Chan is now curious about how AsyncAPI can help develop event-driven architecture. 

## Event-driven architecture with AsyncAPI

AsyncAPI simplifies defining how to communicate and send messages between different components in an EDA. It offers a way to describe the events, channels, and message formats, making it easier to understand.

AsyncAPI helps you define asynchronous APIs. But what is an asynchronous API?

They are like digital mailboxes where you can send messages without waiting for an instant reply. Rather, when the other person reads your letter and has something to say, they will reply back. To build an EDA where certain actions(events) trigger other actions, Async API helps map out events and their response. 

Chan spots cake in Eve's kitchen and asks for a slice as she likes cakes. While offering her a slice, Eve gives her an example: imagine a birthday party with events like cake cutting and gift opening. These events trigger responses, such as singing when the cake is cut or clapping while opening the gifts.

AsyncAPI helps you organize events that will happen, when they will happen, and how everyone should react to them. For example, when the cake is cut, AsyncAPI guides you in singing the birthday song. It also enables creating a party schedule, like cutting the cake at 6 pm and opening gifts at 7 pm.

Here are reasons why using AsyncAPI enhances EDA design:

- AsyncAPI plans and describes each event and its corresponding reactions across different components.
- AsyncAPI facilitates communication between different components for seamless information exchange.
- AsyncAPI allows components to complete tasks independently without waiting.

Eve further tries to help Chan understand how AsyncAPI can help improve communication between microservices.

## Microservices with AsyncAPI

Each microservice represents a specific function in a microservices architecture, and different microservices communicate using events. For example, one team is responsible for baking the birthday cake, and the other is responsible for decorating the room. These teams need to talk to each other to share their progress.

AsyncAPI helps different microservices communicate with each other. For microservices to talk to each other, they would have to:

- Define how to send and receive messages
- Schedule when to send these messages
- Ensure consistent language in messages

AsyncAPI ensures that each microservice knows what information it will receive, how it will receive, and what it should do with it. It also helps document interactions between microservices to help developers understand and integrate them.

Now that Eve and Chan have gotten coffee, they are ready to go inside Chan's spaceship to develop and improve her spaceship's communication system.
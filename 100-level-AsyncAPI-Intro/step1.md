Eve takes on the role of the problem solver once again and approaches the spaceship. Inside, Eve finds Chan, a programming genius from Brownieterra. There was a technical glitch in the ship's communication system.

Eve dives into action with her knowledge of Event-driven architecture and AsyncAPI. Eve plans to develop effective communication between the spaceship's components with Chan.

Eve starts by explaining event-driven architecture (EDA) and how to design EDA with AsyncAPI to Chan.

## Event-driven architecture

An event signifies a change in the system's state that triggers an action to communicate between different services. EDA breaks down an app into multiple loosely coupled components communicating through events. These components consist of event producers and consumers:

* An event producer detects an event and transmits the information to the consumers through the event channel.
* An event consumer subscribed to an event channel to receive information and process events.

Each component can act as an event producer, consumer, or both.

Eve then remembers that she didn't offer Chan a beverage. So, she quickly rushes to make a cup of coffee for Chan. While making coffee, Eve considers a coffee shop as an example: a customer(producer) requests an espresso(event), communicating order details to the barista(consumer). The following process happens,

1. The customer orders an espresso(an event), and the barista receives the order details.
1. The barista then processes the order and starts making an espresso(a response to an event).

So, event-driven architecture in a coffee shop is like the seamless flow of orders and drinks without everything stopping for one specific thing. It keeps things moving smoothly.

Chan is now curious about how AsyncAPI can help develop event-driven architecture.

## Event-driven architecture with AsyncAPI

"AsyncAPI simplifies the definition of communication and message exchange among different components in an Event-Driven Architecture (EDA). It provides a structured way to describe events, channels, and message formats, enhancing overall understanding.

AsyncAPI simplifies the definition of communication and messages between different components. AsyncAPI offers a structured way to describe the events, channels, and message formats.

AsyncAPI helps you define asynchronous APIs. But what is an asynchronous API?

They are like digital mailboxes where you can send messages without waiting for an instant reply. When the other person reads your letter and has something to say, they will reply. 

Async API helps map out events and their response in an EDA.

Chan spots cake in Eve's kitchen and asks for a slice as she likes cakes. While offering her a slice, Eve gives her an example: imagine a birthday party with events like cake cutting and gift opening. These events trigger responses, such as singing during the cake cutting or clapping while opening the gifts.

AsyncAPI helps organize events, determining when they'll occur and how everyone should react. For example, during the cake cutting, AsyncAPI guides in singing the birthday song. It also enables the creation of a party schedule, like cutting the cake at 6 pm and opening gifts at 7 pm.

Here are reasons why using AsyncAPI enhances EDA design:

* AsyncAPI plans and describes each event and it corresponding reactions across different components.
* AsyncAPI facilitates communication between different components for seamless information exchange.
* AsyncAPI allows components to complete tasks independently without waiting.

Eve further assists Chan in understanding how AsyncAPI can enhance communication between microservices."

## Microservices with AsyncAPI

In a microservices architecture, each microservice represents a specific function. Different microservices communicate using events, much like teams collaborating on tasks. For example, one team handles baking the birthday cake, while another focuses on decorating the room. These teams must communicate to share their progress.

AsyncAPI helps different microservices communicate with each other. For microservices to talk to each other, they would have to:

* Define how to send and receive messages
* Schedule when to send these messages
* Ensure consistent language in messages

AsyncAPI ensures that each microservice knows what information it will receive, how it will receive it, and what it should do with it. AsyncAPI helps document interactions between microservices for developers developer understanding and integration.

Now, with coffee in hand, Eve and Chan are ready to step into Chan's spaceship to enhance its communication system.
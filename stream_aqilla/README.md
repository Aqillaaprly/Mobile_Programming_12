# PRACTICUM 12 
## Practical 1 : Dart Streams

### Question 1 
<p align="center">
  <img src="img\q1.png" width="250" alt="1" />
</p> 

### Question 2
<p align="center">
  <img src="img\q2.png" width="250" alt="1" />
</p> 

### Question 3 
<p align="center">
  <img src="img\q3.png" width="250" alt="1" />
</p> 

**Explanation of yield**

The keyword yield* is used in an async* function to emit (forward) all values from another stream into the current stream. Instead of sending one value at a time, yield* passes every event produced by another stream.

**Explanation of the Code**

The function getColors() returns a stream of colors.
It uses Stream.periodic to generate a new color every 1 second.
The index t % colors.length ensures the colors loop repeatedly.
The yield* keyword forwards all values from the periodic stream so the function outputs each generated color as its own stream event.

### Question 4 
<p align="center">
  <img src="img\q4.gif" width="250" alt="1" />
</p> 

### Question 3 
<p align="center">
  <img src="img\q5.gif" width="250" alt="1" />
</p> 

* listen() uses a callback and allows the program to continue running while listening to stream events.
* await for waits for each event in sequence, making the function process stream values one at a time like a loop.

## Practical 2 : Stream controllers and sinks
### Question 6 
**Explain the meaning of the code steps 8 and 10!**
* Step 8 sets up both the color stream and the number stream so the UI can update automatically when new data arrives. 
* Step 10 generates a random number and sends it to the stream, causing the displayed number to update.
<p align="center">
  <img src="img\q6.1.gif" width="250" alt="1" />
</p> 

### Question 7 
**Explain the meaning of the code steps 13 to 15!**
* Step 13 creates a method that can intentionally trigger an error in the stream.
* Step 15 changes the button so it sends an error to the stream instead of a number.
<p align="center">
  <img src="img\q7.gif" width="250" alt="1" />
</p> 

## Practical 3 : Injecting data into streams
### Question 8 
**Explain the meaning of the code steps 1-3!**
* Step 1 declares a placeholder variable that will hold the stream transformer's rules.
* Step 2 defines the transformer's logic: multiply good numbers by 10 and convert any errors into the number -1.
* Step 3 applies the transformer to the stream, so the UI's listener now receives the modified (multiplied or error) data.


<p align="center">
  <img src="img\q8.gif" width="250" alt="1" />
</p> 


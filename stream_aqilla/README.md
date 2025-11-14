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

# Practicum 12 : Stream
## Practical 7 : BLoC Pattern 
### Question 13
**Explain the purpose of this lab! Where is the BLoC pattern concept located?**

This lab's purpose is to separate your app's **logic** from its **UI** using the BLoC pattern. The **BLoC concept** is located in how your two files work together: `random_bloc.dart` is the "brain" (the BLoC) that handles logic (like making a random number) using **Sinks** (for input) and **Streams** (for output), while `random_screen.dart` is just the "view" (the UI) that sends events to the BLoC and listens for results with a `StreamBuilder`.

<p align="center">
  <img src="img\q13.gif" width="250" alt="1" />
</p> 
# PRACTICUM 
## Practical 1 : Creating Mock API service
### Question 1 
<p align="center">
  <img src="img\q1.1.jpeg" width="250" alt="1" />
</p> 


## Practical 2 : Sending Data to Web Service (POST)
### Question 2 
<p align="center">
  <img src="img\q2.1.gif" width="250" alt="1" />
</p> 

The application fetches pizza information from an external REST API through an asynchronous HttpHelper. The results are displayed with a FutureBuilder and shown in a scrollable ListView, where each entry presents the pizza’s name, description, and price. The list updates automatically whenever the API returns new data.


## Practical 3 : Updating Data in Web Service (PUT)
### Question 3 
<p align="center">
  <img src="img\q3.1.gif" width="250" alt="1" />
</p> 

## Practical 4 : Deleting Data from Web Services
### Question 4 
<p align="center">
  <img src="img\q4.1.gif" width="250" alt="1" />
</p> 

For Question 4, each pizza item can be removed using Flutter’s Dismissible widget, where swiping an entry immediately takes it off the screen, triggers a DELETE request to the REST API, and then displays a confirmation snackbar to notify the user.


---


# PRACTICUM 13 
## Practical 1 : Converting Dart model to JSON 

### Question 1 
<p align="center">
  <img src="img\q1.png" width="250" alt="1" />
</p> 

### Question 2
<p align="center">
  <img src="img\q2.jpeg" width="250" alt="1" />
</p> 

### Question 3
<p align="center">
  <img src="img\q3.jpeg" width="250" alt="1" />
</p> 


## Practical 2 : Handle JSOn data compatibility 
### Question 4
<p align="center">
  <img src="img\q4.jpeg" width="250" alt="1" />
</p> 

## Practical 3 : Handling JSON errors 
### Question 5
**Safer Code**
The code is safer because it checks and validates incoming input, manages null cases, prevents unexpected application failures, and properly handles parsing issues. This helps the app stay stable even when it receives incomplete or invalid information.

**More Maintainable Code**
The code is easier to maintain thanks to its well-organized structure, clear naming, and separation of responsibilities. Other developers can quickly understand, modify, or enhance the code without risking unintended impacts on other components.
<p align="center">
  <img src="img\q4.jpeg" width="250" alt="1" />
</p> 


## Practical 4 : Shared Preferences
### Question 6
<p align="center">
  <img src="img\q6.gif" width="250" alt="1" />
</p> 

## Practical 5 : Acces the filesystem with path_privider
### Question 7
<p align="center">
  <img src="img\q7.jpeg" width="250" alt="1" />
</p> 

## Practical 6 : Accessing the filesystem with directories 
### Question 8 
**Explain the meaning of the code in steps 3 and 7!** 
The writeFile() function stores text in a file using writeAsString(), and because it uses await, the file-writing process finishes before any remaining code runs. If the operation succeeds, it returns true, while any errors are safely handled in the catch block, preventing crashes and returning false. In Step 7, when the Read File button is pressed, the app reads the saved file and displays the contents, including the user's name, student ID (NIM), and the pizza menu.

<p align="center">
  <img src="img\q8.gif" width="250" alt="1" />
</p> 

## Practical 7 : Storing data with encryption/descryption 
### Question 9
<p align="center">
  <img src="img\q9.gif" width="250" alt="1" />
</p> 

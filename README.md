# Project-Two
Welcome to my first CRUD web application 
The idea was to build a basic web application for people who enjoy playing video games to post and discuss games they like (or not), recent games they've played, their thoughts on certain games currently in development or out on the market, etc. 

The design layout is kept pretty simple with the primary focus being to categorize the games, but that presented its own issues. 

This is the wireframe
https://whimsical.com/7Yj6PA4Rm5NBeu14XopN3P

This is the flowchart
https://whimsical.com/UYSEa3jTufo3Zz88uQitJc

# Approach Taken and problems encountered

After setting up a directory with the required files, the next step was to ensure that it was able to be pushed up to heroku and that heroku would properly display the website. Once a database with the correct name corresponding to the purpose of the website, tables were created for the two main components of the application: games and users. 

The next step was establishing a basic layout for the browser and ensuring that data was being properly stored and called upon in the database. After that was complete, I focused on ironing out the browser's layout. 

Shaping the layout required the use of css and javascript, with javascript being used in particular for the creation of the dropdown menu. A problem occured where the same content for the dropdown menu would be shown for all the buttons. 

A grid layout was used in order to display the most ammount of uploaded games at one time without the user having to scroll down.

Another problem encountered was having to ensure that heroku would properly display the broswer whenever new data and source code was pushed but eventually this was resolved to where this was no longer an issue for the rest of development. 

The main issue with this application as it currently stands is that any user with an account can edit or delete shared games as I could not come up with a solution to track which users created which post. 

# Goals Missed 
was not able to implement a search bar 
was not able to implement a function to display linked videos without users having to click the link itself. 









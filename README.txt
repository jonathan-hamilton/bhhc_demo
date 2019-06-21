Project Title:
BHHC Software Engineer I Project

Author/Date:
Jonathan Hamilton 2019-06-19

Motivation:
To write an application that displays three or more reasons I would like to 
work at BHHC that shows my understanding of design patterns and best practices in coding.

Tech/Framework used:
Spring Boot, JPA, Hibernate, h2 database with a jQuery front-end.

Installation:
Download from github and import as a Maven project to run.

Features:
A single page application that lists different reasons I would like to work at BHHC. The reasons
are listed in the following jQueryUI widgets:

Accordian,
Button (alert),
Tabs
Slider (opacity),
Spinner,
Menu

The h2 database is initialized with values from a data.sql file in the resources folder. The values (reasons) 
are captured in an jQuery/ajax method call, then placed in the various widgets with Javascript/jQuery. 

Decisions:
I chose to use Spring Boot because of it's ability to get up and running quickly and the MVC features. 
I chose the h2 database because it is lightweight and suited for this application and Hibernate/JPA because of the
database functionality that is gained with minimal coding. JQuery was chosen because 
of the ease of DOM manipulation and jQueryUI for the various widgets and CSS themes.
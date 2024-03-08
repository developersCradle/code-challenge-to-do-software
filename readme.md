
<p id="logos" align="center">

<img src="kide.png" style="float:left; margin-right:10px;" width="250"  height="70">
    
<img src="topconHealthCare.jpg" style="float:left;" width="250" height="70">

</p>

# To-do Software

## Task Eng

Create simple To-Do list application.

With the program, you can add new tasks to the list and view the contents of the list.
Tasks on the list can also be edited, deleted and marked as done.
The task has a description, deadline date, and information on whether the task has already been completed.

Implementation in Java using the technologies and user interfaces of your choice, but without use of interface builder tools.

The implementation does not have to be ready, and it does not have to have all the features, it is enough that the idea of ​​the structure and operation of the program is clear.

## Task Fin

Tarkoituksena olisi tehdä yksinkertainen To-Do lista ohjelma.

Ohjelmalla voi lisätä uusia tehtäviä listalle ja katsoa listan sisältöä.
Listalla olevia tehtäviä voi myös editoida, poistaa ja merkitä tehdyksi.
Tehtävällä on tietoina selite, deadline päivä, sekä tieto siitä onko tehtävä jo suoritettu.


Toteutus Java kielellä käyttäen haluamiasi tekniikoita ja käyttöliittymiä mutta kuitenkin ilman käyttöliittymä builder-työkaluja.
Toteutuksen ei tarvitse olla valmis, eikä siinä tarvitse olla kaikkia ominaisuuksia, riittää että idea ohjelman rakenteesta ja toiminnasta selviää.

<hr>

Small demonstration project of the To-Do list. `.war` runnable by Tomcat.

<img id="kuva1" src="kuva2.PNG" alt="alt text" width="800"/>

<img id="kuva2" src="kuva1.PNG" alt="alt text" width="800"/>

## How to run

> Since build tool is not currently present, we are doing this manually. This is legacy stuff and recommended **only** for small projects!

> Requirements for running locally
> 1. Apache Software Foundation Tomcat. Tested with [Tomcat 9.0](https://tomcat.apache.org/download-90.cgi)

1. Pull repository
2. Go to project folder `JspMysqlBootstrapTODO`
3. Create `classes` folder. With tool of your choice 
`mkdir ./WebContent/WEB-INF/classes`
4. Compile needed `java` code 
`javac -d WebContent/WEB-INF/classes src/com/dbconnectiontools/*.java` 
5. Got to `WebContent` folder and build `.war` file for Tomcat server.
`jar -cvf JspMysqlBootstrapTODO.war *`
6. Deploy your new WAR file by copying it to `<tomcat-install-directory>\webapps`. In my case it was, 
`C:\Program Files\Apache Software Foundation\Tomcat 9.0\webapps`
Tomcat should be running at this moment!
Give it some time to make the deployment. You will see new folder appearing into **webapps** folder with your **WAR** file name
7. Visit your new app. You can access it with name of your WAR file. Mine was:
`http://localhost:8080/JspMysqlBootstrapTODO/`


## How to run(other way)

1. Import into Eclipse
2. Export as `.war` and deploy in into Tomcat. (in step 6.)

# What I Learned

* Clarifying what should be focused in tight time frame
* Adapting to use SQLite, JSP(java), bootstrap, Tomcat
* Also having fun, dumping technologies together





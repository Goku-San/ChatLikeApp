# README

This is yet another chat application :)
This is a tutorial I found on this [webstie](https://iridakos.com/programming/2019/04/04/creating-chat-application-rails-websockets)

Now, what I did differently is that I fixed a couple of bugs, added some basic tests and code to
pass the tests, etc...

* Requirements
  *Ruby version*  **2.6.6**
  *Rails version* **5.2.4.x**

  **NOTE** You can also use *rails 6*, but *without yarn and webpack*.
           You will have to delete app/javascript folder and create the old structure of rails 5.
           That's how I did it! Its not hard.

  *DB* **MariaDB(mysql)** but you can use what ever you like.
  **NOTE** Don't forget to modify the config/database.yml file if need be.

* To start clone the repo
  *create the databse and run migrations* ```rails db:create && rails db:migrate```
  *run the tests*                         ```rails test```
  **NOTE** If you get any errors about the test tables not existing run ```rails db:test:prepare```

  *Tests are default rails tests, nothing special, except me writing them for the first time :),*
  *because I don't use the scaffold command, so I don't know how they look out of the box.*

* Finally run ```rails server``` Check the app :D

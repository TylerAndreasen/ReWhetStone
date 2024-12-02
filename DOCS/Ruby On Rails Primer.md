# **Ruby On Rails: A Primer**

### **Contents**

1. Overview
2. Ruby, Rails, and Filetypes

### **1. Overview**

[Ruby on Rails](https://rubyonrails.org/) is a Web Application framework built using the programming language [Ruby](https://www.ruby-lang.org/en/). While an in-depth knowledge of Ruby is not required to effectively use Ruby on Rails, some familiarity will be necessary. Frequent reference will likely need to be made on your end to the Rails documentation, while Ruby documentation will be of less assistance after learning the basic syntax (which is fairly minimal to begin with).

From a beginner's perspective, Rails has been a pretty easy to use web framework. I have certainly had to go looking for help and been confused by things, but issues I have faced have been solvable.
The power of the Rails framework is the ease with which a huge amount of the structure of a typical web app can be generated, generally in just a couple of commands. This document is not a walk-through of how to create a basic web server (deployable or not), but I will highlight some key commands. 
I should also note at this time that all of my development experience with the Ruby on Rails framework has been completed in the context of a Docker Container, as this was the context in which my professor wanted to teach the class (avoiding a million environment issues across every student).

### **2. Ruby, Rails, and Filetypes**

The other docs within this directory will use `Rails` to specify the `Ruby on Rails Framework` and `Ruby` to refer to the standard `Ruby language`. This is mildly important as various files (many automatically generated) will either be standard `Ruby` files (extention `.rb`), or `Embedded Ruby files`, with the extension `.erb`. Many of these `Embedded Ruby` files will embed Ruby code into `html` files, with the extension `.html.erb`, as a signal that, while they are not valid html on disc, but the Rails framework will execute the Ruby in context to dynamically generate the implied html tags to return as an HTTP response.

### **3. Basic Commands**

There are a number of basics Rails commands that you will need to get an app running.

1. Creating the application:

`rails new application_name`

This creates all of the directories and files necessary to get a basic web application started. Note: this command does not immediately allow an end user to connect and view pages. In time, I will write explanations of the Views and Routes of Ruby on Rails, of the Models and Controllers of Ruby on Rails, and of the Basics of Ruby on Rails Databases, each of which are key pillars of how these web servers operate. For now this will suffice:

- Record    : An element of a Database table, each of which is indexed and represents some object, connection, or similar.
- Model     : A description of how records must be formatted. Ex. A user account Model requires an email of a valid format, a name, perhaps a username for display on the site, and any number of other data based on your app's needs.
- View      : HTML Embedded Ruby code that generates plain HTML data, which is sent to a user.
- Controller: A file, linked to a Model, that decides how to respond to HTTP requests related to that model (or the application as a whole in the case of the `application_controller.rb` file).
- View(2)   : Several view files are generated for every Model (alongside a single Controller). These Views are largely what make up the differences between the visible responses from the Controller. I say mostly because the default implementation of a Rails server will layer several view together, the outter most layers being universal across the server, while inner layers specific to a model and needed functionality.

1. Creating a model:

`rails generate scaffold model_name field:type field:type`

This creates much (though not all) of what is necessary to define a new model within your Rails server. The first three tokens are non-negotiable (Note: `generate` can be substituted with `g`). The final three are, sensibly, examples. In the case of the last two, fields of the model are defined as name:type pairs. Names can be generally be any string, but there is a defined list of database types for Rails. I have a list on a local file, however, I am going to encourage you to seek out offical documentation for the supported list of types in the version of Rails you are using. I am not aware of a maximum number of fields that a model can have (I have maybe used a dozen), though I doubt any inherent limit will be limiting in most cases.

After running your version of the command, you will notice that a number of directories and files were created. Namely, `model_name_controller.rb`, `model.rb`, and several files within the `views/model_name/` directory. In order these are your Controller, Model, and Views, all of which rely on Ruby. IMPORTANT:: The above command does not modify your database ??TO BE VERIFIED or the database `schema.rb`??. What it does do is create a "migration file", in the `db/migrations` directory of the server. Here, you can view the generated code that defines how the database will be structured.

2. Setting up the database (herein db)

`rails db:migrate`

This short command will likely be one of your more frequenly run commands (after the next command in this list). This command tells the server to update the structure of the database (potentially containing many tables). This command will apply the changes implied by migrations (for example, the migration generated in the previous command). These changes are things like adding or removing columns, and adding tables. This does not directly make changes to the data in a db, just the structure of tables. See the `NYI Ruby on Rails DB.md` for more on database management in Ruby on Rails.

3. Running the server

`rails server -b 0.0.0.0`

This command is possibly my most used command in rails, so much so that it has its own AutoHotKey on my system, (Left Alt + Left Shift + b).
NOTE:: If you did not run `rails db:migrate` before attempting to run the server, a start up message will warn you of this, and most any request to the server will be rejected (I cannot guarentee that all requests will be functionally rejected). 
NOTE:: When you want to spin the server down, but don't want the console to go away, focus the console and hold Ctrl+C. This will gracefully shutdown the web server, while keeping the console and backend running.
After booting the server (and waiting a moment, the start up process can take a moment, and does not always immediately signal that is has completed in the console. I find that pressing Enter with the console focused will sometimes reveal that some or all of the server startup output has been generated but was not displayed for unknowable reasons).
Once the command has finished, you should be able to connect to the server. I connect via the link "http://localhost:3000" (which I have bound to Left Alt + Left Shift + l). It is important to note that your milage will vary, based on how you are connecting to the server, and the port that you assigned the server too. In my case I assigned it the IP 0.0.0.0 and mapped the port 3000:3000 inside of Docker.
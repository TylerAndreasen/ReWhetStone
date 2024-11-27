# **Ruby On Rails: A Primer**

### **Contents**

1. Overview
2. Ruby, Rails, and Filetypes

### **1. Overview**

[Ruby on Rails](https://rubyonrails.org/) is a Web Application framework built using the programming language [Ruby](https://www.ruby-lang.org/en/). While an in-depth knowledge of Ruby is not required to effectively use Ruby on Rails, some familiarity will be necessary. Frequent reference will likely need to be made on your end to the Rails documentation, while Ruby documentation will be of less assistance after learning the basic syntax (which is fairly minimal to begin with).

From a beginner's perspective, Rails has been a pretty easy to use web framework. I have certainly had to go looking for help and been confused by things, but issues I have faced have been solvable.
The power of the Rails framework is the ease with which a huge amount of the structure of a typical web app, generally in just a couple of commands. This document is not a walk-through of how to create a basic web server (deployable or not), but I will highlight some key commands. 
I should also note at this time that all of my development experience with the Ruby on Rails framework has been completed in the context of a Docker Container, as this was the context in which my professor wanted to teach the class (avoiding a million environment issues across every student).

### **2. Ruby, Rails, and Filetypes**

The other docs within this directory will use `Rails` to specify the `Ruby on Rails Framework` and `Ruby` to refer to the standard `Ruby language`. This is mildly important as various files (many automatically generated) will either be standard `Ruby` files (extention `.rb`), or `Embedded Ruby files`, with the extension `.erb`. Many of these `Embedded Ruby` files will embed Ruby code into `html` files, with the extension `.html.erb`, as a signal that, while they are not valid html on disc, the Rails framework will execute the Ruby in context to dynamically generate the implied html tags to return as an HTTP response.

### **3. Basic Commands**

There are a number of basics Rails commands that you will need to get an app running.

1. Creating the application:

`rails new application_name`

This creates all of the directories and files necessary to get a basic web application started. Note: this command does not immediately allow an end user to connect and view pages. In time, I will write explanations of the Views and Routes of Ruby on Rails, of the Models and Controllers of Ruby on Rails, and of the Basics of Ruby on Rails Databases, each of which are key pillars of how these web servers operate. For now this will suffice:

- Record    : An element of a Database table, each of which is indexed and represents some object, connection, or similar.
- Model     : A description of what records must be formatted as. Ex. A user account Model requires an email of a valid format, a name, perhaps a username for display on the site, and any number of other data based on your needs.
- View      : HTML Embedded Ruby code that generates plain HTML data, which is sent to a user.
- Controller: A file, linked to a Model, that decides how to respond to HTTP requests related to that model (or the application as a whole in the case of the `application_controller.rb` file).
- View(2)   : Several view files are generated for every Model (alongside a single Controller). These Views are largely what make up the differences between the visible responses from the Controller. 
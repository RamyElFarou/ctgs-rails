# Conference Travel Grant System
The Conference Travel Grant System is being implemented as a final deliverable for SEG3102. 

## Synopsis
CTGS aims to provide the University of Ottawa with an automated system for processing travel grant applications.


## Application Details
Framework used: *Ruby on Rails*

IDE: *Cloud9* http://c9.io/

Package Manager: Automatically configured Ruby Gems will be stored in the Gemfile. We will not need any new gems for this implementation.

Database: Postgresql

### Setup Details
Command in c9 for creating a rails application: `rails new ctgs`.

Rails-MVC file architecture is automatically created following this command. Please
consult the github repository to explore the file structure.

### Current Tasks
* Create Models for all entities in Key Abstraction
  * Create corresponding migration file for each model.
  * A key note to remember: *Any time you want to make a change to the DB, you must create a migration file*
  * ActiveRecord uses this information to map the changes to the corresponding model and carry them through in your database.
  * To create a standalone migration file (for db modification purposes), use `rails generate migration migration_name`
* Create a Controller for each Model
  * requesters_controller.rb is the correct naming convention
  * Create each method (action) that we will use on the corresponding model (new, create, update...)

### Model/Migration Example - requester.rb 
To generate a model file automatically, use: `rails generate model model_name'<return>
This will automatically create the model file model_name.rb in the correct directory.
It will also generate the corresponding migration file. 
* Models, Views, and Controllers are found under ctgs/app/...
* Migration files are found under ctgs/db/migrate/... 
```
// Requester Model
class Requester < ActiveRecord::Base
    validates :email, :password, :student_id, presence: :true // Requester won't be added to DB without the parameters defined
    belongs_to :supervisor // rails helper method for creating a one-to-one relationship.
end

//Migration for Creating a Requester table

class CreateRequesters < ActiveRecord::Migration
  def change    // method for "changing" the current structure of our database
    create_table :users do |t|
      t.string :student_id
      t.string :email
      t.integer :supervisor_id // this is how we implement an association in the database using a foreign key
    end
  end
end
```
When the migration file is ready, we may migrate the content to our database using `rake db:migrate`<return>
This command will tell ActiveRecord::Migration to go through your migration files and check which ones haven't been migrated.

### Controller Example - requesters_controller.rb
```
class RequestersController < ApplicationController
    //this is active on the page for creating a requester
    //this is crucial for the 'new' view, because you need to pass this instance in order to make it available.
    def new 
        @requester = Requester.new 
    end
    
    def create //responds to new because of the
        @requester = Requester.new(user_params) #white-list what is being passed through, we will need to define the method user_params 
         if @requester.save //this will only return true if our model validations pass
           flash[:success] = "Welcome to the alpha blog #{@user.username}"
           redirect_to requester_path(@requester) // theres no view for this action, so we must define a redirect
         else
           render 'new'
    end    
    
    
end
```


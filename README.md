# HDFFA Partner Keeper

A administrative tool for HDFFA staff members to manage their partners, sponsored by the
[High Desert Food and Farm Alliance](https://www.hdffa.org).

## Expectations

This is a Rails 5.x app with Ruby \~2.6 and PostgreSQL.
This is a Rails 5.x app with Ruby \~2.6 and PostgreSQL

## Environment Setup
### Installing [RVM](https://rvm.io/rvm/install):
  Mac:
  1. Make sure that you have [brew](https://brew.sh/) installed by running:\
      `brew --version` and it should return something like: `Homebrew 2.5.6`
  1. Go to [RVM](https://rvm.io/rvm/install) and follow step by step:
      ### If you get Errors when walking through the steps follow instructions below:

      1. If the first command to install gnupg and gnupg2 do not work:
          1. Run `gpg --version` if it returns something like `gpg (GnuPG) 2.2.23`\
              Then everywhere you see `gpg2`, type `gpg` instead.

              Ex: `gpg --keyserver hkp://pool.sks-keyservers.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB`

          1. If after you run: `gpg --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB`\
            It returns: `gpg: keyserver receive failed: No name`
                1. Run:\
                  `gpg --keyserver hkp://pool.sks-keyservers.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB`
                1. Followed by:\
                  `\curl -sSL https://get.rvm.io | bash -s stable`
                1.  It should return:\
                  `Thanks for installing RVM 🙏`

              ### RVM is now Installed

          1. Run: `source /Users/<your_username>/.rvm/scripts/rvm`
          1. Confirm RVM installed: `which rvm`\
            It should return: `/Users/<your_username>/.rvm/bin/rvm`
          1. Run `rvm install 2.6.6` to install the correct version of Rails necessary for this project


After cloning this repository and `cd`ing into it, get up and running with:

1. `bundle install`
1. `rails db:setup`
1. `rails s`

## Development

There are a few steps to get up and running in development.

### Customize `.env`

* `RECAPTCHA_SITE_KEY`
* `RECAPTCHA_SECRET_KEY`

See _.env.example_ for a complete list of expected environment variables.

### TODO

## Testing

This app is using minitest / Rails default tests. Run the suite with:

`rails test`

Note: There is a _Guardfile_ should you wish to use guard.

## Production

There is a staging and production environment hosted by Heroku.

```
heroku git:remote -a hdffa-directory-staging
git remote rename heroku staging
heroku git:remote -a hdffa-directory
git remote rename heroku production
```

By renaming the remotes, you can then deploy with

```
git push staging
git push production
```

Configure env vars in staging and production:

* `RECAPTCHA_SITE_KEY`
* `RECAPTCHA_SECRET_KEY`

<br>

## To Import new data:

LOCALHOST:
1. Tear down/clear out the Database:\
 `rails db:reset`
2. Recreate the tables:\
`rails db:migrate`
3. Import the data:\
`rails db:import_partners`

HEROKU STAGING:
1. Tear down/clear out the Database:\
`heroku pg:reset -rstaging`
2. Recreate the tables:\
`heroku run rails db:migrate -rstaging`
3. Import the data:\
`heroku run rake db:import_partners -rstaging`
4. Import seeded data:\
`heroku run rake db:seed -rstaging`


<br>

## To add new Data Fields:
Example: 
Add "Procurement" and "Featured_Listing" to Partner Data 

1. Create a new Model: 

    Example: 
    Adding a featured_listing field to Partners:\
    `rails g model featured_listing name:string`\
    Run the migration to reflect the changes in the database:\
    `rails db:migrate`

2. Add Relationship associations to Models:
*[List of Associations](https://edgeguides.rubyonrails.org/association_basics.html)

    Example: 
    * Inside app/models/partner.rb add: 
      ```ruby 
      belongs_to :featured_listings, optional: true
      ```
    * Inside app/models/featured_listing.rb add:
      ```ruby 
        has_many :partners
      ``` 
      within class definition

3. When your New Field has a many->many relationship with Partner: Choose a.

   When your New Field has a one->many relationship with Partner: Choose b.

    a. Create a Join table using a Migration:\
        `rails g migration CreateProcurementsPartnersJoinTable`

      * Run the migration to reflect the changes in the database:\
          `rails db:migrate`

      * Go to "routes.rb" and add: 
          `resources :procurements` within the `namespace: admin`

      * Go to "lib/tasks/db.rake" and add:
        ```ruby
        procurement_names = val['Procurement'].to_s().split(', ')
          procurement_names.each do |procurement_name|
            unless procurement_name.blank?
              procurement = Procurement.find_or_create_by(name: procurement_name)
              procurement.partners << partner
            end
          end
        end 
        ```

    b. Generate a migration to create featured_listing_id into the partner table:\
        ```rails generate migration AddFeaturedListingToPartners```

      * Add the following line to the new migration file inside "db/migrate/(ordered by date)":

        ```ruby
        class AddFeaturedListingToPartners < ActiveRecord::Migration[5.2]
          def change
              add_reference :partners, :featured_listing
          end
        end
        ```
      * Run the migration to reflect the changes in the database:
        ```rails db:migrate```

      * Open your schema file "db/schema.rb" Now you can see "featured_listing_id" column in "partners" table

      * Generate one more migration for creating the foreign key:

        * Add "featured_listing_id" as a foreign key into the partner:\
          Run: ```rails g migration AddForeignKeyToPartner```

        * Add the following line to the new migration file inside "db/migrate/(ordered by date)":
          ```ruby
          class AddForeignKeyToTask < ActiveRecord::Migration[5.2]
            def change
              add_foreign_key :partners, :featured_listings```
            end
          end
          ```
        * Go to "lib/tasks/db.rake" and add:
          ```ruby
          featured_listing_name = val['Featured Listing']
            unless featured_listing_name.blank?
                featured_listing = FeaturedListing.find_or_create_by(name: featured_listing_name)
                featured_listing.partners << partner
              end
          end
          ```
      * Run the migration to reflect the changes in the database:
        ```rails db:migrate```
    *Refer to the "To Import New Data" section in the README

5. Go to the "app/views/admin/partners/show.html.haml" file and add code wherever you want to see new field   appear: 

6. Refer to the "To add new Data Fields" Section inside this README to learn how to tear down the database and import  new 

<br> 

## To generate a new Controller:
Run: `rails g controller <path/<controller_name> <action>`

Example: `rails g controller admin/featured_listings create`


## To generate a new Model:
Run: `rails g model <model_name> <attributes></attributes>name:string`\
To undo  creating a model:\
`rails destroy model featured_listing`

## To create a new user role:
In *user.rb*, the user model, add a role to the roles enum

In *application_controller.rb*, in controllers, you may need to edit permissions given to certain roles. For example, for admin we have the function
`def restrict_unless_admin`
  `redirect_to(root_url, alert: 'Access denied.') unless current_user.admin? || current_user.superadmin?`
`end`
Were you can adjust any admin restricted view through the controllers by role. You can add roles with `||` or remove roles from functions like this. If you write another function to restrict by role, you can add that function to the top of the controller you would like to affect. The way the above code is implemented in a controller is with the line:
`before_action :restrict_unless_admin`

Many role restrictions are defined within views *(you may want to change this)*
Check the following files for editing view restrictions:
  **application.html.haml* in views
  *any of the *show.html.haml* files for each model view
  *any of the *index.html.haml* files for each model view


Note: See _.env.example_ for a complete list of expected environment
variables that need set in both staging & production environments.
&copy; 2020 Yong Joseph Bakos and Brayden Brown. All rights reserved.

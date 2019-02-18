# pm_tool
## Project Management Tool

### Prerequisites
1. ruby-2.5.1
2. rails 5.2.1
3. postgres database

### Steps to Setup
1. run `git clone git@github.com:sujay-gavhane/pm_tool.git` command.
2. run `bundle install` command in root of the project directory.
3. Create database.yml file inside config folder with `postgresql` as database adapter.
    a. your database.yml file should contian like this.
      - `development:`
         - `adapter: postgresql`
         - `pool: <pool size>`
         - `timeout: 5000`
         - `username: <postgres username>`
         - `password: <postgres password>`
         - `database: <database_name>`
         - `timeout: 5000`
4. Create .env file in the root of the project directory.
  a. Inside that file create 2 environment virables for ADMIN_EMAIL and ADMIN_PASSWORD. It should look like this
    - `ADMIN_EMAIL='<admin email address>'`
    - `ADMIN_PASSWORD='<admin password>'`
5. run `rake db:create` command
6. run `rake db:migrate` command
7. run `rake db:seed` command
8. Start the rails server by `rails server` command
9. In browser open `http://localhost:3000` and your app is running and ready to use.

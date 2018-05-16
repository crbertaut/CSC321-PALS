# Project Instructions
## Local
• Ask Clara Bertaut to give ownership to one of the members.

• Be added as a collaborator to the github repo.

• Open c9 and create a workspace for the project.

• Open the workspace.

• Install rails using command: gem install rails

• Use git pull to get the code from: https://github.com/username/CSC321-PALS (with the owner’s username)

• Run command: bundle install

• Run command: rails db:setup

• Run command: rails s -b $IP -p $PORT 

• Open: https://pals2018-username.c9users.io/ (with your username)

## Heroku
• Be the owner or collaborator of the github repo

• Install heroku through the cloud IDE using: source <(curl -sL https://cdn.learnenough.com/heroku_install) 

• Login using command: heroku login

• Enter your heroku login information.

• Add SSH key using command: heroku keys:add 

• Create a new application at Heroku using command: heroku create

• Note the address shown after the command has been run. This will be needed to open the application.

• Deploy application to Heroku using: git push heroku master (the create command adds the "heroku" remote)

• Go to the address shown after the command `heroku create` was ran.
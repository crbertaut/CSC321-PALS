# Project Instructions
## Local (Cloud9)
• Ask Sam to give ownership of the GitHub repository to one of the group members.

• Be added as a collaborator to the GitHub repo.

• Open C9 and create a new hosted workspace, using the **'Blank'** template.

• Open the workspace (you can also remove the C9-generated README.md at this point).

• Install rails using the command: `gem install rails`

• Run the command: `git clone https://github.com/username/CSC321-PALS` (where 'username' is the owner’s username)

• Run `cd CSC321-PALS` to enter the project directory.

• Run command: `bundle install --without production`

• Run command: `rake db:setup`

• Run command: `rails s -b $IP -p $PORT` (to start the server)

• Click on the 'Preview' button at the top of the C9 workspace and click 'Preview 
Running Application'. By default, this will open a preview tab inside the 
workspace. If you want to view the site as a full page, click the button next to
the gear icon in the preview tab.

• You are now viewing the user-facing part of the site. To view the admin-facing 
side, get rid of anything after "c9users.io/" in the URL bar and instead append 
"admin" (e.g.: "https://pals2018-username.c9users.io/admin").

• Log in as a user on the user-facing site or as an admin on the admin-facing 
site, using the information in the _db/seeds.rb_ file.

## Heroku
• Be an owner or collaborator of the GitHub repo.

• Install Heroku through the Cloud9 IDE using: `curl https://cli-assets.heroku.com/install-standalone.sh | sh`

• Login using command: `heroku login`

• Enter your Heroku login information.

• Add SSH key using command: `heroku keys:add`

• Create a new application at Heroku using command: `heroku create`

• Deploy application to Heroku using: `git push heroku master`

• Go to the address shown ABOVE "remote: Verifying deploy... done." (The 'herokuapp.com' one.)

• Encounter inscrutable errors, apparently.
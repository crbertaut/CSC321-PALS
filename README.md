# Project Instructions
## Local (Cloud9)
1. Ask Sam to give ownership of the GitHub repository to one of the group members.

2. Be added as a collaborator to the GitHub repo.

3. Open C9 and create a new hosted workspace, using the **'Blank'** template.

4. Open the workspace (you can also remove the C9-generated README.md at this point).

5. Install rails using the command: `gem install rails`

6. Run the command: `git clone https://github.com/username/CSC321-PALS` (where 'username' is the owner’s username)

7. Run `cd CSC321-PALS` to enter the project directory.

8. Run command: `bundle install --without production`

9. Run command: `rake db:setup`

10. Run command: `rails s -b $IP -p $PORT` (to start the server)

11. Click on the 'Preview' button at the top of the C9 workspace and click 'Preview 
Running Application'. By default, this will open a preview tab inside the 
workspace. If you want to view the site as a full page, click the button next to
the gear icon in the preview tab.

12. You are now viewing the user-facing part of the site. To view the admin-facing 
side, get rid of anything after "c9users.io/" in the URL bar and instead append 
"admin" (e.g.: `https://pals2018-username.c9users.io/admin`).

13. Log in as a user on the user-facing site or as an admin on the admin-facing 
site, using the information in the _db/seeds.rb_ file.

## Heroku
1. Be an owner or collaborator of the GitHub repo.

2. Install Heroku through the Cloud9 IDE using: `curl https://cli-assets.heroku.com/install-standalone.sh | sh`

3. Login using command: `heroku login`

4. Enter your Heroku login information.

5. Add SSH key using command: `heroku keys:add`

6. Create a new application at Heroku using command: `heroku create`

7. Deploy application to Heroku using: `git push heroku master`

8. Go to the address shown ABOVE "remote: Verifying deploy... done." (The 'herokuapp.com' one.)

9. Encounter inscrutable errors, apparently.
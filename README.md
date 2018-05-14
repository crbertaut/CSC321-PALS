<div style="font-family:Georgia">

# <span style="font-family:Impact;font-size:1.5em;background-image:-webkit-linear-gradient(bottom, #420199 35%, #A88BD7 80%); background-image:-moz-linear-gradient(bottom, #420199 35%, #A88BD7 80%); background-image:-ms-linear-gradient(bottom, #420199 35%, #A88BD7 80%); background-image:-o-linear-gradient(bottom, #420199 35%, #A88BD7 80%); background-image:linear-gradient(to top, #420199 35%, #A88BD7 80%); -webkit-background-clip:text; background-clip: text; color: transparent">THE PALSGALS' GUIDE TO<br>RUBY ON RAILS</span>

#### <span style="color:#420199; text-shadow:-1px 1px 0 #A88BD7">RAILS</span>
##### &emsp;<a href="#assets">Assets</a>
##### &emsp;<a href="#controllers">Controllers</a>
##### &emsp;<a href="#migrations">Migrations</a>
##### &emsp;<a href="#models">Models</a>
##### &emsp;<a href="#routes">Routes</a>
##### &emsp;<a href="#seeds">Seeds</a>
##### &emsp;<a href="#views">Views</a>
#### <span style="color:#420199; text-shadow:-1px 1px 0 #A88BD7">GEMS</span>
##### &emsp;<a href="#activeadmin">ActiveAdmin</a>
##### &emsp;<a href="#bettererrors">Better Errors</a>
##### &emsp;<a href="#bootstrap">Bootstrap</a>
##### &emsp;<a href="#chartkick">Chartkick</a>
##### &emsp;<a href="#devise">Devise</a>
##### &emsp;<a href="#geocoder">Geocoder</a>
##### &emsp;<a href="#groupdate">Groupdate</a>
##### &emsp;<a href="#html2haml">HTML2HAML</a>
##### &emsp;<a href="#maskedinput">Masked Input</a>
##### &emsp;<a href="#paperclip">Paperclip</a>
##### &emsp;<a href="#wickedpdf">Wicked PDF</a>
#### <span style="color:#420199; text-shadow:-1px 1px 0 #A88BD7">OTHER</span>
##### &emsp;<a href="#git">Git</a>

<br><br>

<div style="line-height:8px; background-image:radial-gradient(#420199 5%, #A88BD7 40%, #fff 75%)">&ensp;</div>

<br>

## <span id="assets" style="color:#A88BD7; text-shadow:-1px 1px 0 #420199">Assets</span>

##### <i>app/assets/*</i>
Assets include images, javascripts (<i>.js</i> and <i>.coffee</i>), and 
stylesheets (<i>.scss</i>). Our stylesheets are written in Sass, a popular CSS
extension language. <i>application.scss</i> contains most of the styles that
appear on the user-facing site, while <i>active_admin.scss</i> contains the
styles found on the admin site.

---

##### <i>app/vendor/assets/*</i>
'Vendor' assets are third party resources. The PALS project includes assets from
<a href="#maskedinput">Masked Input</a> (for formatting fields as you type) and 
<a href="http://www.99lime.com/elements/">HTML KickStart</a> (for certain style
elements, like buttons).

(We suspect that vendor assets should remain unchanged, but we haven't always
abided by this rule; specifically, we've 
modified&ensp;<span style="font-family:Courier"><b>fieldset</b></span>&ensp;in 
<i>stylesheets/kickstart-forms.scss</i>, and probably some stuff in 
<i>stylesheets/kickstart-buttons.scss</i>. In the future, however, when you want 
to change elements in the vendor stylesheets, you should probably just override 
them with something in <i>application.scss</i> or <i>active_admin.scss</i> in
the project's main assets folder...)

<br>

## <span id="controllers" style="color:#A88BD7; text-shadow:-1px 1px 0 #420199">Controllers</span>
##### <i>app/controllers/*</i>

Herein lie the project's controllers. 

<br>

## <span id="migrations" style="color:#A88BD7; text-shadow:-1px 1px 0 #420199">Migrations</span>
##### <i>db/migrate/*</i>
This is where migrations live. Migrations are how you change the 
<b>structure</b> of the database. For example: you have a user model, and that 
user model contains certain fields. These fields are stored as columns in a 
'Users' table in the database. You can view the current database structure in 
<i>db/schema.rb</i>.

Migrations are created by running the following command:
<p><div style="font-family:Courier;color:red"><b>&emsp;rails g migration 
MigrationName</b></div></p>

• <b>DO NOT</b> ever change the <i>db/schema.rb</i> file 
directly. It won't work, and it will mess things up. If you want to change the 
database, you must create a migration, <b>even for small changes</b>. 

• <b>DO NOT</b> create the migration file manually; the file names are generated 
with timestamps, which is how Rails knows in which order to run the migrations.

• <b>DO NOT</b> ever delete or modify migrations. Again, it messes things up.

New migrations are applied to the database by executing the following command:
<p><div style="font-family:Courier;color:red"><b>&emsp;rake db:migrate</b></div></p>

<br>

## <span id="models" style="color:#A88BD7; text-shadow:-1px 1px 0 #420199">Models</span>
##### <i>app/models/*</i>

This is where the project's models live. 

<br>

## <span id="routes" style="color:#A88BD7; text-shadow:-1px 1px 0 #420199">Routes</span>
##### <i>config/routes.rb</i>
Routes are basically the URL paths that the site takes.

<br>

## <span id="seeds" style="color:#A88BD7; text-shadow:-1px 1px 0 #420199">Seeds</span>
##### <i>db/seeds.rb</i>
Seeds are how you change the <b>information</b> in the database.

To 'seed' the database (create the records specified in <i>db/seeds.rb</i>), 
execute the following command:
<p><div style="font-family:Courier;color:red"><b>&emsp;rake db:seed</b></div></p>
Note that if the database has previously been seeded, this command <b>won't 
work</b> because identical information already exists in the database. You will
instead need to run
<p><div style="font-family:Courier;color:red"><b>&emsp;rake db:reset</b></div></p>
which wipes the database, then re-runs all migrations and seeds.

<br>

## <span id="views" style="color:#A88BD7; text-shadow:-1px 1px 0 #420199">Views</span>
##### <i>app/views/*</i>

These are the views.

<br><br>

<div style="line-height:8px; background-image:radial-gradient(#420199 5%, #A88BD7 40%, #fff 75%)">&ensp;</div>

<br>

## <span id="activeadmin" style="color:#A88BD7; text-shadow:-1px 1px 0 #420199">ActiveAdmin</span>
<a href="https://activeadmin.info/documentation.html">(documentation)</a>

##### <i>app/admin/*</i>
ActiveAdmin resources and pages are located here. Each resource file corresponds 
to a model in the main Rails app, and it is basically a set of views and a 
controller in one. To register a new model, run the command:

<p><div style="font-family:Courier;color:red"><b>&emsp;rails g 
active_admin:resource SingularName</b></div></p>

You can also register a page that is not connected to a model by manually 
creating a <i>.rb</i> file and pasting the following code:

<p><div style="font-family:Courier"><b>
&emsp;ActiveAdmin.register_page "Example" do<br>
&emsp;&emsp;content do<br>
&emsp;&emsp;&emsp;# Stuff<br>
&emsp;&emsp;end<br>
&emsp;end<br>
</b></div></p>

The menu bar for ActiveAdmin is ordered according to the&ensp;<span 
style="font-family:Courier"><b>menu priority</b></span>&ensp;specified
at the tops of these <i>.rb</i> files. 
Including&ensp;<span style="font-family:Courier"><b>menu 
false</b></span>&ensp;will remove the resource or page from the menu bar.

#### ---Resource Components---

• <span style="font-family:Courier"><b>permit_params</b></span>&ensp;defines which 
of the resource's attributes can be modified by the admin.

• <span style="font-family:Courier"><b>index</b></span>&ensp;defines the layout of
the index table for a resource.

• <span style="font-family:Courier"><b>filter</b></span>&ensp;specifies a filter 
to include in the sidebar of the index page.

• <span style="font-family:Courier"><b>form</b></span>&ensp;defines the layout and
input fields for a resource's edit page.

• <span style="font-family:Courier"><b>show</b></span>&ensp;defines the layout of
the details page for a specific instance of the resource.

• <span style="font-family:Courier"><b>controller</b></span>&ensp;defines
controller actions on the resource like create, edit, and update.

---

##### <i>app/assets/stylesheets/active_admin.scss</i>
The CSS associated with ActiveAdmin pages is found here. This file is basically
what makes ActiveAdmin look like the user-facing site. (We couldn't find a
better way to change the layout and visuals.)

---

##### <i>app/views/admin_users/*</i>
ActiveAdmin is linked to Devise. The relevant views are located here.

---

##### <i>config/initializers/active_admin.rb</i>
This is the ActiveAdmin initializer. In the initializer, you can configure the
site title, namespace, root path, batch actions, footer, and more. Initializers
are run at boot, so if you change an initializer, you must restart the server
to see your changes.

---

(We also have <b style="color:#A88BD7; text-shadow:-1px 1px 0 #420199">ActiveAdmin Addons</b> installed, whose initializer can be found in
<i>config/initializers/activeadmin_addons.rb</i>. Addons is mainly there for the
numeric range filter option, but it has many more features that future groups
may find useful. The documention is <a 
href="https://github.com/platanus/activeadmin_addons/blob/master/README.md">here</a>.)

<br>

## <span id="bettererrors" style="color:#A88BD7; text-shadow:-1px 1px 0 #420199">Better Errors</span>
<a href="https://github.com/charliesome/better_errors/blob/master/README.md">(documentation)</a>

<i>"Replaces the standard Rails error page with a much better and more useful 
error page."</i>

A.K.A.: When things go wrong, it allows you to view a full stack trace, inspect 
parameters and variables, and inspect source code, among other things.

<br>

## <span id="bootstrap" style="color:#A88BD7; text-shadow:-1px 1px 0 #420199">Bootstrap</span>
<a href="https://getbootstrap.com/docs/4.1/getting-started/introduction/">(documentation)</a>

The (in)famous Bootstrap! It's basically an HTML/CSS style framework, with an 
emphasis on mobile-first design. Go read the documentation. There's too much to
put here, and the documentation does it better.

<br>

## <span id="chartkick" style="color:#A88BD7; text-shadow:-1px 1px 0 #420199">Chartkick</span>
<a href="https://github.com/ankane/chartkick/blob/master/README.md">(documentation)</a>

Creates simple and aesthetically pleasing javascript charts. Currently in use 
for graphing shifts and donations. Used in conjunction with <a 
href="#groupdate">Groupdate</a>.

<br>

## <span id="devise" style="color:#A88BD7; text-shadow:-1px 1px 0 #420199">Devise</span>
<a href="http://devise.plataformatec.com.br/">(documentation)</a>

##### <i>app/controllers/users/*</i>
Devise controllers are located here.

---

##### <i>app/views/devise/*</i>
Devise views are located here.

<br>

## <span id="geocoder" style="color:#A88BD7; text-shadow:-1px 1px 0 #420199">Geocoder</span>
<a href="https://github.com/alexreisner/geocoder/blob/master/README.md">(documentation)</a>

Geocoder can determine latitude and longitude coordinates based on a street 
address, and vice versa. It also processes distance queries. We included this
gem because ultimately we'd like the PALS administration to be able to filter 
and/or sort volunteers based on distance from the shelter. Street address, city, 
state, zipcode, and latitude/longitude are currently fields for Users and 
Organizations, but the filtering and sorting functionalities have not yet been 
implemented. Future groups should probably double check with the client to
confirm this is something they want.

<br>

## <span id="groupdate" style="color:#A88BD7; text-shadow:-1px 1px 0 #420199">Groupdate</span>
<a href="https://github.com/ankane/groupdate/blob/master/README.md">(documentation)</a>

Used in conjunction with <a href="#chartkick">Chartkick</a> to create shift and
donation graphs.

<br>

## <span id="html2haml" style="color:#A88BD7; text-shadow:-1px 1px 0 #420199">HTML2HAML</span>
<a href="https://github.com/haml/html2haml/blob/master/README.md">(documentation)</a>

HTML2HAML is a gem that converts <i>.html.erb</i> files to <i>.html.haml</i>. 
Haml is just like HTML, but 'cleaner.' Our group chose to use it because
of reasons. If you hate it, you can switch the project back to <i>.erb</i>... 
It really doesn't matter.

To convert an <i>.html.erb</i> file to <i>.html.haml</i>, use the command:

<p><div style="font-family:Courier;color:red"><b>&emsp;html2haml inputpath 
outputpath</b></div></p>

<br>

## <span id="maskedinput" style="color:#A88BD7; text-shadow:-1px 1px 0 #420199">Masked Input</span>
<a href="https://github.com/digitalBush/jquery.maskedinput/blob/master/README.md">(documentation)</a>

The Masked Input plugin formats input fields while the user types. Currently in use
for the 'home_phone', 'state', and 'zipcode' fields on the user sign up page.

<b>Note:</b> This plugin is no longer supported, so future groups may want to 
switch over to a different option. The creator of the Masked Input plugin 
recommends <a href="https://nosir.github.io/cleave.js/">Cleave.js</a>.

<br>

## <span id="paperclip" style="color:#A88BD7; text-shadow:-1px 1px 0 #420199">Paperclip</span>
<a href="https://github.com/thoughtbot/paperclip/blob/master/README.md">(documentation)</a>

<br>

## <span id="wickedpdf" style="color:#A88BD7; text-shadow:-1px 1px 0 #420199">Wicked PDF</span>
<a href="https://github.com/mileszs/wicked_pdf/blob/master/README.md">(documentation)</a>

<br>

<br><br>

<div style="line-height:8px; background-image:radial-gradient(#420199 5%, #A88BD7 40%, #fff 75%)">&ensp;</div>

<br>

## <span id="git" style="color:#A88BD7; text-shadow:-1px 1px 0 #420199">Git</span>
Here are some of the most common Git commands you may need:

#### ---Branching---
You should <b><u>always work on a non-master branch.</u></b> Additionally, if 
you're making significant changes to a particular section of the code, you should
create a new, appropriately-titled branch for your work.

<p><div style="font-family:Courier;color:red"><b>&emsp;git branch</b></div></p>

<p><div style="font-family:Courier;color:red"><b>&emsp;git checkout 
BranchName</b></div></p>

<p><div style="font-family:Courier;color:red"><b>&emsp;git checkout -b 
BranchName</b></div></p>

#### ---Pulling---
<p><div style="font-family:Courier;color:red"><b>&emsp;git pull origin 
master</b></div></p>

You should <b><u>always pull first.</u></b> 

#### ---Merging---


#### ---Committing---
<p><div style="font-family:Courier;color:red"><b>&ensp;git status</b></div></p>
• Displays all files modified since the last commit, and tells whether they are 
currently 'staged' for commit (will be included in the next commit), tracked
(not staged, but git is paying attention to them), or untracked (new files that
git doesn't know what to do with. You should&ensp;<span 
style="font-family:Courier"><b>git add</b></span>&ensp;them or stick them in the 
<i>.gitignore</i>).

<p><div style="font-family:Courier;color:red"><b>&emsp;git log</b></div></p>

<p><div style="font-family:Courier;color:red"><b>&emsp;git add -A</b></div></p>

<p><div style="font-family:Courier;color:red"><b>&emsp;git commit -m ""</b></div></p>

#### ---Pushing---
<p><div style="font-family:Courier;color:red"><b>&emsp;git push origin 
master</b></div></p>

#### ---Reverting---
<p><div style="font-family:Courier;color:red"><b>&emsp;git reset --hard 
First7CharsOfCommit</b></div></p>

<p><div style="font-family:Courier;color:red"><b>&emsp;git reset --hard 
HEAD</b></div></p>

<p><div style="font-family:Courier;color:red"><b>&emsp;git clean -f</b></div></p>

</div>
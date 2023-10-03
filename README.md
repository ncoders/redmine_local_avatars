# RedmineLocalAvatars

This plugin allows Redmine users to upload a picture to be used as
an avatar (instead of depending on images from Gravatar).

Users can set their image through the /my/account page.  The administrator
can also manage users' avatars through the /users section.

## Installation

Place this plugin into the folder `plugins/` of your redmine installation. Make sure that the folder is called "redmine_local_avatars".

Update the gems, run any migrations:

<pre>
bundle install --without development test
rake redmine:plugins:migrate RAILS_ENV=production
</pre>

And restart your application server.


## Authors

* A.Chaika wrote the original version:
* http://www.redmine.org/boards/3/topics/5365
* https://github.com/Ubik/redmine_local_avatars
* https://github.com/ncoders/redmine_local_avatars

Luca Pireddu <pireddu@gmail.com> at CRS4 (http://www.crs4.it), 
contributed updates and improvements.


## Warranty.  What warranty?

This plugin was written for use in an intranet with simple requirements in 
mind.  In particular, not much attention has been payed to security issues 
and there hasn't been any thorough testing.  Use it at your own risk.  
Patches are welcome.


## Implementation Notes

Avatar images are treated as attachments to User objects 
with the description 'avatar'.  The AccountController is patched
to provide the images, and the UsersController and MyController are
patched to provide mechanisms to add/delete avatars.


## License

Copyright (C) 2010 Andrew Chaika, Luca Pireddu  
Copyright (C) 2015 dup2

This program is free software; you can redistribute it and/or
modify it under the terms of the GNU General Public License
as published by the Free Software Foundation; either version 2
of the License, or (at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program; if not, write to the Free Software
Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA.

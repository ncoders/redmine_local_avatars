= RedmineLocalAvatars

This plugin allows Redmine users to upload a picture to be used as
an avatar (instead of depending on images from Gravatar).

Users can set their image through the /my/account page.  The administrator
can also manage users' avatars through the /users section.

== Installation

Simply place the plugin in the vendors/plugins directory of your Redmine
installation (or create a symlink).

== Compatibility

This version is compatible with Redmine 2.1. It has been imported fom lp:redminelocalavatars
incorporating the patch for 2.1 from chrisy at https://bugs.launchpad.net/redminelocalavatars/+bug/1069808/comments/4

Tested on Redmine trunk r4388	(version 1.0.3).  Should be compatible with
all Redmine versions 1.0.x.

At the moment the plugin doesn't work when running in development mode.

== Authors

A. Chaika wrote the original version:
* http://www.redmine.org/boards/3/topics/5365
* https://github.com/Ubik/redmine_local_avatars

Luca Pireddu <pireddu@gmail.com> at CRS4 (http://www.crs4.it), 
contributed updates and improvements.


== Warranty.  What warranty?

This plugin was written for use in an intranet with simple requirements in 
mind.  In particular, not much attention has been payed to security issues 
and there hasn't been any thorough testing.  Use it at your own risk.  
Patches are welcome.


== Implementation Notes

Avatar images are treated as attachments to User objects 
with the description 'avatar'.  The AccountController is patched
to provide the images, and the UsersController and MyController are
patched to provide mechanisms to add/delete avatars.


== License

Copyright (C) 2010  Andrew Chaika, Luca Pireddu

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

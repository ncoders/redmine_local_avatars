# Redmine Local Avatars plugin
#
# Copyright (C) 2010  Andrew Chaika, Luca Pireddu
# 
# This program is free software; you can redistribute it and/or
# modify it under the terms of the GNU General Public License
# as published by the Free Software Foundation; either version 2
# of the License, or (at your option) any later version.
# 
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
# 
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA.

require 'redmine'

Redmine::Plugin.register :redmine_local_avatars do
  name 'Redmine Local Avatars plugin'
  author 'Andrew Chaika and Luca Pireddu'
  author_url 'https://github.com/ncoders/redmine_local_avatars'
  description 'This plugin lets users upload avatars directly into Redmine'
  version '1.0.7'
  requires_redmine version_or_higher: '4.1'
end

receiver = Object.const_defined?('ActiveSupport::Reloader') ?  ActiveSupport::Reloader : ActionDispatch::Callbacks

require File.expand_path('../lib/local_avatars', __FILE__)

# patches to Redmine
require File.expand_path('../lib/account_controller_patch', __FILE__)
require File.expand_path('../lib/application_helper_avatar_patch', __FILE__)
require File.expand_path('../lib/my_controller_patch', __FILE__)
require File.expand_path('../lib/users_avatar_patch', __FILE__)    # User model
require File.expand_path('../lib/users_controller_patch', __FILE__)
require File.expand_path('../lib/users_helper_avatar_patch', __FILE__)    # UsersHelper

# hooks
require File.expand_path('../lib/redmine_local_avatars/hooks', __FILE__) 

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
  description 'This plugin lets users upload avatars directly into Redmine'
  version '1.0.5'
end

receiver = Object.const_defined?('ActiveSupport::Reloader') ?  ActiveSupport::Reloader : ActionDispatch::Callbacks
receiver.to_prepare  do
	require_dependency 'project'
	require_dependency 'principal'
	require_dependency 'user'

	AccountController.send(:include,  LocalAvatarsPlugin::AccountControllerPatch)
	ApplicationHelper.send(:include,  LocalAvatarsPlugin::ApplicationAvatarPatch)
	MyController.send(:include,  LocalAvatarsPlugin::MyControllerPatch)
	User.send(:include,  LocalAvatarsPlugin::UsersAvatarPatch)
	UsersController.send(:include,  LocalAvatarsPlugin::UsersControllerPatch)
	UsersHelper.send(:include,  LocalAvatarsPlugin::UsersHelperPatch)
end

require 'local_avatars'

# patches to Redmine
require "account_controller_patch.rb"
require "application_helper_avatar_patch.rb"
require "my_controller_patch.rb"
require "users_avatar_patch.rb"   # User model
require "users_controller_patch.rb"
require "users_helper_avatar_patch.rb"  # UsersHelper

# hooks
require 'redmine_local_avatars/hooks'

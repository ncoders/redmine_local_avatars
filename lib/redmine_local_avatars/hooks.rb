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

module RedmineLocalAvatars
  class Hooks < Redmine::Hook::ViewListener
		# This just renders the partial in
		# app/views/hooks/redmine_local_avatars/_view_my_account_contextual.rhtml
		render_on :view_my_account_contextual,
		           :partial => 'hooks/redmine_local_avatars/view_my_account_contextual'
  end
end

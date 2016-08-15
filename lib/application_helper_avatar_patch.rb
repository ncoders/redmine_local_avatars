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

require 'local_avatars'

module LocalAvatarsPlugin
  module ApplicationAvatarPatch
    def self.included(base) # :nodoc:    
      base.class_eval do
  			alias_method_chain :avatar, :local
      end
    end

		def avatar_with_local(user, options = { })
			if user.is_a?(User)then
				av = user.attachments.find_by_description 'avatar'
				if av then
					image_url = url_for :only_path => true, :controller => 'account', :action => 'get_avatar', :id => user
					options[:size] = "64" unless options[:size]
					return "<img class=\"gravatar\" width=\"#{options[:size]}\" height=\"#{options[:size]}\" src=\"#{image_url}\" />".html_safe
				end
			end
			avatar_without_local(user, options)
		end
  end
end

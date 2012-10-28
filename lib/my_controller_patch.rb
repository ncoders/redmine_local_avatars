# Redmine Local Avatars plugin
#
# Copyright (C) 2010	Andrew Chaika, Luca Pireddu
# 
# This program is free software; you can redistribute it and/or
# modify it under the terms of the GNU General Public License
# as published by the Free Software Foundation; either version 2
# of the License, or (at your option) any later version.
# 
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.	See the
# GNU General Public License for more details.
# 
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA	 02110-1301, USA.

require 'local_avatars'

module LocalAvatarsPlugin
	module MyControllerPatch
		def self.included(base) # :nodoc:		 
			base.class_eval do			
				helper :attachments
				include AttachmentsHelper 
			end
		end

		include LocalAvatars

		def avatar
			@user = User.current
		end

		def save_avatar
			@user = User.current
			begin
				save_or_delete # see the LocalAvatars module
				redirect_to :action => 'account', :id => @user
			rescue => e
				$stderr.puts("save_or_delete raise an exception.	exception: #{e.class}:	#{e.message}")
				flash[:error] = @possible_error || e.message
				redirect_to :action => 'avatar'
			end
		end
	end
end


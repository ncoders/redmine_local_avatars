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

module LocalAvatarsPlugin
	module LocalAvatars
		def send_avatar(user)
			av = user.attachments.find_by_description 'avatar'
			send_file(av.diskfile, :filename => filename_for_content_disposition(av.filename),
			                       :type => av.content_type, 
			                       :disposition => (av.image? ? 'inline' : 'attachment')) if av 
		end

		# expects @user to be set.
		# In case of error, raises an exception and sets @possible_error
		def save_or_delete
			# clear the attachments.  Then, save if 
			# we have to delete.  Otherwise add the new
			# avatar and then save
			# TODO:  This doesn't play nice with any other possible
			# attachments on the user (just because there aren't any
			# now doesn't mean there won't be in the future.  It should
			# be changed to only remove an attachment with description == 'avatar'
			@user.attachments.clear
			if params[:commit] == l(:button_delete) then
				@possible_error = l(:unable_to_delete_avatar)
				@user.save!
				flash[:notice] = l(:avatar_deleted)
			else # take anything else as save
				file_field = params[:avatar]
				Attachment.attach_files(@user, {'first' => {'file' => file_field, 'description' => 'avatar'}})
				@possible_error = l(:error_saving_avatar)
				@user.save!
				flash[:notice] = l(:message_avatar_uploaded)
			end
		end
	end
end

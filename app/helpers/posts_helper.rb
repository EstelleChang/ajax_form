module PostsHelper
	def validate_owner
		unless @post.user.id == current_user.id
			redirect_to posts_url, alert: "Seems like you aren't the owner of the post.\n Let us know if you found any bugs. =)"
		end
	end
end

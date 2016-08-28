class PostController < ApplicationController

	def index
		@posts = Post.all
	end
	
	def post_page
		id = params[:id]
		@post = Post.find(id)
	end
		

end

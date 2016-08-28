class PostController < ApplicationController

	def index
		@posts = Post.all
		@user = current_user
	end
	
	def post_page
		id = params[:id]
		@post = Post.find(id)
		@user = current_user
	end
	
	def new_post
		# HAndle not logged in
	end
	
	def new_post_submit
		if current_user
			title = params[:title]
			content = params[:content]
			tag = Tag.find_by_id(params[:tag])
			if tag
				post = Post.create(user: current_user, title: title, content: content, tag: tag)
			else
				post = Post.create(user: current_user, title: title, content: content)
			end
			redirect_to "/post/#{post.id}"
		else
			render text: "You must be logged in to do that..."
		end
	end
	
	def new_comment
		if current_user
			content = params[:content]
			parent_comment = params[:parent_comment]
			post = params[:post_id]
			Comment.create({user: current_user, post_id: post, content: content, parent_comment_id: parent_comment})
		end
		redirect_to request.referer
	end
	
	def like_or_unlike_post
		if !current_user || !params[:post]
			render json: {success: false}
			return
		else
			post_id = params[:post].to_i
			post = Post.find(post_id)
			if current_user.likes_post?(post)
				current_user.unlike_post(post)
			else
				current_user.like_post(post)
			end
			render json: {success: true}
		end
	end

	def like_or_unlike_comment
		if !current_user || !params[:comment]
			render json: {success: false}
			return
		else
			comment_id = params[:comment].to_i
			comment = Comment.find(comment_id)
			if current_user.likes_comment?(comment)
				current_user.unlike_comment(comment)
			else
				current_user.like_comment(comment)
			end
			render json: {success: true}
		end
	end

end

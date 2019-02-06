Rails.application.routes.draw do
  resource :session, only: [:new, :create, :destroy]
  resources :users, only: [:new, :create]
  resources :subs, except: :destroy
  resources :posts, except: :index 
end

# POST /posts
# GET /subs/1

# <form action="/posts">Create New Post
#   <input type="hidden" name="post[sub_id]" value="<%= @sub.id %>">
# </form>

# Comment model

# body, link_id

# belongs_to :link

# POST /comments

# GET /links/:id/comment/


# Comments Controller

# def create
#   comment = Comment.new(comment_params)
#   comment.link_id = params[:id]
# end
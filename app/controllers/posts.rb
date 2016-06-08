get '/post' do
  @posts = Post.all
  erb :'/users/show'
end

# get '/posts/:id/comments' do
#   @post = Post.find(params[:id])
# end

get '/posts/:id' do
  @post = Post.find(params[:id])
  erb :'posts/show'
end

post '/posts/new'do
  post = Post.create(content: params[:content], author_id: current_user.id)
  redirect "/users/#{current_user.id}"
end

post '/posts/:id' do
  post = Post.find(params[:id])
  new_comment = Comment.create(content: params[:content], commentor_id: current_user.id, post_id: post.id)
  redirect "/posts/#{post.id}"
end


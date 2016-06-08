# aka Register
get '/users/new' do
  erb :'users/new'
end

get '/users/index' do
  @users = User.all
  erb :'/users/index'
end

get '/users/:id/comments' do
  @user = User.find(params[:id])
  erb :'/users/show_comments'
end

#aka Profile page
get '/users/:id' do
  @user = User.find(params[:id])
  @users = User.all
  erb :'/users/show'
end

post '/users/new' do
  user = User.new(username: params[:username])
  user.password = params[:password]
  if user.save
    session[:user_id] = user.id
    redirect "/users/#{current_user.id}"
  else
    redirect'/'
  end
end


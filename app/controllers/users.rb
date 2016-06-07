# aka Register
get '/users/new' do
  erb :'users/new'
end

get '/users/index' do
  @users = User.all
  erb :'/users/index'
end

#aka Profile page
get '/users/:id' do
  @user = User.find(params[:id])
  @users = User.all
  erb :'users/show'
end

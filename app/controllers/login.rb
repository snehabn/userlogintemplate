get '/login' do
  erb :index
end

post '/login' do
  @user = User.find_by(username: params[:username])
  if @user && @user.password == params[:password]
    session[:user_id] = @user.id
    p current_user
    redirect "/users/index"
  else
    @error = "Your password or email was incorrect"
    erb :index
  end
end

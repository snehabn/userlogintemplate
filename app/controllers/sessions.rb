# aka "Login"
get '/sessions/new' do
  erb :'users/new'
end

post '/sessions/new' do
  @user = User.find_by(username: params[:username])
  password = params[:password]

  if @user && @user.authenticate(@user.username, @user.password)
    session[:id] = @user.id
    redirect '/users/index'
  else
    #error handling goes here, via if logic on homepage
    redirect '/login'
  end
end

get '/sessions/delete' do
  session.clear
  redirect '/'
end


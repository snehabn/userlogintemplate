post '/sessions/new' do
  user = User.find_by(username: params[:username])

  password = params[:password]

  if user && User.authenticate(user.username, params[:password])
    session[:user_id] = user.id
    redirect "/users/#{current_user.id}"
  else
    #error handling goes here, via if logic on homepage
    redirect '/'
  end
end

get '/sessions/delete' do
  session.clear
  redirect '/'
end


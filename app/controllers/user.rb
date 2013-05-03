get '/user/signup' do 
  erb :user_signup
end

post '/user/signup' do 
  @user = User.create(params)
  session[:id] = @user.id
  redirect to "/user/#{@user.id}"
end

get '/user/login' do 
  erb :user_login
end

post '/user/login' do
  @user = User.authenticate(params["username"], params["password"])
  if @user
    session[:user_id] = @user.id
    redirect ("/user/#{@user.id}")
  else 
    redirect '/'
  end
end

get '/user/logout' do 
  clear_session
  redirect '/'
end


get '/user/:id' do
  @user = User.find(session[:id])
  erb :user_home
end

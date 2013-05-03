get '/user/login' do 
  erb :user_login
end

get '/user/signup' do 
  erb :user_signup
end

get '/logout' do
  session.clear
  redirect '/'
end

post '/user/signup' do 
  @user = User.new(username: params["username"], email: params["email"], password: params["password"])
  if @user.valid?
    @user.save
    session[:user_id] = @user.id
    redirect "/user/#{@user.id}"
  else
    @error = "Invalid Username/Email/Password"
    redirect '/'
  end
end

post '/user/login' do
  @user = User.authenticate(params["username"], params["password"])
  if @user
    session[:user_id] = @user.id
    redirect "/user/#{@user.id}"
  else 
    @error = "Invalid Login"
    redirect '/'
  end
end



get '/user/:id' do
  @user = User.find(session[:user_id])
  erb :user_home
end



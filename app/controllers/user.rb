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
  @user = User.find(params[:id])
  # @surveys =  Survey.where("user_id = ?", @user.id)
  @surveys = Survey.where(user_id: @user.id)
  @votes_surveys = Vote.where(user_id: @user.id).joins(:survey)
  @survey_ids = @votes_surveys.map { |v| v.survey_id }
  erb :user_home
end
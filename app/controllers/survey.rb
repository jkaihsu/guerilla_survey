get '/surveys' do
  if session[:user_id]
    @surveys = Survey.all
    puts "HELLLO I AM IF"
    erb :survey_all
  else
    puts "HELLLO I AM ELSE"
    erb :restricted
  end
end





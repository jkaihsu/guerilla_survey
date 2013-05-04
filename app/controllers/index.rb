get '/' do
  # Look in app/views/index.erb
  erb :index
end

get '/user/create_survey' do
  # Look in app/views/index.erb
  erb :create_survey
end

post '/create' do
  @survey = Survey.create(title: params[:title])

  @question = Question.create(text: params[:question1])
  params[:question][:choices].each do |choice|
    @question.choices << Choice.create(text: choice)
  end
  @survey.questions << @question 
  redirect "/survey/#{@survey.id}" 
end

get '/survey/:id' do

  @survey = Survey.find(params[:id])
  @question = @survey.questions.first
  p @survey
  p @question
  @choices = @question.choices

  erb :take_survey

end

post '/survey/:id' do

  # p params["id"]
  Vote.create(choice_id: params[:choice], survey_id: params[:id])
  redirect '/'
end


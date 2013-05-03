10.times do
  User.create(:username => Faker::Name.name, :email => Faker::Internet.email, :password => 'password')
end

20.times do
  Survey.create(:title => Faker::Company.catch_phrase, :user_id => rand(10) + 1)
end

40.times do
  Question.create(:text => Faker::Lorem.sentence(word_count = 4, supplemental = false), :survey_id => rand(20) + 1)
end

80.times do
  Choice.create(:text => Faker::Lorem.word, :question_id => rand(40) + 1)
end

120.times do
  Vote.create(:user_id => rand(10) + 1, :choice_id => rand(80) + 1, :survey_id => rand(20) + 1)
end


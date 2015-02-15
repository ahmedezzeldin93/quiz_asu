json.array!(@assignment) do |assignment|
  json.extract! assignment, :id, :score, :status
end
json.array!(@quizzes) do |quiz|
  json.extract! quiz, :id, :title, :status, :subject, :description, :total_score, :date_to_publish,:time_to_publish, :duration
end

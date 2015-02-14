json.array!(@answers) do |answer|
  json.extract! answer, :id, :title, :question_id, :correctness
end

json.array!(@answers) do |answer|
  json.extract! answer, :id, :title
end

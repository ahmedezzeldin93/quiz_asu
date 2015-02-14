json.array!(@showed) do |assignment|
  json.extract! assignment, :id, :score, :status
end

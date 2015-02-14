json.array!(@groups) do |group|
  json.extract! group, :id, :group_name, :description, :number_of_students
end

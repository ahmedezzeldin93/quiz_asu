json.array!(@memberships) do |membership|
  json.extract! membership, :id, :group_name, :description, :number_of_students
end


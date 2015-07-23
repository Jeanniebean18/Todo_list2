json.array!(@chores) do |chore|
  json.extract! chore, :id, :name, :done, :user_id
  json.url chore_url(chore, format: :json)
end

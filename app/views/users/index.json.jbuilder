json.array!(@users) do |user|
  json.extract! user, :id, :name, :username, :email, :phone, :website
  json.url user_url(user, format: :json)
end

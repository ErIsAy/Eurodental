json.array!(@users) do |user|
  json.extract! user, :id, :email
  json.url client_url(user, format: :json)
end

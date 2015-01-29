json.array!(@clients) do |client|
  json.id client.id
  json.id_number client.id_number
  json.client_name @user
  json.url client_url(client, format: :json)
end

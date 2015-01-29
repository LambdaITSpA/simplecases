json.array!(@clients) do |client|
  json.id client.id
  json.id_number client.id_number
  json.name(1) client.data
  json.url client_url(client, format: :json)
end

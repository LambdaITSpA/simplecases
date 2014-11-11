json.array!(@clients) do |k, client|
  json.id client.id
  json.id_number client.id_number
  json.name client.name
  json.url cause_url(client, format: :json)
end

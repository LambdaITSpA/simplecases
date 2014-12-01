json.id @client.id
json.id_number @client.id_number
json.name @client.name
json.type @client.type
json.data @client.person || @client.company
json.url client_url(@client, format: :json)
json.notice @notice
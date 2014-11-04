json.array!(@organizations) do |organization|
  json.extract! organization, :id, :name, :id_number
  json.url organization_url(organization, format: :json)
end

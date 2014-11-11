json.array!(@causes) do |cause|
  json.extract! cause, :id, :role, :court, :matter, :honorary, :client, :users, :cause_type
  json.url cause_url(cause, format: :json)
end

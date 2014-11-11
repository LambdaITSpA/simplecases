json.array!(@causes) do |cause|
  json.extract! cause, :id, :role, :matter#, :court, :honorary, :client, :users, :cause_type
  #json.url cause_url(cause, format: :json)
end

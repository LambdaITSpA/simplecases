json.array!(@causes) do |cause|
  json.extract! cause, :id, :role, :matter#, :court, :honorary, :client, :users, :area
  #json.url cause_url(cause, format: :json)
end

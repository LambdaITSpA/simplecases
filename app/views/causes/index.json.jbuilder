json.array!(@causes) do |cause|
  json.extract! cause, :id, :id_number, :role, :court, :matter, :honorary, :client_id, :user_id, :cause_type_id
  json.url cause_url(cause, format: :json)
end

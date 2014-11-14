json.array!(@courts) do |court|
  json.extract! court, :id, :name
  #json.url cause_url(cause, format: :json)
end
json.array!(@events) do |event|
  json.extract! event, :id, :date, :description, :event_link
  json.url event_url(event, format: :json)
end

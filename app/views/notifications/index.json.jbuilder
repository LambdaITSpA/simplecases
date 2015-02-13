json.array!(@notifications) do |notification|
  json.id notification.id
  json.subject notification.subject
  json.description notification.description
  json.link notification.link
  json.notification_type notification.notification_type
end

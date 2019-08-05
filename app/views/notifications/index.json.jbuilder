json.array! @notifications do |notification|
  # json.recipient notification.recipient
  json.id notification.id
  json.actor notification.actor.first_name
  json.action notification.action
  json.notifiable do 
    json.type "sent you a"
  end
  json.url listing_path(notification.notifiable)
end
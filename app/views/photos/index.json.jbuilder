json.array!(@photos) do |photo|
  json.extract! photo, :id, :user_id, :equipment_id, :photo
  json.url photo_url(photo, format: :json)
end

json.array!(@photo_sessions) do |photo_session|
  json.extract! photo_session, :id, :user_id, :equipment_id
  json.url photo_session_url(photo_session, format: :json)
end

json.array!(@reservs) do |reserv|
  json.extract! reserv, :id, :user_id, :day, :equipment_id, :hours
  json.url reserv_url(reserv, format: :json)
end

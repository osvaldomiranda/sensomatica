json.extract! point, :id, :user_id, :available_points, :used_points, :created_at, :updated_at
json.url point_url(point, format: :json)

json.extract! history_point, :id, :user_id, :reserv_id, :used_points, :created_at, :updated_at
json.url history_point_url(history_point, format: :json)

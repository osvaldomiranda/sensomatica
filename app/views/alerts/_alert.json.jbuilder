json.extract! alert, :id, :user_id, :title, :body, :created_at, :updated_at
json.url alert_url(alert, format: :json)

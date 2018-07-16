json.array!(@type_objects) do |type_object|
  json.extract! type_object, :id, :type_name, :name
  json.url type_object_url(type_object, format: :json)
end

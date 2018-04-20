json.array!(@astronomic_objects) do |astronomic_object|
  json.extract! astronomic_object, :id, :name, :catalog, :type_object, :ra, :dec, :constellation, :bmag, :hubble
  json.url astronomic_object_url(astronomic_object, format: :json)
end

json.array!(@equipment) do |equipment|
  json.extract! equipment, :id, :codigo, :nombre, :descripcion, :caracteristicas
  json.url equipment_url(equipment, format: :json)
end

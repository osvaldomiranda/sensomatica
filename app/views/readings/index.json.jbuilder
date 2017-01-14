json.array!(@readings) do |reading|
  json.extract! reading, :id, :equipment_id, :humedad_origen1, :humedad_origen2, :humedad_origen3, :temperatura_origen, :humedad1, :humedad2, :humedad3, :temperatura
  json.url reading_url(reading, format: :json)
end

json.array!(@materials) do |material|
  json.extract! material, :id, :name, :price
  json.url material_url(material, format: :json)
end

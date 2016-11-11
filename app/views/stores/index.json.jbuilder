json.array!(@stores) do |store|
  json.extract! store, :id, :tooth, :note, :implant, :brand, :amount, :sale_id
  json.url store_url(store, format: :json)
end

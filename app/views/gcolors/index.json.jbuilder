json.array!(@gcolors) do |gcolor|
  json.extract! gcolor, :id, :name, :price
  json.url gcolor_url(gcolor, format: :json)
end

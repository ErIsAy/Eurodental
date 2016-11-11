json.array!(@mcolors) do |mcolor|
  json.extract! mcolor, :id, :name, :price
  json.url mcolor_url(mcolor, format: :json)
end

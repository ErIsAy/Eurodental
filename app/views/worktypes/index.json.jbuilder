json.array!(@worktypes) do |worktype|
  json.extract! worktype, :id, :name, :price
  json.url worktype_url(worktype, format: :json)
end

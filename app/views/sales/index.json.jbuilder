json.array!(@sales) do |sale|
  json.extract! sale, :id, :patient_name, :age, :sex, :client_note, :other_note, :coti, :state, :concept, :client_id
  json.url sale_url(sale, format: :json)
end

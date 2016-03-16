json.array!(@orders) do |order|
  json.extract! order, :id, :order_date, :age, :sex, :client_note, :other_note
  json.url order_url(order, format: :json)
end

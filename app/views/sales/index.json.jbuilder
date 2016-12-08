json.array!(@sales) do |sale|
  json.extract! sale, :id, :patient_name, :age, :sex, :client_note, :other_note,
                      :coti, :state, :invoice_num, :invoice_date :paid_status, :total_amount, :discount, :discount_amount,
                      :remaining_amount, :order_total, :concept, :client_id
  json.url sale_url(sale, format: :json)
end

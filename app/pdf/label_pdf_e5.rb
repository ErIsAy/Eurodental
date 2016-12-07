class LabelPdfE5 < Prawn::Document


  def initialize(sale)
    super(right_margin: 1, left_margin: 1, top_margin: 15, page_size: [150,100])
    # image "#{Rails.root}/App/assets/images/logo.png", :scale => 0.2
    image "public/logo.png", :scale => 0.1
    @sale = sale
    move_down 10
    label_body
  end


  def label_body
    text "Orden: #{@sale.id}", size: 10, :align => :right, :style => :bold
    text "Cliente: #{@sale.client.name}", size: 7, :style => :italic
    # text "Dirección.: #{@sale.client.address} ", size:20
    # text "Tel.: #{@sale.client.client_phones.first.phone} ", size:20
    # text "Fecha de Orden: #{@sale.created_at.strftime("%F")}", size: 20
    # text "Fecha de Entrega: #{@sale.sale_date}", size: 20
    # formatted_text [
    #                 { text: "EuroDental Lab", size: 20 },
    #                 { text: "Orden: #0000#{@sale.id}", size: 20, :align => :right }
    #               ]
  end



end

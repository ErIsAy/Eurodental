class LabelPdf < Prawn::Document


  def initialize(sale)
    super(right_margin: 5, left_margin: 10, top_margin: 10, page_size: [500,200])
    # image "#{Rails.root}/App/assets/images/logo.png", :scale => 0.2
    image "public/logo.png", :scale => 0.2
    @sale = sale
    label_body
  end


  def label_body
    text "Orden: #{@sale.id}", size: 20, :align => :right, :style => :bold
    move_down 10
    text "Cliente: #{@sale.client.name}", size: 20, :style => :italic
    text "Dirección.: #{@sale.client.address} ", size:20
    text "Tel.: #{@sale.client.client_phones.first.phone} ", size:20
    # text "Fecha de Orden: #{@sale.created_at.strftime("%F")}", size: 20
    # text "Fecha de Entrega: #{@sale.sale_date}", size: 20
    # formatted_text [
    #                 { text: "EuroDental Lab", size: 20 },
    #                 { text: "Orden: #0000#{@sale.id}", size: 20, :align => :right }
    #               ]
  end



end

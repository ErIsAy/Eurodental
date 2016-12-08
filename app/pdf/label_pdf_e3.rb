class LabelPdfE3 < Prawn::Document


  def initialize(sale)
    super(top_margin: 10, bottom_margin: 6, page_size: [300,200])
    # image "#{Rails.root}/App/assets/images/logo.png", :scale => 0.2
    image "public/logo.png", :scale => 0.2
    move_down 5
    @sale = sale
    label_body
  end


  def label_body
    text "    Tel: (809) 247-4649", size: 8, :style => :italic
    text "    Santiago, República Dominicana", size: 8, :style => :italic
    text "Orden: #{@sale.id}", size: 15, :align => :right, :style => :bold
    text "Cliente: #{@sale.client.name}", size: 15, :style => :italic
    text "Dirección: #{@sale.client.address} ", size: 15

    unless @sale.client.client_phones.first.nil?
      text "Tel.: #{@sale.client.client_phones.first.phone} ", size: 12
    end
    # text "Fecha de Orden: #{@sale.created_at.strftime("%F")}", size: 20
    # text "Fecha de Entrega: #{@sale.sale_date}", size: 20
    # formatted_text [
    #                 { text: "EuroDental Lab", size: 20 },
    #                 { text: "Orden: #0000#{@sale.id}", size: 20, :align => :right }
    #               ]
  end



end

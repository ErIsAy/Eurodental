class LabelPdf < Prawn::Document




  def initialize(order)
    super(top_margin: 10, page_size: [600,200])
    # image "#{Rails.root}/App/assets/images/logo.png", :scale => 0.2
    image "public/logo.png", :scale => 0.2
    @order = order
    label_body

  end


  def label_body
    text "Orden: #0000#{@order.id}", size: 20, :align => :right, :style => :bold
    text "Cliente: #{@order.client_name}", size: 20, :style => :italic
    text "Dirección.: #{@order.client_address} ", size:20
    text "Tel.: #{@order.client_phone} ", size:20
    # text "Fecha de Orden: #{@order.created_at.strftime("%F")}", size: 20
    # text "Fecha de Entrega: #{@order.order_date}", size: 20
    # formatted_text [
    #                 { text: "EuroDental Lab", size: 20 },
    #                 { text: "Orden: #0000#{@order.id}", size: 20, :align => :right }
    #               ]
  end



end

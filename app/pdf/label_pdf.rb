class LabelPdf < Prawn::Document
  def initialize(order)
    super(top_margin: 10, page_size: [600,200])
    @order = order
    label_body

  end


  def label_body
    text "EuroDental Lab", size: 20
    move_down 40
    text "Orden: #0000#{@order.id}", size: 20
    text "Cliente: #{@order.client_name}", size: 20
    text "Fecha de Orden: #{@order.created_at.strftime("%F")}", size: 20
    text "Fecha de Entrega: #{@order.order_date}", size: 20
  end



end

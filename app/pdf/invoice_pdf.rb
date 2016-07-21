class InvoicePdf < Prawn::Document
  def initialize(order)
    super(top_margin: 10)
    @order = order
    order_title
    order_info
    order_details
  end


  def order_title
    image "#{Rails.root}/App/assets/images/logo.png", :scale => 0.2
    move_down 10
    text "Calle Eusebio Manzueta #G8", size: 10, :style => :italic
    text "Los Jardines Metropolitanos", size: 10, :style => :italic
    text "Santiago, República Dominicana", size: 10, :style => :italic
    text "Info@eurodental.com	", size: 10, :style => :italic
    text "Orden: #0000#{@order.id}", size: 20, style: :bold, :align => :right
    text "Fecha: #{@order.created_at.strftime("%F")}", size: 10, style: :italic, :align => :right
  end

  def order_info
    move_down 50
    text "Cliente: #{@order.client_name}", size: 10
    text "Paciente: #{@order.patient_name}", size: 10
  end

  def order_details
    move_down 100
    text "Servicios", size: 15, style: :bold
    table([ ["Descripción", "Precio"],
          ["Puente.................... ", "$3,000.00"],
          ["Perno....................", "$2,000.00"] ])
    move_down 10
    text "Total: $5,000.00", size: 18, style: :bold
  end

end

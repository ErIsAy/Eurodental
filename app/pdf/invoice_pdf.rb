class InvoicePdf < Prawn::Document
  def initialize(order)
    super(top_margin: 10)
    @order = order
    order_title
    order_info
    order_details
  end
  # @order.services.first.service_total

  def order_title
    address_text = "Calle Eusebio Manzueta #G8
              Los Jardines Metropolitanos
              Santiago, República Dominicana
              eurodentallab@gmail.com
              Tel: 809-247-4649"

    data_header = [[{:image => "public/logo.png", :scale => 0.2}, address_text]]
    table(data_header, :column_widths => [320, 200], :cell_style => {:border_color => "FFFFFF", :size => 11})

    move_down 10
    text "No. de Orden: #{@order.id}", size: 15, style: :italic, :align => :right
    text "Fecha: #{@order.created_at.strftime("%F")}", size: 10, style: :italic, :align => :right
  end

  def order_info
    move_down 10
    text "Cliente: #{@order.client_name}", size: 10, style: :italic
    text "Paciente: #{@order.patient_name}", size: 10, style: :italic
    text "Dirección: #{@order.client_address}", size: 10, style: :italic
  end

  def order_details
    move_down 20
    # text "Servicios", size: 15, style: :bold
    description_data = String.new


    table([["Descripción", "Precio"]], :column_widths => [420  , 100])
    @order.services.each do |a|

      description_data += ", Corona" if a.corona == 1
      description_data += ", puente" if a.puente == 1
      #arreglar las ordenes que rejectif sin precio no aparecen...ponerle algo como un hidden field si
      # es valida o algo

      data = [
          ["Diente  #{a.tooth_number} #{description_data}", "$#{a.service_total}"]
      ]

      table(data, :column_widths => [420, 100], :row_colors => ["f8f8f8", "ffffff"])
      description_data = ""
    end
    move_down 10
    text "Total: RD$ #{@order.total_price}", size: 18, style: :bold


  end

end

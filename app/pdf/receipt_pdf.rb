class ReceiptPdf < Prawn::Document
  include ActionView::Helpers::NumberHelper

  def initialize(payment, sale)
    super(top_margin: 10)
    @payment = payment
    @sale = sale
    header
    details
    move_down 15
    body_table
  end

  def header
    address_text = "Calle Eusebio Manzueta #G8
              Los Jardines Metropolitanos
              Santiago, República Dominicana
              eurodentallab@gmail.com
              Tel: 809-247-4649"

    data_header = [[{:image => "public/logo.png", :scale => 0.2}, address_text]]
    table(data_header, :column_widths => [320, 200], :cell_style => {:border_color => "FFFFFF", :size => 11})
  end

  def details
    text "Recibo No.: #{@payment.id.to_s}", size: 10, style: :italic, :align => :right
    text "No. de Orden: #{@payment.sale_id}", size: 15, style: :italic, :align => :right
    text "Fecha: #{@payment.created_at.strftime("%F")}", size: 10, style: :italic, :align => :right

    address_text = "Cliente:   #{@sale.client.name}
                    Paciente:  #{@sale.patient_name}
                    Dirección: #{@sale.client.address} "
    move_down 15
    data_client = [[{:image => "public/Tooth-100.png", :scale => 0.5}, address_text]]
    table(data_client, :column_widths => [320, 200], :cell_style => {:background_color => "f3e5f5",:border_color => "FFFFFF", :size => 11})

  end

  def body_table
    text "Recibo", size: 25, style: :italic

    description_data = String.new

    table([["Descripción","Tipo de Pago","Monto"]], :column_widths => [320,100,100], :row_colors => ["9FA8DA"])

    table([["Abono","#{@payment.payment_type}","$#{number_to_currency(@payment.amount, :format => "%u%n", :unit => '',:delimiter => ',',:separator => '.')}"]], :column_widths => [320,100,100], :row_colors => ["f3e5f5"])
    table([["Balance Pendiente:","$#{number_to_currency(@sale.remaining_amount - @sale.discount_amount, :format => "%u%n", :unit => '',:delimiter => ',',:separator => '.')}"]], :column_widths => [420,100 ], :row_colors => ["f3e5f5"])
    # table([["Balance Actual:","$#{number_to_currency(@sale.remaining_amount - @sale.discount_amount, :format => "%u%n", :unit => '',:delimiter => ',',:separator => '.')}"]], :column_widths => [420,100 ], :row_colors => ["f3e5f5"])


  end



end

class ReceiptPdf < Prawn::Document
  include ActionView::Helpers::NumberHelper

  def initialize(payment, sale, balance)
    super(top_margin: 10)
    @payment = payment
    @sale = sale
    @balance = balance
    header
    details
    move_down 15
    body_table
    move_down 100
    signature
  end

  def header
    address_text = "Calle Eusebio Manzueta #G8
              Los Jardines Metropolitanos
              Santiago, República Dominicana
              eurodentallab@gmail.com
              Tel: 809-247-4649"

    data_header = [[{:image => "public/logo.png", :scale => 0.2}, address_text]]
    table(data_header, :column_widths => [320, 200], :cell_style => {:border_color => "FFFFFF", :size => 7})
  end

  def details
    text "Recibo No.: #{@payment.id.to_s}", size: 8, style: :italic, :align => :right
    text "No. de Orden: #{@payment.sale_id}", size: 8, style: :italic, :align => :right
    text "Fecha: #{@payment.created_at.strftime("%m/%d/%Y")}", size: 8, style: :italic, :align => :right

    # order_text = "Orden# #{@sale.id} 
    #               Fecha: #{@sale.invoice_date.strftime("%m/%d/%Y")}"

    address_text = "Paciente:  #{@sale.patient_name}
                    Dirección: #{@sale.client.address}"
    invoice = "Factura# #{@sale.invoice_number.id}"
    client_name = "Cliente: #{@sale.client.name}"


    invoice_table = [[client_name, invoice]]
    data_client = [[{:image => "public/Tooth-100.png", :scale => 0.5}, address_text]]
    
    move_down 15
    table(invoice_table, :column_widths => [320,200], :cell_style => {:border_color => "FFFFFF", :size => 16})        
    table(data_client, :column_widths => [320, 200], :cell_style => {:background_color => "f3e5f5",:border_color => "FFFFFF", :size => 10})

  end

  def body_table
    text "Recibo", size: 25, style: :italic

    # description_data = String.new

    table([["Descripción","Tipo de Pago","Monto"]], :column_widths => [320,100,100], :row_colors => ["9FA8DA"])

    unless (@sale.remaining_amount - @sale.discount_amount > 0)
      table([["Saldo a Factura No. #{@sale.invoice_number.id.to_s}...(Restan $#{number_to_currency(@sale.remaining_amount - @sale.discount_amount, :format => "%u%n", :unit => '',:delimiter => ',',:separator => '.')})","#{@payment.payment_type}","$#{number_to_currency(@payment.amount, :format => "%u%n", :unit => '',:delimiter => ',',:separator => '.')}"]], :column_widths => [320,100,100], :row_colors => ["f3e5f5"])
    else
      table([["Abono a Factura No. #{@sale.invoice_number.id.to_s}...(Restan $#{number_to_currency(@sale.remaining_amount - @sale.discount_amount, :format => "%u%n", :unit => '',:delimiter => ',',:separator => '.')})","#{@payment.payment_type}","$#{number_to_currency(@payment.amount, :format => "%u%n", :unit => '',:delimiter => ',',:separator => '.')}"]], :column_widths => [320,100,100], :row_colors => ["f3e5f5"])
    end
    # table([["","Total Recibido","#{}"]], :column_widths => [320,100,100 ], :row_colors => ["f3e5f5"])

    move_down 50
    # table([["Balance Pendiente:","$#{number_to_currency(@sale.remaining_amount - @sale.discount_amount, :format => "%u%n", :unit => '',:delimiter => ',',:separator => '.')}"]], :column_widths => [420,100 ], :row_colors => ["bdc3c7"])
    # table([["Balance Actual:","$#{number_to_currency(@sale.remaining_amount - @sale.discount_amount, :format => "%u%n", :unit => '',:delimiter => ',',:separator => '.')}"]], :column_widths => [420,100 ], :row_colors => ["f3e5f5"])
    table([["Balance Pendiente:","$#{number_to_currency(@balance, :format => "%u%n", :unit => '',:delimiter => ',',:separator => '.')}"]], :column_widths => [420,100 ], :row_colors => ["bdc3c7"])


  end

  def signature
    stroke do
      stroke_color '000000'
      horizontal_line(40, 200)
      move_down 10
      draw_text "Recibido Por:", :at => [80,250]
    end
  end

end

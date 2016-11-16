class FacturaPdf < Prawn::Document
  include ActionView::Helpers::NumberHelper

  def initialize(sale)
    super(top_margin: 10)
    @sale = sale
    header
    move_down 10
    details
    move_down 20
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
    table(data_header, :column_widths => [320, 200], :cell_style => {:border_color => "FFFFFF", :size => 11})


  end

  def details
    text "No. de Factura: #{@sale.invoice_number.id.to_s}", size: 10, style: :italic, :align => :right
    text "No. de Orden: #{@sale.id}", size: 15, style: :italic, :align => :right
    text "Fecha: #{@sale.created_at.strftime("%F")}", size: 10, style: :italic, :align => :right


    address_text = "Cliente:   #{@sale.client.name}
                    Paciente:  #{@sale.patient_name}
                    Dirección: #{@sale.client.address} "
    move_down 15
    data_client = [[{:image => "public/Tooth-100.png", :scale => 0.5}, address_text]]
    table(data_client, :column_widths => [320, 200], :cell_style => {:background_color => "f3e5f5",:border_color => "FFFFFF", :size => 11})


  end

  def body_table
    description_data = String.new

    table([["Descripción","Cant.","Monto"]], :column_widths => [380,40,100], :row_colors => ["9FA8DA"])

    @sale.stores.each do |a|
      description_data += a.tooth.to_s
      description_data += " - Antagonista" if a.antagonista
      description_data += " - Mordida" if a.mordida
      description_data += ", #{a.worktype_name}"
      description_data += " - #{a.note}" if a.note != ""
      description_data += "(Sobre Implante)" if a.implant
      description_data += " - Marca: #{a.brand}" if a.brand != ""
      description_data += ", #{a.material_name}" if a.material_name != nil
      description_data += ", #{a.mcolor_name}" if a.mcolor_name != nil
      description_data += ", #{a.gcolor_name} - #{a.color_note}" if a.gcolor_name != nil
      description_data += ", #{a.procedure_name}" if a.procedure_name != nil

      data = [
                ["Diente: #{description_data}",
                 "#{a.cant}",
                 "$#{number_to_currency(a.amount, :format => "%u%n", :unit => '',:delimiter => ',',:separator => '.')}"]
             ]

      table(data, :column_widths => [380,40,100], :cell_style => { :size => 10, :font_style => :italic}, :row_colors => ["f8f8f8", "ffffff"]) if not(description_data.blank?)
      description_data = ""


    end

    #Table Footer for Totals
    table([["Total:","$#{number_to_currency(@sale.order_total, :format => "%u%n", :unit => '',:delimiter => ',',:separator => '.')}"]], :column_widths => [420,100 ], :row_colors => ["f3e5f5"])
    table([["Total con Desc.: (%#{@sale.discount})","$#{number_to_currency(@sale.order_total - @sale.discount_amount, :format => "%u%n", :unit => '',:delimiter => ',',:separator => '.')}"]], :column_widths => [420,100 ], :row_colors => ["f3e5f5"])
    # table([["Balance Pendiente:","$#{number_to_currency(@sale.remaining_amount - @sale.discount_amount, :format => "%u%n", :unit => '',:delimiter => ',',:separator => '.')}"]], :column_widths => [420,100 ], :row_colors => ["f3e5f5"])


  end


  def signature
    stroke do
      stroke_color '000000'
      horizontal_line(40, 200)
      horizontal_line(300, 460)
    end


    # text "Firma Cliente", size: 10, style: :italic, :align => :right
    # text "Firma Cajero", size: 10, style: :italic, :align => :right
  end


end

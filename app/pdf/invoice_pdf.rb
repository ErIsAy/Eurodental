class InvoicePdf < Prawn::Document
  include ActionView::Helpers::NumberHelper
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
    address_text = "Cliente:   #{@order.client_name}
                    Paciente:  #{@order.patient_name}
                    Dirección: #{@order.client_address} "
    move_down 15
    data_client = [[{:image => "public/Tooth-100.png", :scale => 0.5}, address_text]]
    table(data_client, :column_widths => [320, 200], :cell_style => {:background_color => "f3e5f5",:border_color => "FFFFFF", :size => 11})
    #
    # text "Cliente: #{@order.client_name}", size: 10, style: :italic
    # text "Paciente: #{@order.patient_name}", size: 10, style: :italic
    # text "Dirección: #{@order.client_address}", size: 10, style: :italic
  end

  def order_details
    move_down 20
    # text "Servicios", size: 15, style: :bold
    description_data = String.new


    table([["Descripción","Cant.","Precio"]], :column_widths => [380,40,100], :row_colors => ["9FA8DA"])
    @order.services.each do |a|
      description_data += " - Corona" if a.corona == true
      description_data += " - Puente (#{a.puente_a} a #{a.puente_b})" if a.puente == true
      description_data += " - Implante" if a.implante == true
      description_data += " - Barra" if a.barra == true
      description_data += " - Hibrida" if a.hibrida == true
      description_data += " - Carilla" if a.carilla == true
      description_data += " - Inlay/Onlay" if a.in_onlay == true
      description_data += " - Inlay Bridge" if a.inlay_bridge == true
      description_data += " - Lente de Contacto" if a.lente_contacto == true
      description_data += " - Perno" if a.perno == true
      description_data += " - Soldadura Laser" if a.sold_laser == true
      description_data += " - Vita Classic" if a.vita_classic == true
      description_data += "(#{a.vita_classic_text})" if not (a.vita_classic_text.blank?)
      description_data += " - Vita 3D Master" if  a.vita_td == true
      description_data += "(#{a.vita_3d_text})" if not (a.vita_3d_text.blank?)
      description_data += " - Bioform" if a.bioform == true
      description_data += "(#{a.bioform_text})" if not (a.bioform_text.blank?)
      description_data += " - Chromarcop" if a.chromarcop == true
      description_data += "(#{a.chromarcop_text})" if not (a.chromarcop_text.blank?)
      description_data += " - Color Otras" if a.col_otras == true
      description_data += "(#{a.col_otras_text})" if not (a.col_otras_text.blank?)
      description_data += " - Zirconio" if a.zirconio == true
      description_data += " - Disilicato" if a.disilicato == true
      description_data += " - Fedespatica" if a.fedespatica == true
      description_data += " - Porcelana" if a.porcelana == true
      description_data += " - PMMA" if a.pmma == true
      description_data += " - Polímero" if a.polimero == true
      description_data += " - Composite" if a.composite == true
      description_data += " - Metal/Porcelana" if a.metal_porcelana == true
      description_data += " - Zirconio/Porcelana" if a.zirconio_porcelana == true
      description_data += " - Peek" if a.peek == true
      description_data += " - Natural" if a.natural == true
      description_data += " - Pigmentado" if a.pimentado == true
      description_data += " - Metal" if a.metal == true
      description_data += " - Fresado/Maquinado" if a.fresado_maquinado == true
      description_data += " - Prensado" if a.prensado == true
      description_data += " - Colado" if a.colado == true
      description_data += " - Cromo cobalto" if a.cromo_cobalto == true
      description_data += " - Titanium" if a.titanium == true
      description_data += " - Cromo niquel" if a.cromo_niquel == true
      description_data += " - Oro" if a.oro == true
      description_data += " - Paladio" if a.paladio == true

      # Diente  #{a.tooth_number}
      data = [
          ["#{description_data}","#{a.quantity}", "$#{number_to_currency(a.service_total, :format => "%u%n",
                                                                                     :unit => '',
                                                                                     :delimiter => ',',
                                                                                     :separator => '.')}"]
      ]

      table(data, :column_widths => [380,40,100], :cell_style => { :size => 10, :font_style => :italic}, :row_colors => ["f8f8f8", "ffffff"]) if not(description_data.blank?)
      description_data = ""
    end
    # move_down 10
    # text "Total: RD$ #{@order.total_price}", size: 18, style: :bold,
    table([["Total:","#{number_to_currency(@order.total_price, :format => "%u%n", :unit => 'RD$', :delimiter => ',', :separator => '.')}"]], :column_widths => [420,100 ], :row_colors => ["9FA8DA"])
    # table([["Pendiente:","#{number_to_currency((@order.total_price - @order.partial_pay), :format => "%u%n", :unit => 'RD$', :delimiter => ',', :separator => '.')}"]], :column_widths => [420,100 ], :row_colors => ["9FA8DA"])





  end

end

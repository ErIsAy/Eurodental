class Reportpaid < Prawn::Document
  include ActionView::Helpers::NumberHelper

  def initialize(sales, from, to)
    super(right_margin: 10, left_margin: 10, top_margin: 10, bottom_margin: 10)
    image "public/logo.png", :scale => 0.2
    @sales = sales
    @from = from
    @to = to
    move_down 20
    header
    move_down 10
    body
  end

  #remember to print the page count

  def header
    text "Ordenes Consolidadas", style: :italic
    text "Fecha de Reporte: #{Time.now.strftime("%d/%m/%Y")}", :align => :right

    if @from && @to != ""
      text "Desde:#{@from}   -  Hasta: #{@to}"
    end
  end


  def body
    table([["No. Factura","Cliente","No. Orden.","Fecha", "Monto"]], :column_widths => [100,150,100,100,100], :row_colors => ["9FA8DA"])
    #
    # byebug
    @sales.each do |sale|
      # byebug
      table([[sale.invoice_number.id, sale.client.name, sale.id, sale.invoice_date,
        "$#{number_to_currency(sale.remaining_amount, :format => "%u%n", :unit => '',:delimiter => ',',:separator => '.')}"]], :column_widths => [100,150,100,100,100])

      # table([[sale.invoice_number, sale.client.name, sale.id, sale.invoice_number, "lolaso"]], :column_widths => [100,150,100,100,100], :row_colors => ["9FA8DA"])
    end

  end
end

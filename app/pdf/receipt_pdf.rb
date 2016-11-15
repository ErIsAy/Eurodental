class ReceiptPdf < Prawn::Document
  include ActionView::Helpers::NumberHelper

  def initialize(sale)
    super(top_margin: 10)
    @sale = sale
    header
    details
    body_table
  end

  def header
  end

  def details
  end

  def body_table
  end



end

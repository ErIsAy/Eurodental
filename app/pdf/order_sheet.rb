class OrderSheet < Prawn::Document
  include ActionView::Helpers::NumberHelper

  def initialize(store, sale)
    super(top_margin: 10)
    @store = store
    @sale = sale
    hi
  end


  def hi
    text "No. de Orden: ", size: 15, style: :italic, :align => :right
    text "This <i>includes <b>inline</b></i> <font size='24'>" + "formatting</font>", :inline_format => true
  end

end

class PricesController < ApplicationController
  # before_action :set_supplier, only: [:show, :edit, :update, :destroy]

  def home
  end



  def update_prices
    @price = Price.new(price_params)
    @price.save
  end



  # Never trust parameters from the scary internet, only allow the white list through.
  def price_params
    params.require(:price).permit(:perno_price, :soldadura_price,:zirconio_price,
                                  :disilicato_price,
                                  :fedespatica_price,
                                  :porcelana_price,
                                  :pmma_price,
                                  :polimero_price,
                                  :composite_price,
                                  :metal_porcelana_price,
                                  :zirconio_porcelana_price,
                                  :peek_price,
                                  :vita_classic_price,
                                  :vita_3d_price,
                                  :bioform_price,
                                  :chromarcop_price,
                                  :otras_price

    )
  end
end

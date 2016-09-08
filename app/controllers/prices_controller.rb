class PricesController < ApplicationController
  # before_action :set_price

  def show
    @price = Price.all
  end

  def home
    @price = Price.all
  end

  def update_prices

    perno_price = params[:perno_price]
    soldadura_price = params[:soldadura_price]
    zirconio_price = params[:zirconio_price]
    disilicato_price = params[:disilicato_price]
    fedespatica_price = params[:fedespatica_price]
    porcelana_price = params[:porcelana_price]
    pmma_price = params[:pmma_price]
    polimero_price = params[:polimero_price]
    composite_price = params[:composite_price]
    metal_porcelana_price = params[:metal_porcelana_price]
    zirconio_porcelana_price = params[:zirconio_porcelana_price]
    peek_price = params[:peek_price]
    vita_classic_price = params[:vita_classic_price]
    vita_3d_price = params[:vita_3d_price]
    bioform_price = params[:bioform_price]
    chromarcop_price = params[:chromarcop_price]
    otras_price = params[:otras_price]


    precios = Price.find_by_id(1)
    Price.where(:id => 1).update_all(:perno_price => perno_price,
                                     :soldadura_price => soldadura_price,
                                     :zirconio_price => zirconio_price,
                                     :disilicato_price => disilicato_price,
                                     :fedespatica_price => fedespatica_price,
                                     :porcelana_price => porcelana_price,
                                     :pmma_price => pmma_price,
                                     :polimero_price => polimero_price,
                                     :composite_price => composite_price,
                                     :metal_porcelana_price => metal_porcelana_price,
                                     :zirconio_porcelana_price => zirconio_porcelana_price,
                                     :peek_price => peek_price,
                                     :vita_classic_price => vita_classic_price,
                                     :vita_3d_price => vita_3d_price,
                                     :bioform_price => bioform_price,
                                     :chromarcop_price => chromarcop_price,
                                     :otras_price => otras_price)


    precios.save
    redirect_to prices_show_path
  end


end

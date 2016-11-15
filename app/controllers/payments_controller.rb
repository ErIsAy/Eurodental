class PaymentsController < ApplicationController

  def make_payment
    @sale = Sale.find(params[:payments][:sale_id])
    Payment.create(payment_type: params[:payments][:payment_type],
                   amount: params[:payments][:amount],
                   sale_id: params[:payments][:sale_id])

    @amt = params[:payments][:amount]

    @sale.remaining_amount -= @amt.to_d
    
    # ToDO - Check if this is working as intended
    # if @sale.remaining_amount < 0
    #   @sale.remaining_amount = 0
    # end

    if @sale.remaining_amount - @sale.discount_amount <=0
      @sale.remaining_amount = 0
      @sale.paid_status = true
      @sale.state = "Facturada - pago"
    end

    if @sale.save
      redirect_to sale_path(@sale)
    else
      render 'new'
    end

    #
    # respond_to do |format|
    #   # format.js
    #   redirect_to sale_path(@sale)
    # end
  end

  private

  def payment_params
    params.require(:payment).permit(:payment_type, :amount, :sale_id)
  end

end

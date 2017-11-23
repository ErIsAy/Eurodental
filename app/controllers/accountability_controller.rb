class AccountabilityController < ApplicationController
  def index
    # @search = Sale.ransack(params[:q])
    # @sales = @search.result

    @search = Sale.joins(:invoice_number).merge(InvoiceNumber.order(id: :asc)).ransack(params[:q])
    @sales = @search.result.page(params[:page])
  end
end

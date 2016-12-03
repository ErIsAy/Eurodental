class ReportsController < ApplicationController
  def index
  end

  def orders_unpaid
    # @sales = Sale.all
    @search = Sale.ransack(params[:q])
    @sales = @search.result.page(params[:page]).per_page(15)
  end

  def orders_paid
    # @sales = Sale.all
    @search = Sale.ransack(params[:q])
    @sales = @search.result.page(params[:page]).per_page(15)
  end

  def pending_balance
    # @sales = Sale.all
    # @clients = Client.all
    @search = Sale.ransack(params[:q])
    @sales = @search.result.page(params[:page]).per_page(15)
  end
end

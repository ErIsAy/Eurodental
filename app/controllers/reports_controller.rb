class ReportsController < ApplicationController
  def index
  end

  def orders_unpaid
    @sales = Sale.all
  end

  def orders_paid
    @sales = Sale.all
  end

  def pending_balance
    @sales = Sale.all
    @clients = Client.all
  end
end

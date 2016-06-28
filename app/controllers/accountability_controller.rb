class AccountabilityController < ApplicationController
  def index
    @search = Order.ransack(params[:q])
    @orders = @search.result
  end
end

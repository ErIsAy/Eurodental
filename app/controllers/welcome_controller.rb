class WelcomeController < ApplicationController
  def index
    @search = Sale.ransack(params[:q])
    @sales = @search.result
  end
end

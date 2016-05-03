class WelcomeController < ApplicationController
  def index
    @orders = Order.all
  end
end

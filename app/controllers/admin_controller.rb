class AdminController < ApplicationController
  http_basic_authenticate_with :name => "admin", :password => "secret"
 
  def index
    @activities = PublicActivity::Activity.all
  end

  def servicios

  end
end

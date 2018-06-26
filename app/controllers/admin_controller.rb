class AdminController < ApplicationController
  # http_basic_authenticate_with :name => "admin", :password => "secret"
 
  def index
    @activities = PublicActivity::Activity.all
  end

  def servicios

  end


  def auth
    # byebug
    if params[:username]
      if params[:username] == 'admin' && params[:pass] == 'secret'
        redirect_to admin_index_path
      else
        flash[:error_item] = 'Ingrese las credenciales correctamente'
      end
    end
  end
end

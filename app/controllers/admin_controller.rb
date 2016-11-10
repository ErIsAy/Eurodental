class AdminController < ApplicationController
  def index
    @activities = PublicActivity::Activity.all
  end

  def servicios

  end
end

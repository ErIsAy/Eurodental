class UserMonitorsController < ApplicationController
  before_action :set_user_monitor, only: [:show, :edit, :update, :destroy]

  # GET /user_monitors
  # GET /user_monitors.json
  def index
    # @user_monitors = UserMonitor.all
    @search = UserMonitor.ransack(params[:q])
    @user_monitors = @search.result.page(params[:page]).per_page(20)

  end

  # GET /user_monitors/1
  # GET /user_monitors/1.json
  def show
  end

  # GET /user_monitors/new
  def new
    @user_monitor = UserMonitor.new
  end

  # GET /user_monitors/1/edit
  def edit
  end

  # POST /user_monitors
  # POST /user_monitors.json
  def create
    @user_monitor = UserMonitor.new(user_monitor_params)

    respond_to do |format|
      if @user_monitor.save
        format.html { redirect_to @user_monitor, notice: 'User monitor was successfully created.' }
        format.json { render :show, status: :created, location: @user_monitor }
      else
        format.html { render :new }
        format.json { render json: @user_monitor.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /user_monitors/1
  # PATCH/PUT /user_monitors/1.json
  def update
    respond_to do |format|
      if @user_monitor.update(user_monitor_params)
        format.html { redirect_to @user_monitor, notice: 'User monitor was successfully updated.' }
        format.json { render :show, status: :ok, location: @user_monitor }
      else
        format.html { render :edit }
        format.json { render json: @user_monitor.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /user_monitors/1
  # DELETE /user_monitors/1.json
  def destroy
    @user_monitor.destroy
    respond_to do |format|
      format.html { redirect_to user_monitors_url, notice: 'User monitor was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user_monitor
      @user_monitor = UserMonitor.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_monitor_params
      params.require(:user_monitor).permit(:user, :info)
    end
end

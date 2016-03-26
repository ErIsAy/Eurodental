class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :edit, :update, :destroy]

  # GET /orders
  # GET /orders.json
  def index
    @orders = Order.all
  end

  # GET /orders/1
  # GET /orders/1.json
  def show
  end

  # GET /orders/new
  def new
  #  session[:order_params] ||= {}
    @order = Order.new
    # @order.current_step = session[:order_step]
  end

  # GET /orders/1/edit
  def edit
  end

  # POST /orders
  # POST /orders.json
  def create
  #  session[:order_params].deep_merge!(params[:order]) if params[:order]
  #  @order = Order.new(session[:order_params])
     @order = Order.new(order_params)
#    @order.current_step = session[:order_step]
  #  @order.patient_id = Patient.find_or_create_by(name: session[:order_params][:patient_name]).id
  #   @order.patient_id = Patient.find_or_create_by(name: params[:order][:patient_name]).id


    #
    # if params[:back_button]
    #   @order.previous_step
    # elsif @order.last_step?
    #   @order.save
    # else
    #   @order.next_step
    # end
    # session[:order_step] = @order.current_step
    #
    # if @order.new_record?
    #   render "new"
    # else
    #   session[:order_step] = session[:order_params] = nil
    #   redirect_to @order
    # end



    respond_to do |format|
      if @order.save
        format.html { redirect_to orders_path, notice: 'La Orden fue creada exitosamente.' }
        # format.html { redirect_to @order, notice: 'Order was successfully created.' }
        format.json { render :show, status: :created, location: @order }

      else
        @order.errors.add("Paciente", "No puede estar en blanco") unless @order.patient_id.present?
        format.html { render :new }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end

  end

  # PATCH/PUT /orders/1
  # PATCH/PUT /orders/1.json
  def update
    respond_to do |format|
      if @order.update(order_params)
        format.html { redirect_to @order, notice: 'La Orden fue actualizada exitosamente.' }
        format.json { render :show, status: :ok, location: @order }
      else
        format.html { render :edit }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /orders/1
  # DELETE /orders/1.json
  def destroy
    @order.destroy
    respond_to do |format|
      format.html { redirect_to orders_url, notice: 'La Orden fue eliminada exitosamente.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def order_params
       params.require(:order).permit(:order_date, :patient_name, :age, :sex, :client_note, :other_note, :client_id)
      #params.permit(:order_date, :patient_name, :age, :sex, :client_note, :other_note, :client_id)
    end
end

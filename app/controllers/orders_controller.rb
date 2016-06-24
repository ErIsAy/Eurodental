class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :edit, :update, :destroy]

  # GET /orders
  # GET /orders.json
  def index
    # @orders = Order.all
    @search = Order.ransack(params[:q])
    @orders = @search.result
  end

  # GET /orders/1
  # GET /orders/1.json
  def show
  end

  def orders_completed
    @search = Order.ransack(params[:q])
    @orders = @search.result
  end

  def orders_test
    @search = Order.ransack(params[:q])
    @orders = @search.result
  end

  def orders_process
    @search = Order.ransack(params[:q])
    @orders = @search.result
  end

  def orders_urgent
    @search = Order.ransack(params[:q])
    @orders = @search.result
  end


  # GET /orders/new
  def new
    session[:order_params] ||= {}
    @order = Order.new
    @order.current_step = session[:order_step]
  end

  # GET /orders/1/edit
  def edit
  end

  # POST /orders
  # POST /orders.json
  def create
    session[:order_params].deep_merge!(params[:order]) if params[:order]
    @order = Order.new(session[:order_params])
    @order.current_step = session[:order_step]


  if @order.valid?
    if params[:back_button]
      @order.previous_step
    elsif @order.last_step?
      @order.save
    else
      @order.next_step
    end
    session[:order_step] = @order.current_step
  end
    if @order.new_record?
      render "new"
    else
      session[:order_step] = session[:order_params] = nil
      # flash[:notice] = "Orden Salvada Correctamente"
      redirect_to orders_path, notice: "Orden Salvada Correctamente"
    end


    #
    # respond_to do |format|
    #   if @order.save
    #     format.html { redirect_to orders_path, notice: 'La Orden fue creada exitosamente.' }
    #     # format.html { redirect_to @order, notice: 'Order was successfully created.' }
    #     format.json { render :show, status: :created, location: @order }
    #
    #   else
    #     @order.errors.add("Paciente", "No puede estar en blanco") unless @order.patient_id.present?
    #     format.html { render :new }
    #     format.json { render json: @order.errors, status: :unprocessable_entity }
    #   end
    # end

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
       params.require(:order).permit(:order_date, :coti, :patient_name, :age, :sex, :client_note, :other_note, :client_id, :antagonista, :foto, :mordida,
                                      item_ids: [])

#items_attributes: [:id, :name, :price, :category_id ]
      #params.require(:order).permit(:order_date, :patient_name, :age, :sex, :client_note, :other_note, :client_id, {:detalles => [:id, :desc, :precio]})
      #params.permit(:order_date, :patient_name, :age, :sex, :client_note, :other_note, :client_id)
    end
end

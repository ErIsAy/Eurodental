class SalesController < ApplicationController
  before_action :set_sale, only: [:show, :edit, :update, :destroy]
  before_action :set_discount, only: [:show, :edit, :update, :destroy]
  # before_action :set_total, only: [:show, :edit, :update, :destroy]

  # GET /sales
  # GET /sales.json
  def index
    # @sales = Sale.all
    @search = Sale.ransack(params[:q])
    @sales = @search.result.page(params[:page]).per_page(15)

  end

# Label de 6'' (2.4 '' x 7.2'')
  def label_print
    @sale = Sale.find(params[:sale_id])
    respond_to do |format|
      format.html
      format.pdf do
      pdf = LabelPdf.new(@sale)
      send_data pdf.render,
        filename: "Label_Orden_#{@sale.id}.pdf",
        type: "application/pdf",
        disposition: "inline" ##display in browser
      end
    end
  end

  # Label de 3'' (2.4'' x 3.9'')
    def label_print_e3
      @sale = Sale.find(params[:sale_id])
      respond_to do |format|
        format.html
        format.pdf do
        pdf = LabelPdfE3.new(@sale)
        send_data pdf.render,
          filename: "Label_Orden_#{@sale.id}.pdf",
          type: "application/pdf",
          disposition: "inline" ##display in browser
        end
      end
    end


    # Label de 0.5'' (2.4'' x 1.1'')
      def label_print_e5
        @sale = Sale.find(params[:sale_id])
        respond_to do |format|
          format.html
          format.pdf do
          pdf = LabelPdfE5.new(@sale)
          send_data pdf.render,
            filename: "Label_Orden_#{@sale.id}.pdf",
            type: "application/pdf",
            disposition: "inline" ##display in browser
          end
        end
      end





  def factura_print
    @sale = Sale.find(params[:id])
    if @sale.invoice_date == nil
      @sale.invoice_date = Time.now
    end
    respond_to do |format|
      format.html
      format.pdf do
      # Generar @order.invoice_num aqui
      # byebug
      if @sale.invoice_number.nil?
        invoice_number = @sale.invoice_number || @sale.create_invoice_number
        invoice_number.increment!
        # byebug
        @sale.invoice_num = invoice_number.id
        @sale.save
      end
      @sale.save
      pdf = FacturaPdf.new(@sale)
      send_data pdf.render,
        filename: "factura_#{@sale.id}.pdf",
        type: "application/pdf",
        disposition: "inline" ##display in browser
      end
    end
  end





  # GET /sales/1
  # GET /sales/1.json
  def show
  end

  # GET /sales/new
  def new
    @sale = Sale.new
    @clients = Client.all

    if params[:client]
      @client = Client.find(params[:client])
    end
  end

  # GET /sales/1/edit
  def edit
    @clients = Client.all

  end

  # POST /sales
  # POST /sales.json
  def create
    @clients = Client.all
    @sale = Sale.new(sale_params)



    if @sale.coti
      @sale.state = "Cotizacion"
    end

    respond_to do |format|
      if @sale.save
        UserMonitor.create(user: current_user.id, info: "Ha agregado Nueva Orden ##{@sale.id}")
        format.html { redirect_to @sale, notice: 'Orden Salvada Correctamente.' }
        format.json { render :show, status: :created, location: @sale }
      else
        format.html { render :new }
        format.json { render json: @sale.errors, status: :unprocessable_entity }
      end
    end
  end




  # PATCH/PUT /sales/1
  # PATCH/PUT /sales/1.json
  def update
    unless  params[:sale][:state] == "cotizacion"
      @sale.coti = false
    end



    respond_to do |format|
      if @sale.update(sale_params)
        format.html { redirect_to @sale, notice: 'La Orden fue actualizada exitosamente.' }
        format.json { render :show, status: :ok, location: @sale }
      else
        format.html { render :edit }
        format.json { render json: @sale.errors, status: :unprocessable_entity }
      end
    end
  end

  def set_discount
    @sale.discount_amount = @sale.total_amount*(@sale.discount/100)
    @sale.save
  end

  def set_total
    @sale.total_amount = @sale.total_amount - @sale.discount_amount
    @sale.save
  end


  # DELETE /sales/1
  # DELETE /sales/1.json
  def destroy
    @sale_d_id = @sale.id
    @sale.destroy

    respond_to do |format|
      UserMonitor.create(user: current_user.id, info: "Ha Eliminado Orden ##{sale_d_id}")
      format.html { redirect_to sales_url, notice: 'La Orden fue eliminada exitosamente.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sale
      @sale = Sale.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sale_params
      params.require(:sale).permit(:patient_name, :age, :sex, :order_date,
                                   :client_note, :other_note, :coti, :state,
                                   :concept, :invoice_num, :invoice_date, :paid_status, :total_amount, :discount, :discount_amount,
                                   :order_total, :remaining_amount, :client_id)
    end
end

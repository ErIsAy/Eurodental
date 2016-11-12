class StoresController < ApplicationController
  before_action :find_sale

  # before_action :set_store, only: [:show, :edit, :update, :destroy]
  before_action :find_store, only: [:edit, :update, :destroy]

  # GET /stores
  # GET /stores.json
  def index
    @stores = Store.all
  end

  # GET /stores/1
  # GET /stores/1.json
  def show
  end

  # GET /stores/new
  def new
    @store = Store.new
    @worktypes = Worktype.all
    @materials = Material.all
    @mcolors = Mcolor.all
    @gcolors = Gcolor.all
    @procedures = Procedure.all

  end

  # GET /stores/1/edit
  def edit
    @worktypes = Worktype.all
    @materials = Material.all
    @mcolors = Mcolor.all
    @gcolors = Gcolor.all
    @procedures = Procedure.all
  end

  # POST /stores
  # POST /stores.json
  def create
    @worktypes = Worktype.all
    @materials = Material.all
    @mcolors = Mcolor.all
    @gcolors = Gcolor.all
    @procedures = Procedure.all

    @store = Store.new(store_params)
    @store.sale_id = params[:sale_id]
    @store.worktype_id = params[:worktype_store_id]
    @store.material_id = params[:material_store_id]
    @store.mcolor_id = params[:mcolor_store_id]
    @store.gcolor_id = params[:gcolor_store_id]
    @store.procedure_id = params[:procedure_store_id]

    @sale.total_amount += @store.amount
    @sale.save

    if @store.save
      redirect_to sale_path(@sale)
    else
      render 'new'
    end

    #
    # respond_to do |format|
    #   if @store.save
    #     redirect_to sale_path(:sale_id)
    #     # format.html { redirect_to @store, notice: 'Store was successfully created.' }
    #     # format.html { redirect_to sales_path(@sale), notice: 'Servicio Agregado a la Orden.' }
    #
    #     format.json { render :show, status: :created, location: @store }
    #   else
    #     format.html { render :new }
    #     format.json { render json: @store.errors, status: :unprocessable_entity }
    #   end
    # end



  end

  # PATCH/PUT /stores/1
  # PATCH/PUT /stores/1.json
  def update
    respond_to do |format|
      if @store.update(store_params)
        format.html { redirect_to @store, notice: 'Store was successfully updated.' }
        format.json { render :show, status: :ok, location: @store }
      else
        format.html { render :edit }
        format.json { render json: @store.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /stores/1
  # DELETE /stores/1.json
  def destroy
    @store.destroy
    @sale.total_amount -= @store.amount
    @sale.save
    redirect_to sale_path(@sale)
    # respond_to do |format|
    #   format.html { redirect_to stores_url, notice: 'Store was successfully destroyed.' }
    #   format.json { head :no_content }
    # end
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def store_params
      params.require(:store).permit(:tooth, :note, :color_note, :implant, :brand, :amount, :sale_id, :cant,
                                      :antagonista, :mordida,
                                      :worktype_id, :material_id, :mcolor_id, :gcolor_id, :procedure_id)
    end

    def find_sale
      @sale = Sale.find(params[:sale_id])
    end



    def find_store
      @store = Store.find(params[:id])
    end

    # Use callbacks to share common setup or constraints between actions.
    # def set_store
    #   @store = Store.find(params[:id])
    # end


end

class ClientsController < ApplicationController
  before_action :set_client, only: [:show, :edit, :update, :destroy]

  # GET /clients
  # GET /clients.json
  def index
    # @clients = Client.all.order("created_at DESC")
    @search = Client.ransack(params[:q])
    @clients = @search.result.page(params[:page]).per_page(15)
  end

  # GET /clients/1
  # GET /clients/1.json
  def show
    @sales = Sale.joins(:client).where(client_id: @client)
  end

  # GET /clients/new
  def new
    @client = Client.new
  end

  # GET /clients/1/edit
  def edit
  end

  # POST /clients
  # POST /clients.json
  def create
    @client = Client.new(client_params)

    respond_to do |format|
      if @client.save
        UserMonitor.create(user: current_user.id, info: "Ha agregado nuevo cliente: #{@client.name}")
        # format.html { redirect_to @client, notice: 'Client was successfully created.' }
        format.html { redirect_to clients_path, notice: 'Cliente fue creado exitosamente.' }
        format.json { render :show, status: :created, location: @client }
      else
        format.html { render :new }
        format.json { render json: @client.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /clients/1
  # PATCH/PUT /clients/1.json
  def update
    respond_to do |format|
      if @client.update(client_params)
        # format.html { redirect_to @client, notice: 'Cliente fue actualizado exitosamente.' }
        format.html { redirect_to clients_url, notice: 'Cliente fue actualizado exitosamente.' }
        format.json { render :show, status: :ok, location: @client }
      else
        format.html { render :edit }
        format.json { render json: @client.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /clients/1
  # DELETE /clients/1.json
  def destroy
    @client.destroy
    respond_to do |format|
      format.html { redirect_to clients_url, notice: 'Cliente fue eliminado exitosamente.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_client
      @client = Client.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def client_params
      params.require(:client).permit(:name, :address, client_emails_attributes: [:id, :email, :_destroy],
                                     client_phones_attributes: [:id, :phone, :ptype, :_destroy] )
    end
end

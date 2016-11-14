class GcolorsController < ApplicationController
  before_action :set_gcolor, only: [:show, :edit, :update, :destroy]
  respond_to :json, :html, only: :show

  # GET /gcolors
  # GET /gcolors.json
  def index
    @gcolors = Gcolor.all
  end

  # GET /gcolors/1
  # GET /gcolors/1.json
  def show
    @gcolors = Gcolor.find(params[:id])
    respond_with @gcolors
  end

  # GET /gcolors/new
  def new
    @gcolor = Gcolor.new
  end

  # GET /gcolors/1/edit
  def edit
  end

  # POST /gcolors
  # POST /gcolors.json
  def create
    @gcolor = Gcolor.new(gcolor_params)

    respond_to do |format|
      if @gcolor.save
        format.html { redirect_to gcolors_url, notice: 'Datos salvados correctamente' }
        # format.html { redirect_to @gcolor, notice: 'Gcolor was successfully created.' }
        format.json { render :show, status: :created, location: @gcolor }
      else
        format.html { render :new }
        format.json { render json: @gcolor.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /gcolors/1
  # PATCH/PUT /gcolors/1.json
  def update
    respond_to do |format|
      if @gcolor.update(gcolor_params)
        format.html { redirect_to gcolors_url, notice: 'Datos salvados correctamente' }
        # format.html { redirect_to @gcolor, notice: 'Gcolor was successfully updated.' }
        format.json { render :show, status: :ok, location: @gcolor }
      else
        format.html { render :edit }
        format.json { render json: @gcolor.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /gcolors/1
  # DELETE /gcolors/1.json
  def destroy
    @gcolor.destroy
    respond_to do |format|
      format.html { redirect_to gcolors_url, notice: 'Guía de Color seleccionada ha sido Eliminada' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_gcolor
      @gcolor = Gcolor.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def gcolor_params
      params.require(:gcolor).permit(:name, :price)
    end
end

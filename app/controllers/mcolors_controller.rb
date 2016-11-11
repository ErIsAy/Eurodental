class McolorsController < ApplicationController
  before_action :set_mcolor, only: [:show, :edit, :update, :destroy]

  # GET /mcolors
  # GET /mcolors.json
  def index
    @mcolors = Mcolor.all
  end

  # GET /mcolors/1
  # GET /mcolors/1.json
  def show
  end

  # GET /mcolors/new
  def new
    @mcolor = Mcolor.new
  end

  # GET /mcolors/1/edit
  def edit
  end

  # POST /mcolors
  # POST /mcolors.json
  def create
    @mcolor = Mcolor.new(mcolor_params)

    respond_to do |format|
      if @mcolor.save
        format.html { redirect_to @mcolor, notice: 'Mcolor was successfully created.' }
        format.json { render :show, status: :created, location: @mcolor }
      else
        format.html { render :new }
        format.json { render json: @mcolor.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /mcolors/1
  # PATCH/PUT /mcolors/1.json
  def update
    respond_to do |format|
      if @mcolor.update(mcolor_params)
        format.html { redirect_to @mcolor, notice: 'Mcolor was successfully updated.' }
        format.json { render :show, status: :ok, location: @mcolor }
      else
        format.html { render :edit }
        format.json { render json: @mcolor.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /mcolors/1
  # DELETE /mcolors/1.json
  def destroy
    @mcolor.destroy
    respond_to do |format|
      format.html { redirect_to mcolors_url, notice: 'Mcolor was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_mcolor
      @mcolor = Mcolor.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def mcolor_params
      params.require(:mcolor).permit(:name, :price)
    end
end

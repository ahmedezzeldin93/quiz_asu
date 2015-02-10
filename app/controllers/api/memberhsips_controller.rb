module API
class MemberhsipsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_memberhsip, only: [:show, :edit, :update, :destroy]

  # GET /memberhsips
  # GET /memberhsips.json
  def index
    @memberhsips = Memberhsip.all
  end

  # GET /memberhsips/1
  # GET /memberhsips/1.json
  def show
  end

  # GET /memberhsips/new
  def new
    @memberhsip = Memberhsip.new
  end

  # GET /memberhsips/1/edit
  def edit
  end

  # POST /memberhsips
  # POST /memberhsips.json
  def create
    @memberhsip = Memberhsip.new(memberhsip_params)

    respond_to do |format|
      if @memberhsip.save
        format.html { redirect_to @memberhsip, notice: 'Memberhsip was successfully created.' }
        format.json { render :show, status: :created, location: @memberhsip }
      else
        format.html { render :new }
        format.json { render json: @memberhsip.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /memberhsips/1
  # PATCH/PUT /memberhsips/1.json
  def update
    respond_to do |format|
      if @memberhsip.update(memberhsip_params)
        format.html { redirect_to @memberhsip, notice: 'Memberhsip was successfully updated.' }
        format.json { render :show, status: :ok, location: @memberhsip }
      else
        format.html { render :edit }
        format.json { render json: @memberhsip.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /memberhsips/1
  # DELETE /memberhsips/1.json
  def destroy
    @memberhsip.destroy
    respond_to do |format|
      format.html { redirect_to memberhsips_url, notice: 'Memberhsip was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_memberhsip
      @memberhsip = Memberhsip.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def memberhsip_params
      params.require(:memberhsip).permit(:status)
    end
end
end
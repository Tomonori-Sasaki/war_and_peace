class MonsterDataController < ApplicationController
  before_action :set_monster_datum, only: [:show, :edit, :update, :destroy]
  before_action :super_user

  # GET /monster_data
  # GET /monster_data.json
  def index
    @monster_data = MonsterDatum.all
  end

  # GET /monster_data/1
  # GET /monster_data/1.json
  def show
  end

  # GET /monster_data/new
  def new
    @monster_datum = MonsterDatum.new
  end

  # GET /monster_data/1/edit
  def edit
  end

  # POST /monster_data
  # POST /monster_data.json
  def create
    @monster_datum = MonsterDatum.new(monster_datum_params)

    respond_to do |format|
      if @monster_datum.save
        format.html { redirect_to @monster_datum, notice: 'Monster datum was successfully created.' }
        format.json { render :show, status: :created, location: @monster_datum }
      else
        format.html { render :new }
        format.json { render json: @monster_datum.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /monster_data/1
  # PATCH/PUT /monster_data/1.json
  def update
    respond_to do |format|
      if @monster_datum.update(monster_datum_params)
        format.html { redirect_to @monster_datum, notice: 'Monster datum was successfully updated.' }
        format.json { render :show, status: :ok, location: @monster_datum }
      else
        format.html { render :edit }
        format.json { render json: @monster_datum.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /monster_data/1
  # DELETE /monster_data/1.json
  def destroy
    @monster_datum.destroy
    respond_to do |format|
      format.html { redirect_to monster_data_url, notice: 'Monster datum was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_monster_datum
      @monster_datum = MonsterDatum.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def monster_datum_params
      params.require(:monster_datum).permit(:name, :type, :hp, :attack, :defence, :speed, :hp_add, :attack_add, :defence_add, :speed_add, :level, :exp, :tech1, :tech2, :tech3, :tech4, :region_id, :image_name, :capture_coefficient)
    end


end

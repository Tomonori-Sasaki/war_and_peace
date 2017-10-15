class SkillDataController < ApplicationController
  before_action :set_skill_datum, only: [:show, :edit, :update, :destroy]
  before_action :super_user

  # GET /skill_data
  # GET /skill_data.json
  def index
    @skill_data = SkillDatum.all
  end

  # GET /skill_data/1
  # GET /skill_data/1.json
  def show
  end

  # GET /skill_data/new
  def new
    @skill_datum = SkillDatum.new
  end

  # GET /skill_data/1/edit
  def edit
  end

  # POST /skill_data
  # POST /skill_data.json
  def create
    @skill_datum = SkillDatum.new(skill_datum_params)

    respond_to do |format|
      if @skill_datum.save
        format.html { redirect_to @skill_datum, notice: 'Skill datum was successfully created.' }
        format.json { render :show, status: :created, location: @skill_datum }
      else
        format.html { render :new }
        format.json { render json: @skill_datum.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /skill_data/1
  # PATCH/PUT /skill_data/1.json
  def update
    respond_to do |format|
      if @skill_datum.update(skill_datum_params)
        format.html { redirect_to @skill_datum, notice: 'Skill datum was successfully updated.' }
        format.json { render :show, status: :ok, location: @skill_datum }
      else
        format.html { render :edit }
        format.json { render json: @skill_datum.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /skill_data/1
  # DELETE /skill_data/1.json
  def destroy
    @skill_datum.destroy
    respond_to do |format|
      format.html { redirect_to skill_data_url, notice: 'Skill datum was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_skill_datum
      @skill_datum = SkillDatum.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def skill_datum_params
      params.require(:skill_datum).permit(:name, :pp, :power, :accuracy, :type, :examination)
    end
end

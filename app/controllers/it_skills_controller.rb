class ItSkillsController < ApplicationController
  before_action :set_it_skill, only: [:show, :edit, :update, :destroy]
   before_action :logged_in_user, only: [:create]

  # GET /it_skills
  # GET /it_skills.json
  def index
    @it_skills = ItSkill.all
  end

  # GET /it_skills/1
  # GET /it_skills/1.json
  def show
  end

  # GET /it_skills/new
  def new
    @it_skill = ItSkill.new
  end

  # GET /it_skills/1/edit
  def edit
  end
  
  def ItItem
  end

  # POST /it_skills
  # POST /it_skills.json
  def create
    @it_skill = ItSkill.new(it_skill_params)

    respond_to do |format|
      if @it_skill.save
        format.html { redirect_to @it_skill, notice: 'It skill was successfully created.' }
        format.json { render :show, status: :created, location: @it_skill }
      else
        format.html { render :new }
        format.json { render json: @it_skill.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /it_skills/1
  # PATCH/PUT /it_skills/1.json
  def update
    respond_to do |format|
      if @it_skill.update(it_skill_params)
        format.html { redirect_to @it_skill, notice: 'ITアイテム更新しました.' }
        format.json { render :show, status: :ok, location: @it_skill }
      else
        format.html { render :edit }
        format.json { render json: @it_skill.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /it_skills/1
  # DELETE /it_skills/1.json
  def destroy
    @it_skill.destroy
    respond_to do |format|
      format.html { redirect_to it_skills_url, notice: 'It skill was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_it_skill
      @it_skill = ItSkill.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def it_skill_params
      params.require(:it_skill).permit(:ITimage, :ITName, :user_id, :existence, :educate, :Field, :Itgenre, :Accession, 
      :Resident, :TypeIndustry, :dgpn, :dbweb, :dbopen, :dbnclusion, :dbfirmware, :dbcontrol, :frequency, :ITRemarks,
      :Skilllogo)
    end
end

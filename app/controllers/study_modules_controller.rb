class StudyModulesController < ApplicationController

  before_action :set_studymodule, only: [:show, :edit, :update, :destroy]

  # GET /courses
  # GET /courses.json
  def index
    @study_modules = StudyModule.all
  end

  # GET /courses/1
  # GET /courses/1.json
  def show
  end

  # GET /courses/new
  def new
    @studyModule = StudyModule.new
  end

  # GET /courses/1/edit
  def edit
  end

  # POST /courses
  # POST /courses.json
  def create
    @studymodule = StudyModule.new(studymodule_params)

    respond_to do |format|
      if @studymodule.save
        format.html { redirect_to @studymodule, notice: 'Study Module was successfully created.' }
        format.json { render :show, status: :created, location: @studymodule }
      else
        format.html { render :new }
        format.json { render json: @studymodule.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /courses/1
  # PATCH/PUT /courses/1.json
  def update
    respond_to do |format|
      if @studymodule.update(studymodule_params)
        format.html { redirect_to @studymodule, notice: 'Study Module was successfully updated.' }
        format.json { render :show, status: :ok, location: @studymodule }
      else
        format.html { render :edit }
        format.json { render json: @studymodule.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /courses/1
  # DELETE /courses/1.json
  def destroy
    @studymodule.destroy
    respond_to do |format|
      format.html { redirect_to studymodules_url, notice: 'Study Module was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_studymodule
      @studymodule = StudyModule.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def studymodule_params
      params.require(:studymodule).permit(:name)
    end

end

class StudyPathsController < ApplicationController
  before_action :set_study_path, only: [:show, :edit, :update, :destroy]

  # GET /study_paths
  # GET /study_paths.json
  def index
    @study_paths = StudyPath.all
  end

  # GET /study_paths/1
  # GET /study_paths/1.json
  def show
  end

  # GET /study_paths/new
  def new
    @study_path = StudyPath.new
  end

  # GET /study_paths/1/edit
  def edit
  end

  # POST /study_paths
  # POST /study_paths.json
  def create
    @study_path = StudyPath.new(study_path_params)

    respond_to do |format|
      if @study_path.save
        format.html { redirect_to @study_path, notice: 'Study path was successfully created.' }
        format.json { render :show, status: :created, location: @study_path }
      else
        format.html { render :new }
        format.json { render json: @study_path.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /study_paths/1
  # PATCH/PUT /study_paths/1.json
  def update
    respond_to do |format|
      if @study_path.update(study_path_params)
        format.html { redirect_to @study_path, notice: 'Study path was successfully updated.' }
        format.json { render :show, status: :ok, location: @study_path }
      else
        format.html { render :edit }
        format.json { render json: @study_path.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /study_paths/1
  # DELETE /study_paths/1.json
  def destroy
    @study_path.destroy
    respond_to do |format|
      format.html { redirect_to study_paths_url, notice: 'Study path was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_study_path
      @study_path = StudyPath.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def study_path_params
      params.require(:study_path).permit(:name, course_module_ids: [])
    end
end

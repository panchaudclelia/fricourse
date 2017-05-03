class StudyPathsController < ApplicationController
  before_action :set_studypath, only: [:show, :edit, :update, :destroy]

  # GET /courses
  # GET /courses.json
  def index
    @study_paths = StudyPath.all
  end

  # GET /courses/1
  # GET /courses/1.json
  def show
  end

  # GET /courses/new
  def new
    @studyPath = StudyPath.new
  end

  # GET /courses/1/edit
  def edit
  end

  # POST /courses
  # POST /courses.json
  def create
    @studypath = StudyPath.new(studypath_params)

    respond_to do |format|
      if @studypath.save
        format.html { redirect_to @studypath, notice: 'Study Path was successfully created.' }
        format.json { render :show, status: :created, location: @studypath }
      else
        format.html { render :new }
        format.json { render json: @studypath.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /courses/1
  # PATCH/PUT /courses/1.json
  def update
    respond_to do |format|
      if @studypath.update(studypath_params)
        format.html { redirect_to @studypath, notice: 'Study Path was successfully updated.' }
        format.json { render :show, status: :ok, location: @studypath }
      else
        format.html { render :edit }
        format.json { render json: @studypath.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /courses/1
  # DELETE /courses/1.json
  def destroy
    @studypath.destroy
    respond_to do |format|
      format.html { redirect_to studypaths_url, notice: 'Study Path was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_studypath
      @studypath = StudyPath.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def studypath_params
      params.require(:studypath).permit(:name)
    end
end

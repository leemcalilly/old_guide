class LessonsController < ApplicationController
  before_filter :require_login
  before_action :set_lesson, only: [:show, :edit, :update, :destroy]
  
  # GET /lessons
  def index
    @lessons = Lesson.all
  end

  # GET /lessons/1
  def show
  end

  # GET /lessons/new
  def new
    @lesson = Lesson.new
  end

  # GET /lessons/1/edit
  def edit
  end

  # POST /lessons
  def create
    @lesson = Lesson.new(lesson_params)

    respond_to do |format|
      if @lesson.save
        format.html { redirect_to @lesson, notice: 'Lesson created!' }
      else
        format.html { render action: 'new' }
      end
    end
  end

  # PATCH/PUT /lessons/1
  def update
    respond_to do |format|
      if @lesson.update(lesson_params)
        format.html { redirect_to @lesson, notice: 'Lesson updated!' }
      else
        format.html { render action: 'edit' }
      end
    end
  end

  # DELETE /lessons/1
  def destroy
    @lesson.destroy
    respond_to do |format|
      format.html { redirect_to lessons_url }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_lesson
      @lesson = Lesson.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def lesson_params
      params.require(:lesson).permit(:title, :date, :description, :featured_photo, :level, :genre, :topic, :article, :video, :resources, :visibility)
    end
end

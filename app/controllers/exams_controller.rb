class ExamsController < ApplicationController
  before_action :authenticate_teacher!, only: [:new, :create]
  before_action :set_exam, only: [:edit, :update, :destroy]

  def index
    @exams = Exam.all.order(created_at: :desc)
  end

  def new
    @parents = Unit.all.order("id ASC")
    @exam = Exam.new
  end

  def create
    @exam = Exam.new(exam_params)
    if @exam.valid?
      @exam.save
    else
      render :new
    end
  end

  def show
    @units = Unit.find(params[:id])
    
  end

  def edit
  end

  def update
    if @exam.valid?
      @exam.update(exam_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    if @exam.destroy
      redirect_to root_path
    else
      flash.now[:alert] = '試験削除に失敗しました'
      render :index
    end
  end

  private

  def exam_params
    params.require(:exam).permit(:name, :unit_id).merge(teacher_id: current_teacher.id)
  end

  def set_exam
    @exam = Exam.find(params[:id])
  end

end

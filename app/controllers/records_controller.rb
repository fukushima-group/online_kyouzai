class RecordsController < ApplicationController
  before_action :authenticate_student!, only: [:new, :create]
  before_action :set_record, only: [:edit, :update, :destroy]

  def new
    @exam = Exam.find(params[:exam_id])
    @record = Record.new
  end

  def create
    @record = Record.new(record_params)
    if @record.valid?
      @record.save
    else
      render :new
    end
  end

  def edit
    @exam = Exam.find(params[:exam_id])
  end

  def update
    if @record.valid?
      @record.update(record_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    if @record.destroy
      redirect_to root_path
    else
      flash.now[:alert] = '成績削除に失敗しました'
      render :index
    end
  end



  private

  def record_params
    params.require(:record).permit(:score).merge(student_id: current_student.id, exam_id: params[:exam_id])
  end

  def set_record
    @record = Record.find(params[:id])
  end
end

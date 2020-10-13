class ExamsController < ApplicationController

  def index
    @exams = Exam.all.order(created_at: :desc)
  end

  def new
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


  private

  def exam_params
    params.require(:exam).params(:exam)
  end
end

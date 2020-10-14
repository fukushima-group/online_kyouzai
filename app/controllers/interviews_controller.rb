class InterviewsController < ApplicationController

  def new
    @interview = Interview.new
    @student = Student.find(params[:format])
  end

  def create
    @interview = Interview.new(interview_params)
    if @interview.valid? && current_teacher.present?
      @interview.save
      @student = Student.find(params[:student_id])
      return redirect_to "/teachers/#{current_teacher.id}/student_details/#{@student.id}/interviews"
    elsif @interview.valid? && students_id == current_student.id
      @interview.save
      return redirect_to "/interviews/#{current_student.id}"
    else
      render :new
    end
  end

  def edit
    @interview = Interview.find(params[:id])
    @student = Student.find(@interview.student.id)
  end

  def update
    @interview = Interview.find(params[:id])
    if @interview.valid? && current_teacher.present?
      @interview.update(interview_params)
      @student = Student.find(params[:student_id])
      return redirect_to "/teachers/#{current_teacher.id}/student_details/#{@student.id}/interviews"
    elsif @interview.valid? && current_student.present?
      @interview.update(interview_params)
      return redirect_to interview_path
      # return redirect_to "/interviews/#{current_student.id}"
    else
      render :edit
    end
  end


  private

  def interview_params
    params.require(:interview).permit(:content).merge(student_id: params[:student_id])
  end
end

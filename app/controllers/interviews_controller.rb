class InterviewsController < ApplicationController

  def new
    @interview = Interview.new
    @student = Student.find(params[:format])
  end

  def create
    @interview = Interview.new(interview_params)
    @student = Student.find(params[:student_id])
    if @interview.valid?
      @interview.save
      return redirect_to "/teachers/#{current_teacher.id}/student_details/#{@student.id}"
    else
      render :new
    end
  end


  private

  def interview_params
    params.require(:interview).permit(:content).merge(student_id: params[:student_id])
  end
end

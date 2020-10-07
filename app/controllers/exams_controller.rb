class ExamsController < ApplicationController

  def index
    @exams = Exam.all.order(created_at: :desc)
  end
end

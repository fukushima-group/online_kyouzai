class ExamsController < ApplicationController

  def index
    @exams = Exams.all.order(created_at: :desc)
  end
end

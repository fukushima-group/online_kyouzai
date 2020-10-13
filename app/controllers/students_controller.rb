class StudentsController < ApplicationController
  before_action :search_student, only: [:index, :search]

  def index
    @students = Student.all
    set_student_column
  end

  def search
    @results = @p.result
  end

  private

  def search_student
    @p = Student.ransack(params[:q])
  end

  def set_student_column
    # @school_year = Student.select("school_year_id").distinct  # 重複なくnameカラムのデータを取り出す
    # @club = Student.select("club_id").distinct  # 重複なくnameカラムのデータを取り出す
    # @teacher_name = Teacher.select("first_name").distinct  # 重複なくnameカラムのデータを取り出す

  end

end

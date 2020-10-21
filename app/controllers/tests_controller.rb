class TestsController < ApplicationController
  # before_action :authenticate_teacher!, expect: [:index]
  before_action :set_test, only: [:edit, :update, :destroy]

  def index
    @exam = Exam.find(params[:exam_id])
    @tests = Test.all
  end

  def new
    @exam = Exam.find(params[:exam_id])
    @test = Test.new
  end

  def create
    @exam = Exam.find(params[:exam_id])
    @test = Test.new(test_params)
    if @test.valid?
      @test.save
      redirect_to exam_tests_path
    else
      render :new
    end
  end

  def show
  end

  def edit
    @exam = Exam.find(params[:exam_id])
  end

  def update
    if @test.valid?
      @test.update(test_params)
      redirect_to exam_tests_path
    else
      render :edit
    end
  end

  def destroy
    if @test.destroy
      redirect_to exam_tests_path
    else
      flash.now[:alert] = '試験削除に失敗しました'
      render :index
    end
  end

  private

  def test_params
    params.require(:test).permit(:question, :answer).merge(exam_id: params[:exam_id])
  end

  def set_test
    @test = Test.find(params[:id])
  end

end

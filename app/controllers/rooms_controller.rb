class RoomsController < ApplicationController

  def index
    @rooms = Room.where(teacher_id: current_teacher.id) if teacher_signed_in?
    @rooms = Room.where(student_id: current_student.id) if student_signed_in?
    # 先生側のDM情報取得
    if params[:format].present?
      room_check
    end
  end

  def destroy
    @room = Room.find(params[:id])
    if @room.destroy
      redirect_to rooms_path
    else
      render :index
    end
  end

  private

  def room_params
    params.permit(:teacher_id, :student_id)
  end

  def room_check
    @room = Room.find_by(teacher_id: current_teacher.id, student_id: params[:format]) if teacher_signed_in?
    @room = Room.find_by(teacher_id: params[:format], student_id: current_student.id) if student_signed_in?
    if @room.blank?
      create_room
    else
      @chat = Chat.new
      render template: 'chats/index'
    end
  end

  def create_room
    @room = Room.create(teacher_id: current_teacher.id, student_id: params[:format]) if teacher_signed_in?
    @room = Room.create(teacher_id: params[:format], student_id: current_student.id) if student_signed_in?
    if @room.present?
      @chat = Chat.new
      render template: 'chats/index'
    else
      flash.now[:alert] = 'DMの作成に失敗しました'
      render :index
    end
  end
end

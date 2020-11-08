class ChatsController < ApplicationController
  def index
    @chat = Chat.new
    @room = Room.find(params[:room_id])
  end

  def create
    @chat = Chat.new(chat_params)
    if @chat.valid?
      @chat.save
      redirect_to room_chats_path(@chat.room)
    else
      flash.now[:alert] = 'メッセージの送信に失敗しました'
      @chat = Chat.new
      @room = Room.find(params[:room_id])
      render :index
    end
  end

  private

  def chat_params
    if teacher_signed_in?
      params.require(:chat).permit(:message).merge(room_id: params[:room_id], user_id: current_teacher.id)
    elsif student_signed_in?
      params.require(:chat).permit(:message).merge(room_id: params[:room_id], user_id: current_student.id)
    end
  end

end

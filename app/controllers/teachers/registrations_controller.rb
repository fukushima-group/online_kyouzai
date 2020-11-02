# frozen_string_literal: true

class Teachers::RegistrationsController < Devise::RegistrationsController
  # before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]

  # GET /resource/sign_up
  # def new
  #   super
  # end

  # POST /resource
  # def create
  #   super
  # end

  # GET /resource/edit
  # def edit
  #   super
  # end

  # PUT /resource
  # def update
  #   super
  # end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  def interviews
    @student = Student.find(params[:id])
  end

  def show
    @teacher = current_teacher
  end

  def student_update
    @student = Student.find(params[:teacher_id])
    if @student.update(student_update_params)
      redirect_to "/teachers/#{current_teacher.id}", notice: '生徒情報を更新しました'
    else
      @teacher = current_teacher
      flash.now[:alert] = '生徒の追加に失敗しました'
      render "show"
    end
  end

  def student_details
    @student = Student.find(params[:id])
  end

  def teacher_profile_edit
  end

  def teacher_profile_update
    current_teacher.assign_attributes(account_update_params)
    if current_teacher.valid?
      current_teacher.save
      redirect_to "/teachers/#{current_teacher.id}", notice: 'プロフィールを更新しました'
    else
      render "teacher_profile_edit"
    end
  end

  protected

  def update_resource(resource, params)
    resource.update_without_password(params)
  end

  def student_update_params
    params.permit(:teacher_id).merge(teacher_id: current_teacher.id)
  end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_up_params
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute])
  # end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
  # end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
end

# frozen_string_literal: true

class ProfilesController < AuthenticatedController
  def show
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update(user_params)
      redirect_to profile_path, notice: 'Settings succesfully updated'
    else
      flash.now[:error] = @user.errors.full_messages.to_sentence
      render :show
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password)
  end
end

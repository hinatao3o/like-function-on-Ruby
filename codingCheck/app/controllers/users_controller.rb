class UsersController < ApplicationController
  skip_before_action :require_sign_in!, only: [:signup, :create]
  skip_before_action :require_corp_signed_in!
  protect_from_forgery except: :create

  def signup
    @user = User.new()
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to login_path
    else
      redirect_to signup_path, flash: { alert: 'アカウント作成に失敗しました。もう一度お試しください。' }
    end
  end
  
  private
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
end

class SessionsController < ApplicationController
  skip_before_action :require_sign_in!, only: [:new, :create, :corporation_new, :corporation_login, :corporation_logout]
  skip_before_action :require_corp_signed_in!, only: [:new, :create, :destroy, :corporation_new, :corporation_login]
  before_action :set_user, only: [:create]
  before_action :set_corp_admin, only: [:corporation_login]

  def new
  end

  # ログイン
  def create
    if @user.authenticate(session_params[:password])
      sign_in(@user)
      redirect_to root_path, notice: 'ログインしました！'
    else
      flash.now[:alert] = 'ログインに失敗しました。パスワードが間違っています。'
      render 'new'
    end
  end

  def destroy
    sign_out
    redirect_to "/login"
  end
  
  
  def corporation_new
  end
  
  def corporation_login
    if @corporation_admin.authenticate(corp_session_params[:password])
      corp_sign_in(@corporation_admin)
      redirect_to '/corp_admin/index', notice: 'ログインしました！'
    else
      flash.now[:alert] = 'ログインに失敗しました。パスワードが間違っています。'
      render 'corporation_new'
    end
  end
  
  def corporation_logout
    corp_sign_out
    redirect_to '/corp_admin/login'
  end
  
  private

    def set_user
      @user = User.find_by!(email: session_params[:email])
    rescue
      flash.now[:alert] = 'ログインに失敗しました。メールアドレスが間違っています。'
      render action: 'new'
    end

    # 許可するパラメータ
    def session_params
      params.require(:session).permit(:email, :password)
    end
    
    def set_corp_admin
      @corporation_admin = CorporationAdmin.find_by!(email: session_params[:email])
    rescue
      flash.now[:alert] = 'ログインに失敗しました。メールアドレスが間違っています。'
      render action: 'corporation_new'
    end
    
    def corp_session_params
      params.require(:session).permit(:email, :password)
    end

end

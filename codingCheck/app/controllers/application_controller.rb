class ApplicationController < ActionController::Base
  include ActionController::Cookies
  # protect_from_forgery with: :exception

  before_action :current_user
  before_action :current_corp_admin
  before_action :require_sign_in!
  before_action :require_corp_signed_in!

  def current_user
    remember_token = encrypt(cookies[:user_remember_token])
    @current_user ||= User.find_by(remember_token: remember_token)
  end

  def sign_in(user)
    remember_token = new_remember_token
    cookies.permanent[:user_remember_token] = remember_token
    user.update!(remember_token: encrypt(remember_token))
    @current_user = user
  end

  def sign_out
    @current_user = nil
    cookies.delete(:user_remember_token)
  end

  # ログインが必要なページでチェック・リダイレクト
  def require_sign_in!
    redirect_to login_path unless @current_user.present?
  end
  
  
  def current_corp_admin
    remember_token = encrypt(cookies[:corp_remember_token])
    @current_corp_admin ||= CorporationAdmin.find_by(remember_token: remember_token)
  end
  
  def corp_sign_in(corporation_admin)
    remember_token = new_remember_token
    cookies.permanent[:corp_remember_token] = remember_token
    corporation_admin.update!(remember_token: encrypt(remember_token))
    @current_corp_admin = corporation_admin
  end
  
  def corp_sign_out
    @current_corp_admin = nil
    cookies.delete(:corp_remember_token)
  end
  
  def require_corp_signed_in!
    redirect_to '/corp_admin/login' unless @current_corp_admin.present?
  end
  
  private
    def new_remember_token
      SecureRandom.urlsafe_base64
    end
    
    def encrypt(token)
      Digest::SHA256.hexdigest(token.to_s)
    end
end

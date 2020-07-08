class CorporationAdminsController < ApplicationController
  skip_before_action :require_sign_in!
  skip_before_action :require_corp_signed_in!, only: [:signup, :create]
  
  def job_list
    @jobs = Job.where(corporation_id: @current_corp_admin.corporation.id)
  end
  
  def user_list
    @job = Job.find(params[:job_id])
    @users = User.all
    @job_likes = JobLike.where(job_id: params[:job_id])
    
    @job_like_user_ids = []
    if @job_likes.present?
      @job_likes.each do |job_like|
        @job_like_user_ids.push(job_like.user_id)
      end
    end
    
    @user_likes = []
    if @job.user_likes.present?
      @job.user_likes.each do |user_like|
        @user_likes.push(user_like.user_id)
      end
    end
    
  end

  def signup
    @corporations = Corporation.select(:id, :name)
    @corporation_admin = CorporationAdmin.new()
  end
  
  def create
    @corporation_admin = CorporationAdmin.new(corporation_admin_params)

    if @corporation_admin.save
      redirect_to '/corp_admin/login'
    else
      redirect_to '/corp_admin/signup', flash: { alert: 'アカウント作成に失敗しました。もう一度お試しください。' }
    end
  end
  
  private
    def corporation_admin_params
      params.require(:corporation_admin).permit(:corporation_id, :name, :email, :password, :password_confirmation)
    end
end

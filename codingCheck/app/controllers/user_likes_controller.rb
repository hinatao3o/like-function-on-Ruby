class UserLikesController < ApplicationController
  skip_before_action :require_sign_in!

  def create
    @user_id = User.select(:id).find(params[:user_id]).id
    @job_id = Job.select(:id).find(params[:job_id]).id
    
    begin
      @user_likes = UserLike.create!(job_id: params[:job_id], user_id: params[:user_id])
      @user_like_flag = @user_likes.present?
    rescue
      redirect_to '/corp_admin/user_list/'+params[:job_id].to_s, flash: { alert: '「いいね」に失敗しました。もう一度お試しください。' }
    end
    
    @job_like_flag = JobLike.find_by(user_id: @user_id, job_id: @job_id).present?
  end
end

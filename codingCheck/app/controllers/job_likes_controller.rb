class JobLikesController < ApplicationController
  skip_before_action :require_corp_signed_in!

  def create
    @job = Job.find(params[:job_id])
    
    begin
      @job_likes = JobLike.create!(user_id: current_user.id, job_id: @job.id)
      @job_like_flag = @job_likes.present?
    rescue
      redirect_to '/index', flash: { alert: '「いいかも」に失敗しました。もう一度お試しください。' }
    end
    
    @user_like_flag = UserLike.find_by(user_id: current_user.id, job_id: @job.id).present?
  end

end

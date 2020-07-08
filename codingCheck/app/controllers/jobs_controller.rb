class JobsController < ApplicationController
  skip_before_action :require_corp_signed_in!

  def index
    @jobs = Job.all
    
    # ユーザーがいいねした求人ID
    @job_likes = [];
    if @current_user.job_likes.present?
      @current_user.job_likes.each do |job_like|
        @job_likes.push(job_like.job_id)
      end
    end
    
    # 企業からユーザーへ送られた「いいね」の求人ID
    @user_likes = [];
    if @current_user.user_likes.present?
      @current_user.user_likes.each do |user_like|
        @user_likes.push(user_like.job_id)
      end
    end

  end
end

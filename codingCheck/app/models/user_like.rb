class UserLike < ApplicationRecord
  belongs_to :job, dependent: :destroy
  belongs_to :user, dependent: :destroy
  
  validates :job_id, presence: true
  validates :user_id, presence: true
  validates :job_id, :uniqueness => {:scope => :user_id}
end

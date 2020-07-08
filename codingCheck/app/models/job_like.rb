class JobLike < ApplicationRecord
  belongs_to :user, dependent: :destroy
  belongs_to :job, dependent: :destroy
  
  validates :user_id, presence: true
  validates :job_id, presence: true
  validates :user_id, :uniqueness => {:scope => :job_id}
end

class Job < ApplicationRecord
  belongs_to :corporation
  has_many  :job_likes, dependent: :destroy
  has_many  :user_likes, dependent: :destroy
  validates :corporation_id, presence: true
  validates :title, length: { in: 10..100 }, presence: true
  validates :description, length: { in: 10..500 }, presence: true
  
end

class User < ApplicationRecord
  has_secure_password validations: true
  
  validates :name, length: { maximum: 50 }, presence: true
  validates :email, length: { maximum: 254 }, presence: true, uniqueness: true
  validates :password, length: { in: 8..100 }, on: :create
  
  has_many :job_likes, dependent: :destroy
  has_many :user_likes, dependent: :destroy
  
end

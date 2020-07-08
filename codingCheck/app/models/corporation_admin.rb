class CorporationAdmin < ApplicationRecord
  has_secure_password validations: true
  
  validates :name, length: { maximum: 50 }, presence: true
  validates :email, length: { maximum: 254 }, presence: true, uniqueness: true
  validates :password, length: { in: 8..100 }, on: :create
  
  belongs_to :corporation
end

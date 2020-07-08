class Corporation < ApplicationRecord
  has_many :jobs, dependent: :destroy
end

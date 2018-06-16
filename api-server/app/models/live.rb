class Live < ApplicationRecord
  validates :user_id, presence: true
end

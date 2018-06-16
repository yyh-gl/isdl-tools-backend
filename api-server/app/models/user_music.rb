class UserMusic < ApplicationRecord
  belongs_to :user
  has_one :music
  validates :user_id, presence: true
  validates :music_id, presence: true
  validates :local_path, presence: true
end

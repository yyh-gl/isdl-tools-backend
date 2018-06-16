class Music < ApplicationRecord
  belongs_to :user
  has_many :user_cross_musics
  validates :name, presence: true
  validates :artist, presence: true
  validates :path, presence: true
end

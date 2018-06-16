class Music < ApplicationRecord
  belongs_to :user
  validates :name, presence: true
  validates :artist, presence: true
  validates :path, presence: true
end

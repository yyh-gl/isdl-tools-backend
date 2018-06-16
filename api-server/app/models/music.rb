class Music < ApplicationRecord
  validates :name, presence: true
  validates :artist, presence: true
  validates :path, presence: true
end

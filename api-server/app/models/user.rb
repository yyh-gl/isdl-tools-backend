class User < ApplicationRecord
  has_many :musics
  has_many :user_musics
end

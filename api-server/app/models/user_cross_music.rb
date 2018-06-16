class UserCrossMusic < ApplicationRecord
  belongs_to :user
  belongs_to :music
end

class Tweet < ApplicationRecord
  validates :name, presence: true
  validates :body, presence: true
  validates :icon, presence: true
  enum :icon, { love: 0, angry: 1, smile: 2 }
end

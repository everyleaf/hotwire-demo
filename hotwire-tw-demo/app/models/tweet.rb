class Tweet < ApplicationRecord
  validates :name, presence: true
  validates :body, presence: true
  validates :icon, presence: true, numericality: { only_integer: true, in: 0..2, allow_blank: true }
end

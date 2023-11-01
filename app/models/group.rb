class Group < ApplicationRecord
  belongs_to :lift

  validates :weight, presence: true, numericality: true
  validates :reps, presence: true, numericality: true
end

class Group < ApplicationRecord
  belongs_to :lift

  validates :weight, presence: true
  validates :reps, presence: true
end

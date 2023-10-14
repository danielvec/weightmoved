class Workout < ApplicationRecord
  has_many :lifts, dependent: :destroy
  accepts_nested_attributes_for :lifts, allow_destroy: true
end

class Lift < ApplicationRecord
  belongs_to :workout
  has_many :groups, dependent: :destroy
  accepts_nested_attributes_for :groups, allow_destroy: true
end

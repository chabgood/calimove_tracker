class Day < ApplicationRecord
  belongs_to :week
  belongs_to :day_name
  has_many :exercises, dependent: :destroy
  scope :ordered_days, -> { includes(:day_name).order("day_names.number") }

  accepts_nested_attributes_for :exercises, reject_if: :all_blank, allow_destroy: true
end

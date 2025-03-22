class Day < ApplicationRecord
  belongs_to :week
  belongs_to :day_name
  has_many :exercises

  accepts_nested_attributes_for :exercises
end

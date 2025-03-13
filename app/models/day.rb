class Day < ApplicationRecord
  belongs_to :week
  belongs_to :day_name
  has_many :exercises, strict_loading: true
end

class DayName < ApplicationRecord
  has_many :day

  default_scope { order(:number) }
end

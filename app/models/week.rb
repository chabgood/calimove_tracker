class Week < ApplicationRecord
  belongs_to :schedule
  has_many :days, strict_loading: true
end

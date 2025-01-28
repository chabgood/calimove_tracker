class Week < ApplicationRecord
  belongs_to :schedule
  has_many :days
end

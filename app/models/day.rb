class Day < ApplicationRecord
  belongs_to :week
  belongs_to :day_name

  def name
    self.day_name.name
  end
end

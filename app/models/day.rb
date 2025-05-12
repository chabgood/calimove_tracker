class Day < ApplicationRecord
  belongs_to :week
  belongs_to :day_name
  has_many :exercises, dependent: :destroy
  
  amoeba do
    enable
  end

  accepts_nested_attributes_for :exercises, reject_if: :all_blank, allow_destroy: true
end

class Week < ApplicationRecord
  belongs_to :schedule
  belongs_to :week_status, foreign_key: :week_statuses_id
  has_many :days

  accepts_nested_attributes_for :days, reject_if: :all_blank, allow_destroy: true
end

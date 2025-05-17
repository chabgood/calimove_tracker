class SetTracker < ApplicationRecord
  belongs_to :exercise
  DUPLICABLE_DEFAULTS = {completed: false}
end
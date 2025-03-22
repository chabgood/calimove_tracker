class ExerciseStatus < ApplicationRecord
  has_many :exercises, dependent: :destroy
end

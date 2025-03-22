class ExerciseResource < Madmin::Resource
  # Attributes
  attribute :id, form: false
  attribute :exercise_statuses_id
  attribute :number
  attribute :workout
  attribute :intensity
  attribute :created_at, form: false
  attribute :updated_at, form: false
  attribute :sets
  attribute :rest_between_sets
  attribute :rest_between_exercises
  attribute :test_result
  attribute :workout_value
  attribute :notes
  attribute :percentage

  # Associations
  attribute :day
  attribute :workout_name
  attribute :exercise_status
  attribute :level
  attribute :phase

  # Add scopes to easily filter records
  # scope :published

  # Add actions to the resource's show page
  # member_action do |record|
  #   link_to "Do Something", some_path
  # end

  # Customize the display name of records in the admin area.
  # def self.display_name(record) = record.name

  # Customize the default sort column and direction.
  # def self.default_sort_column = "created_at"
  #
  # def self.default_sort_direction = "desc"
end

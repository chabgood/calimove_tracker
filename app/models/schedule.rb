class Schedule < ApplicationRecord
  validates :title, presence: true, allow_nil: false

  has_many :weeks

  def import(file)
    xlsx = Roo::Excelx.new(file.path)
    xlsx.sheet("Tabellenblatt1").each do |row|
      self.title = row[0]
      self.save # save schedule

      new_week = self.week.new()  if empty_row?(row)
    end

    def empty_row?(row)
      row[0..4].all?(nil)
    end
  end
end

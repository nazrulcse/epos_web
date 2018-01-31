class ChangedSetting < ActiveRecord::Base
  belongs_to :department

  validates_presence_of :from_date, :to_date, :open_time, :working_hours, :department_id
  validate :check_date


  private

  def check_date

    if from_date && to_date && from_date>to_date
      errors.add(:base, 'From date cannot be greater than to date' )
    end

  end

end

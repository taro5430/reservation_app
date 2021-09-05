class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :room
 
  validates :start_date, :end_date, :people, presence: true

  validate :date_before_start
  validate :date_before_end

  def date_before_start
    start_date.present? && start_date < Date.today
  end

  def date_before_end
    start_date.present? && end_date.present? && end_date < start_date
  end

end

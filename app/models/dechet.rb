class Dechet < ApplicationRecord
  validates :reg_number, presence: true, uniqueness: true
  validates :radioelement, presence: true
  validates :waste_type, presence: true
  validates :activity, presence: true, numericality: { greater_than: 0, message: "must be greater than 0" }
  validates :half_life, presence: true, numericality: { greater_than: 0, only_integer: true, message: "must be greater than 0 and integer" }
  validates :elimination_date, presence: true

  def decay_time
    half_life * 10
  end

  def decay_date
    Time.now + decay_time.days
  end

  def start_time
    elimination_date
  end
end

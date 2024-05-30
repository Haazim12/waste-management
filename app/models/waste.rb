class Waste < ApplicationRecord
  include PgSearch::Model
  pg_search_scope :search_by_reg_number, against: [:reg_number], using: { tsearch: { prefix: true } }
  validates :reg_number, presence: true, uniqueness: true, on: :create
  validates :waste_type, presence: true, on: :create
  validates :activity, presence: true, numericality: { greater_than: 0, message: "must be greater than 0" }, on: :create
  validates :half_life, presence: true, numericality: { greater_than: 0, message: "must be greater than 0 and integer" }, on: :create
  validates :volumic_activity, presence: true, numericality: { greater_than: 0,s, message: "must be greater than 0 and smaller then 7" }, on: :update

  def decay_time
    half_life * 10
  end

  def decay_date
    Time.now + decay_time.days
  end

  def start_time
    decay_date
  end

  def state
    if decay_time >= 10
      "green"
    elsif decay_time >= 2 && decay_time < 10
      "yellow"
    elsif decay_time < 2
      "red"
    end
  end
end

class Waste < ApplicationRecord
  include PgSearch::Model
  pg_search_scope :search_by_reg_number, against: [:reg_number], using: { tsearch: { prefix: true } }
  validates :reg_number, presence: true, uniqueness: true, on: :create
  validates :waste_type, presence: true, on: :create
  validates :radioelement, presence: true, on: :create
  validates :activity, presence: true, numericality: { greater_than: 0, message: "doit être supérieur à 0" }, on: :create
  validate :risidual_activity_less_than_two_times_bdf, on: :update
  validate :volumic_activity_less_than_7, on: :update

  belongs_to :examination, optional: true
  belongs_to :tank, optional: true
  belongs_to :radioelement, optional: true

  def half_life
    radioelement.half_life
  end

  def decay_time
    half_life * 10
  end

  def decay_date
    created_at + decay_time.days
  end

  def time_until_decay
    (decay_date - Time.now) / 60
  end

  def state
    if Time.now < decay_date
      "active"
    else
      "inactive"
    end
  end

  def start_time
    decay_date
  end

  def self.wastes_to_control
    i = 0
    Waste.all.each do |waste|
      if waste.state == "inactive"
        i += 1
      end
    end
    i
  end

  private

  def risidual_activity_less_than_two_times_bdf
    if risidual_activity.present? && bdf.present? && risidual_activity > 2 * bdf
      errors.add("Activité résiduelle", "doit être inférieure à 2 fois la BDF")
    end
  end

  def volumic_activity_less_than_7
    if volumic_activity.present? && volumic_activity > 7
      errors.add("Activité volumique", "doit être inférieure à 7")
    end
  end
end

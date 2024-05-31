# app/models/waste.rb
class Waste < ApplicationRecord
  enum waste_type: { liquid: 0, solid: 1 }

  validates :waste_type, :activity, :generated_at, presence: true

  scope :by_date_range, ->(start_date, end_date) { where(generated_at: start_date..end_date) }
end

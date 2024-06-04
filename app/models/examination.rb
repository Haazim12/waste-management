class Examination < ApplicationRecord
  has_many :wastes, dependent: :destroy
  validates :exam_type, presence: true, uniqueness: true, on: :create
  validates :volume, presence: true, numericality: { greater_than: 0, message: "doit être supérieur à 0" }, on: :create
end

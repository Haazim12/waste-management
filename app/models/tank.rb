class Tank < ApplicationRecord
  has_many :wastes, dependent: :destroy
  belongs_to :radioelement, optional: true

  validates :radioelement, presence: true, uniqueness: true, on: :create
end

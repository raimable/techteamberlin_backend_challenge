# Nationality Model
class Nationality < ApplicationRecord
  has_many :payloads, dependent: :nullify
  has_many :missions, through: :payloads
  validates :name, presence: true
end

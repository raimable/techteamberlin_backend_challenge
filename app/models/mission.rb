# Mission Model
class Mission < ApplicationRecord
  include PgSearch

  validates :name, presence: true
  validates :mission_identifier, uniqueness: true, presence: :true

  pg_search_scope :search_by_description, against: :description
  has_many :payloads, dependent: :destroy
  has_many :nationalities, through: :payloads
end

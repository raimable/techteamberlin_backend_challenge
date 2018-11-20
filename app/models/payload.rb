# Payload model
class Payload < ApplicationRecord
  belongs_to :mission, optional: true
  belongs_to :nationality, optional: true

  validates :payload_identifier, uniqueness: true, presence: :true
end
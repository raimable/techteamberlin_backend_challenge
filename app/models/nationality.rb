class Nationality < ApplicationRecord
	has_many :payloads, dependent: :nullfy
end

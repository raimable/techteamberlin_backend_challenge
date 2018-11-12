class Mission < ApplicationRecord
	has_many :payloads , dependent: :destroy
end

class Mission < ApplicationRecord
	include PgSearch
    
    pg_search_scope :search_by_description, against: :description

	has_many :payloads , dependent: :destroy
	has_many :nationalities, through: :payloads
end

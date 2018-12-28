class Note < ApplicationRecord
	has_one :locaton
	has_many :tags
end

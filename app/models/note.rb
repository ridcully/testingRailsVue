class Note < ApplicationRecord
  belongs_to :location, optional: true	# a location is not required!
  has_and_belongs_to_many :tags
end

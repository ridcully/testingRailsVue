class Note < ApplicationRecord
  has_one :locaton
  has_and_belongs_to_many :tags
end

class City < ApplicationRecord
  has_many :chiens
  has_many :dog_sitters
end

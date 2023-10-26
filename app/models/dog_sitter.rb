class DogSitter < ApplicationRecord
  has_many :strolls
  has_many :chiens, through: :strolls
  belongs_to :city
end

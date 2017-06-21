class Occupation < ApplicationRecord
  has_many :people, dependent: :destroy
end

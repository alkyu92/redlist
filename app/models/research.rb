class Research < ApplicationRecord
  belongs_to :group

  validates :major, :specialization, :description, presence: true
end

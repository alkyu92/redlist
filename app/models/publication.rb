class Publication < ApplicationRecord
  belongs_to :group

  validates :title, :event, :description, presence: true
end

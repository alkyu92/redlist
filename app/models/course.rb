class Course < ApplicationRecord
  belongs_to :group

  validates :title, :place, :description, presence: true
end

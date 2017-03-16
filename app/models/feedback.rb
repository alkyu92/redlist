class Feedback < ApplicationRecord
  validates :email, :inquiry, presence: true
end

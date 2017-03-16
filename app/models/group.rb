class Group < ApplicationRecord
  belongs_to :user

  has_many :people,      dependent: :destroy
  has_many :publications, dependent: :destroy
  has_many :awards,       dependent: :destroy
  has_many :researches,   dependent: :destroy
  has_many :courses,      dependent: :destroy
  has_many :group_pics, dependent: :destroy

  validates :name, :department, :description, :address, :email, :phone, presence: true
end

class Advertisement < ApplicationRecord
  belongs_to :user
  belongs_to :category

  has_many :comments, as: :commentable, dependent: :destroy
  has_many :notifications, dependent: :destroy
  has_many :documents, dependent: :destroy

  validates :name, :description, :category_id, :email, :validity, presence: true
  validates :title, presence: true, length: {maximum: 60}
end

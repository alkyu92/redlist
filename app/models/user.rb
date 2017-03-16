class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :advertisements, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :notifications, dependent: :destroy
  has_many :groups, dependent: :destroy
  has_many :yearbooks, dependent: :destroy
  has_many :stories, dependent: :destroy

  has_attached_file :avatar,
                styles: { medium: "300x300>",
                          profile: "250x250>",
                          icon: "20x20#",
                          index: "40x40#",
                          child: "35x35#",
                          parent: "50x50#",
                          user: "60x60#",
                          show: "40x40#" },
                default_url: "/images/:style/missing.png",
                dependent: :destroy

  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/
end

class Person < ApplicationRecord
  belongs_to :group
  belongs_to :occupation

  validates :name, :level, :intro, :email, :occupation_id, presence: true

  has_attached_file :profile_pic,
                styles: { profile: "200x200#" },
                default_url: "/images/:style/missing.png",
                dependent: :destroy

  validates_attachment_content_type :profile_pic, content_type: /\Aimage\/.*\z/
end

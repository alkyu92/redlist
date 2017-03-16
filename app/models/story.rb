class Story < ApplicationRecord
  belongs_to :user

  has_attached_file :pic,
                styles: { thumbnail: "400x100^",
                          show: "1920x800#" },
                default_url: "/images/:style/missing.png",
                dependent: :destroy

  validates_attachment_content_type :pic, content_type: /\Aimage\/.*\z/

  validates :title, :story, presence: true
end

class GroupPic < ApplicationRecord
  belongs_to :group

  has_attached_file :pic,
  styles: {thumbnail: "600x300#",
                wide: "1920x800#"},
  default_url: "/images/:style/missing.png",
  dependent: :destroy

  validates_attachment_content_type :pic, content_type: /\Aimage\/.*\z/
end

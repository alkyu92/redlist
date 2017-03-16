class Notification < ApplicationRecord
  belongs_to :advertisement
  belongs_to :user

  default_scope -> { where("validity IS NULL OR validity > ?", Time.now) }
end

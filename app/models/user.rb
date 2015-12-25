# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  name       :string
#  email      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class User < ActiveRecord::Base
  # self is not optional on assigning variables.
  # Another way is by using a bang method to permanently change the object in memory.
  before_save { email.downcase! }
  validates :name, presence: true, length: { maximum: 50 }
  # All capitals means constants.
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 }, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }
  # ActiveRecord uniqueness does not ensure DB uniqueness.
  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }
end

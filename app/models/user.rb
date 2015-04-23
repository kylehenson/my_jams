class User < ActiveRecord::Base
  has_secure_password
  validates :first_name, :last_name, presence: true
  validates :username, presence: true, uniqueness: true
  has_many :songs

  enum role: %w(default, admin)
end

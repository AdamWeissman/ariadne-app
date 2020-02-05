class User < ActiveRecord::Base
  has_many :ariadne_messages
  has_many :projects


  validates :first_name, :email, presence: true
  validates :email, uniqueness: { case_sensitive: false }
  validates :email, format: { with: /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i}

  has_secure_password

end

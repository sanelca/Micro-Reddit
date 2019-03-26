class User < ActiveRecord::Base
  has_many :posts, dependent: :destroy
  validates :name, presence: true
  validates :surname, presence: true
  validates :email, presence: true
end

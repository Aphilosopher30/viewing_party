class User < ApplicationRecord
  has_many :friendships, class_name: 'Friend', dependent: :destroy
  has_many :friends, through: :friendships, dependent: :destroy
  has_many :parties, foreign_key: :host_id, dependent: :destroy, inverse_of: :host
  has_many :guests, dependent: :destroy
  has_many :invites, through: :guests, source: :party

  validates :email, presence: true, uniqueness: true
  validates :name, presence: true
  validates :password_digest, presence: true
  validates :password, confirmation: true, presence: true, on: :create

  has_secure_password
end

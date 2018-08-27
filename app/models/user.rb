class User < ApplicationRecord
  has_one_attached :photo
  has_many :articles
  has_secure_password
  validates :password, presence: true

  def full_name
    first_name + ' ' + last_name
  end

  # SAVE THIS PRECIOUS GEM
  def self.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end
end

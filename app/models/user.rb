class User < ApplicationRecord
  before_save { self.email = email.downcase } # this line changes the email that was entered by the user to change case so that its always the same in the database for everyone
  has_one_attached :photo
  has_many :articles
  has_secure_password
  validates :password, presence: true, length: { maximum: 32, minimum: 8 }
  validates :email, presence: true, length: { maximum: 100 }

  def full_name
    first_name + ' ' + last_name
  end

  # SAVE THIS PRECIOUS GEM
  def self.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

  def authenicated?(attribute, token)
    digest = send("#{attribute}_digest")
    return false if digest.nil?
    BCrypt::Password.new(digest).is_password?(token)
  end
end

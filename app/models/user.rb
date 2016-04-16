class User < ActiveRecord::Base
  attr_accessor :remember_token
  has_secure_password
  before_validation :downcase_email

  validates :first_name,   presence: true
  validates :last_name,    presence: true
  validates :email,        presence: true,
                         uniqueness: true
  validates :user_name,    presence: true,
                         uniqueness: true
  validates :password,     presence: true

  # before_create :create_password_digest
  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

  # def create_password_digest
  #   self.password_digest = User.digest()
  # end

  #returns a random token
  def User.new_token
    SecureRandom.urlsafe_base64
  end

  #Remembers a user in the database for use in persistent sessions
  def remember
    self.remember_token = User.new_token
    update_attribute(:remember_digest, User.digest(remember_token))
  end

  def forget
      update_attribute(:remember_digest, nil)
  end

  def authenticated?(remember_token)
    return false if remember_digest.nil?
    BCrypt::Password.new(remember_digest).remember_token?
  end

  private

  def downcase_email
    self.email = self.email.downcase if self.email.present?
  end


# http://stackoverflow.com/questions/24641143/rails-conditional-validation-in-model
  # def application_validation
  #   validates :phone_number, presence: true
  #   validates :address,      presence: true
  #   validates :current_job,  presence: true
  #   validates :previous_job, presence: true
  # end

end

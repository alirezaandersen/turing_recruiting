class User < ActiveRecord::Base
  before_validation :downcase_email

  validates :first_name,   presence: true
  validates :last_name,    presence: true
  validates :email,        presence: true,
                         uniqueness: true
  validates :user_name,   presence: true,
                        uniqueness: true
  validates :password_digest, presence: true


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

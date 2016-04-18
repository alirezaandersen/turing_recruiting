class Application < ActiveRecord::Base
  belongs_to :job
  belongs_to :user

  validates :job_id, :uniqueness => {:scope=>:user_id, message: "You have already applied"}
end

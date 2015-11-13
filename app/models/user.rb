class User < ActiveRecord::Base
  has_secure_password
  validates :email, presence: true, uniqueness: true
  validates :username, presence: true, uniqueness: true
  before_save :downcase_email
  has_many :blogs

  private
    def downcase_email
      self.email = self.email.downcase
    end
end

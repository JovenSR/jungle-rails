class User < ActiveRecord::Base
  has_many :reviews
  has_secure_password

  validates :name, :presence => true

  validates :password,
            :presence => true,
            :length => {:minimum => 6}

  validates :password_confirmation,
            :presence => true,
            :length => {:minimum => 6}

  validates :email,
            :presence => true,
            :uniqueness => { :case_sensitive => false }

  def self.authenticate_with_credentials(email, password)
    email = email.strip
    user = User.where("LOWER(email) = LOWER(?)", email.downcase).first
    user && user.authenticate(password)
  end

end

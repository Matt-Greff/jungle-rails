class User < ActiveRecord::Base
    has_secure_password
    has_many :reviews

    validates :email, presence: true
    validates :email, uniqueness: { case_sensitive: false }
    validates :password, length: { minimum: 3 }

    def self.authenticate_with_credentials email, pass
        email = email.downcase.strip
        user = User.find_by(email: email)
        user && user.authenticate(pass) ? user : nil
    end
  
end
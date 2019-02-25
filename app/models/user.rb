class User < ActiveRecord::Base
    has_secure_password
    validates :email, uniqueness: { case_sensitive: false }
    validates :password, length: { minimum: 3 }
    
    def self.authenticate_with_credentials(email, password)
        email = email.strip.downcase  
        user = User.find_by(email: email)
        puts user
        if user && user.authenticate(password)
            user
        else
            nil
        end
        
    end

end

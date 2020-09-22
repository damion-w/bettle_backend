require_relative '../pretty_log/pretty_log'

class User < ApplicationRecord

    # 'uniqueness' makes sure usernames are unique.
    # https://api.rubyonrails.org/classes/ActiveRecord/Validations/ClassMethods.html#method-i-validates_uniqueness_of
    validates :username, uniqueness: true
    validates :email, uniqueness: true
    
    # Adds methods to set and authenticate against a BCrypt password
    # https://api.rubyonrails.org/classes/ActiveModel/SecurePassword/ClassMethods.html#method-i-has_secure_password
    has_secure_password
    
    # Specifies that this attribute should be used to store a unique 24-character alphanumeric token
    # https://medium.com/headerlabs-india/has-secure-token-in-rails-fb6239df7dbb
    has_secure_token :auth_token
    
    # Invalidates token (i.e. when a user logs out)
    def invalidate_token
        self.update(auth_token: nil)
    end

    def self.validate_login(username, password)
        # Find the user, if the user doesn't exist, return false
        user = find_by(username: username)

        # If the user exists AND enters the correct password, return the user
        if user && user.authenticate(password)
            user
        end
    end

    # Returns user information
    def profile_info
        { user: { username: self.username, first_name: self.first_name, last_name: self.last_name, email: self.email }}
    end

end

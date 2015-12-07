class Account < ActiveRecord::Base

  include BCrypt

# PASSWORD SETTER
def password=(pass)
  self.password_digest = BCrypt::Password.create(pass)
end

# PASSWORD GETTER
def password
  BCrypt::Password.new(self.password_digest)
end

# AUTHENTICATION
def self.authenticate(user_name, password)
  current_user = Account.find_by(user_name: user_name)
  if (current_user.password == password)
    return current_user
  else
    return nil
  end
end


end

class User < ActiveRecord::Base
  # Remember to create a migration!
  def self.authenticate(email, password)
    current_user = User.find_by_email(email)
    
    if current_user.email == email && current_user.password == password
      return current_user
    else
      return nil
    end
  end
end

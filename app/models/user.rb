class User < ActiveRecord::Base
  DEFAULT_PASSWORD = 'default'

  def self.authenticate(password)
    User.find_by(password: password)
  end

  def change_password(password, new_password)
    return false if new_password.nil? || new_password.strip.empty?
    return false unless self.password == password

    update(password: new_password)
  end

  def reset_password
    update(password: DEFAULT_PASSWORD)
  end

end
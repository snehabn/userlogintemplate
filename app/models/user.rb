class User < ActiveRecord::Base
  has_many :posts, foreign_key: :author_id
  has_many :comments, foreign_key: :commentor_id

  include BCrypt

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end

  def self.authenticate(username, password)
    p password
    user = User.find_by(username: username)
    p user.password
    if user.password == password
      return user
    else
      nil
    end
  end

end

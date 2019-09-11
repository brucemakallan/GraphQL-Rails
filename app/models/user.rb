require 'bcrypt'

class User < ApplicationRecord
  include BCrypt

  PASSWORD_REGEX = /^(?=.*[a-zA-Z])(?=.*[0-9]).{8,}$/

  has_many :articles, class_name: 'Article', foreign_key: 'author_id'

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    ErrorHandler.raiser(
      !new_password.match(PASSWORD_REGEX).present?,
      "Password must have at least 8 characters and contain a digit, lowercase and uppercase letters"
    )
    @password = Password.create(new_password)
    self.password_hash = @password
  end

  def validate
    ErrorHandler.raiser(self.first_name.length < 2, 'First name should be at least 2 characters')
    ErrorHandler.raiser(self.last_name.length < 2, 'Last name should be at least 2 characters')
    ErrorHandler.raiser(!self.email.match(URI::MailTo::EMAIL_REGEXP).present?, 'Invalid Email format')
    User.all.each do |user|
      ErrorHandler.raiser(user.email.match(self.email).present?, 'Email already exists')
    end
  end
end

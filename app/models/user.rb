require 'bcrypt'

class User < ApplicationRecord
  include BCrypt

  PASSWORD_REGEX = /^(?=.*[a-zA-Z])(?=.*[0-9]).{8,}$/

  has_many :articles, class_name: 'Article', foreign_key: 'author_id', dependent: :destroy

  validates :email,
            presence: true,
            uniqueness: true,
            format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :first_name, presence: true, length: { within: 2..30 }
  validates :last_name, presence: true, length: { within: 2..30 }

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    unless new_password.match(PASSWORD_REGEX).present?
      raise GraphQL::ExecutionError, "Password must have at least 8 characters and contain a digit, lowercase and uppercase letters"
    end
    @password = Password.create(new_password)
    self.password_hash = @password
  end
end

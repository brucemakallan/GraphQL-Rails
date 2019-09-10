require 'bcrypt'

class User < ApplicationRecord
  include BCrypt

  has_many :articles, class_name: 'Article', foreign_key: 'author_id'

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end

  # def validate
  #   unless self.email.length > 5
  #     raise GraphQL::ExecutionError, 'Invalid Email'
  #   end  
  # end
end

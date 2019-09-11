class Mutations::CreateUser < Mutations::BaseMutation
  argument :first_name, String, required: true
  argument :last_name, String, required: true
  argument :email, String, required: true
  argument :password, String, required: true

  field :user, Types::UserType, null: true
  field :token, String, null: true
  field :errors, [String], null: true

  def resolve(first_name:, last_name:, email:, password:)
    user = User.new(first_name: first_name, last_name: last_name, email: email)
    user.password = password
    if user.valid?
      user.save
      token = JwtAuthentication.encode(user)
      { user: user, token: token }
    else
      { errors: user.errors.full_messages }
    end
  end
end

class Mutations::CreateUser < Mutations::BaseMutation
  argument :first_name, String, required: true
  argument :last_name, String, required: true
  argument :email, String, required: true
  argument :password, String, required: true

  field :user, Types::UserType, null: false
  field :token, String, null: false
  field :errors, [String], null: false

  def resolve(first_name:, last_name:, email:, password:)
    user = User.new(first_name: first_name, last_name: last_name, email: email)
    user.password = password
    user.validate
    if user.save
      token = JwtAuthentication.encode(user)
      { user: user, token: token, errors: [] }
    else
      { user: nil, errors: user.errors.full_messages }
    end
  end
end

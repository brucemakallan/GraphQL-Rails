class Mutations::Login < Mutations::BaseMutation
  argument :email, String, required: true
  argument :password, String, required: true

  field :user, Types::UserType, null: true
  field :token, String, null: true
  field :errors, String, null: true

  def resolve(email:, password:)
    user = User.find_by_email(email)
    if user && user.password == password
      token = JwtAuthentication.encode(user)
      { user: user, token: token }
    else
      { errors: 'Invalid credentials' }
    end
  end
end

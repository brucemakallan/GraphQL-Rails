class Mutations::CreateUser < Mutations::BaseMutation
  argument :first_name, String, required: true
  argument :last_name, String, required: true
  argument :email, String, required: true
  argument :password, String, required: true
  argument :password_confirmation, String, required: true

  field :user, Types::UserType, null: false
  field :errors, [String], null: false

  def resolve(first_name:, last_name:, email:, password:, password_confirmation:)
    user = User.new(first_name: first_name, last_name: last_name, email: email)
    user.password = password
    if user.validate
      user.save
      { user: user, errors: [] }
    else
      { user: nil, errors: user.errors.full_messages }
    end
  end
end

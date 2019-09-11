module Types
  class LoginType < Types::BaseObject
    field :user, Types::UserType, null: true
    field :token, String, null: true
    field :errors, String, null: true
  end
end

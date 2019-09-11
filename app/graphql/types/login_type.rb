module Types
  class LoginType < Types::BaseObject
    field :user, Types::UserType, null: false
    field :token, String, null: false
    field :errors, [String], null: false
  end
end

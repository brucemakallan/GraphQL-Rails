module Types
  class MutationType < Types::BaseObject
    field :create_user, mutation: Mutations::CreateUser,
      description: 'Signup - Create a new User'
  end
end

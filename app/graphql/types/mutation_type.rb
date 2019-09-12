module Types
  class MutationType < Types::BaseObject
    field :create_user, mutation: Mutations::CreateUser,
      description: 'Signup - Create a new User'
    field :login, mutation: Mutations::Login, description: 'Login'
    field :create_article, mutation: Mutations::CreateArticle,
      description: 'Create a new Article'
  end
end

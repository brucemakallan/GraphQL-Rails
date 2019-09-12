module Types
  class MutationType < Types::BaseObject
    field :create_user, mutation: Mutations::CreateUser,
      description: 'Signup - Create a new User'
    field :login, mutation: Mutations::Login, description: 'Login'
    field :create_article, mutation: Mutations::CreateArticle,
      description: 'Create a new Article'
    field :update_article, mutation: Mutations::UpdateArticle,
      description: 'Update an Article'
    field :delete_article, mutation: Mutations::DeleteArticle,
      description: 'Delete an Article'
  end
end

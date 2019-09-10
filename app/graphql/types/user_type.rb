module Types
  class UserType < Types::BaseObject
    field :id, ID, null: false
    field :email, String, null: false
    field :first_name, String, null: false
    field :last_name, String, null: false
    field :articles, [Types::ArticleType], null: true
    field :articles_count, Integer, null: true

    def articles_count
      object.articles.size
    end
  end
end

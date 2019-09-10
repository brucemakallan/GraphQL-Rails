module Types
  class ArticleType < Types::BaseObject
    field :id, ID, null: false
    field :title, String, null: false
    field :body, String, null: false
    field :image_url, String, null: false
    field :author, Types::UserType, null: true

    def author
      object.author
    end
  end
end

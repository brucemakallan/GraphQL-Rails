class Mutations::UpdateArticle < Mutations::BaseMutation
  argument :id, ID, required: true
  argument :title, String, required: false
  argument :body, String, required: false
  argument :image_url, String, required: false

  field :article, Types::ArticleType, null: true
  field :errors, [String], null: true

  def resolve(id:, title: nil, body: nil, image_url: nil)
    user = context[:current_user]
    raise GraphQL::ExecutionError, 'Authentication failure' unless user
    article = Article.find(id)
    if article.update(
        title: title || article.title,
        body: body || article.body,
        image_url: image_url || article.image_url
      )
      { article: article }
    else
      { errors: article.errors.full_messages }
    end
  end
end

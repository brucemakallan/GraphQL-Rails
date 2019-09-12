class Mutations::CreateArticle < Mutations::BaseMutation
  argument :title, String, required: true
  argument :body, String, required: true
  argument :image_url, String, required: true

  field :article, Types::ArticleType, null: true
  field :errors, [String], null: true

  def resolve(title:, body:, image_url:)
    user = context[:current_user]
    raise GraphQL::ExecutionError, 'Authentication failure' unless user
    article = user.articles.build(title: title, body: body, image_url: image_url)
    if article.valid?
      article.save
      { article: article }
    else
      { errors: article.errors.full_messages }
    end
  end
end

class Mutations::DeleteArticle < Mutations::BaseMutation
  argument :id, ID, required: true

  field :article, Types::ArticleType, null: true
  field :errors, [String], null: true

  def resolve(id:)
    article = Article.find(id)
    article.destroy
    { article: article }
  end
end
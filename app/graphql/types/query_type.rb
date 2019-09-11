module Types
  class QueryType < Types::BaseObject
    field :users, [Types::UserType], null: false

    def users
      User.all
    end
    
    field :user, Types::UserType, null: false do
      argument :id, ID, required: true
    end

    def user(id:)
      User.find(id)
    end

    field :articles, [Types::ArticleType], null: false

    def articles
      Article.all
    end

    field :article, Types::ArticleType, null: false do
      argument :id, ID, required: true
    end

    def article(id:)
      Article.find(id)
    end

    field :login, Types::LoginType, null: false do
      argument :email, String, required: true
      argument :password, String, required: true
    end

    def login(email:, password:)
      user = User.find_by_email(email)
      if user && user.password == password
        token = JwtAuthentication.encode(user)
        { user: user, token: token, errors: [] }
      else
        { user: nil, token: '', errors: [{ message: 'Invalid credentials' }] }
      end
    end
  end
end

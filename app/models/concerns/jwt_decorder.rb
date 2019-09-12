class JwtDecorder
  attr_reader :auth_errors

  def initialize(headers)
    @headers = headers
    @auth_errors = []
  end

  def token
    authorization_header = @headers['Authorization']
    if authorization_header.present?
      authorization_header.split(' ').last
    else
      @auth_errors.push('Token missing')
      nil
    end
  end

  def token_contents
    decoded = JwtAuthentication.decode(token)
    decoded || (@auth_errors.push('Token expired') && nil)
  end

  def current_user
    user = token_contents ? User.find_by(id: token_contents[:user_id]) : nil
    user || (@auth_errors.push('Invalid Token') && nil)
  end
end

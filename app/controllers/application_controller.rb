class ApplicationController < ActionController::API
  def current_user
    user = JwtDecorder.new(request.headers).current_user
  end
end

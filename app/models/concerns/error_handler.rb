class ErrorHandler
  def self.raiser(condition, message)
    if condition
      raise GraphQL::ExecutionError, message
    end
  end
end
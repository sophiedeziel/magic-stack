# frozen_string_literal: true

module Base
  class InputObject < GraphQL::Schema::InputObject
    argument_class Argument
  end
end

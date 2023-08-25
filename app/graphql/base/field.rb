# frozen_string_literal: true

module Base
  class Field < GraphQL::Schema::Field
    argument_class Argument
  end
end

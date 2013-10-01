require 'mocha/is_a'

module Mocha

  class SingleReturnValue

    def initialize(value)
      @value = value
    end

    def evaluate(*invokation_arguments)
      @value
    end

  end

end

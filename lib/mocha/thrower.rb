module Mocha

  class Thrower

    def initialize(tag, object = nil)
      @tag, @object = tag, object
    end

    def evaluate(*invokation_arguments)
      throw @tag, @object
    end

  end

end

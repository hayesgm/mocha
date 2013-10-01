module Mocha

  class Runner

    def initialize(callable)
      raise ArgumentError, "Callable must respond to `call`" unless callable.respond_to?(:call)
      @callable = callable
    end

    def evaluate(*invokation_arguments)
      if @callable.is_a?(Proc) # proc will not raise if signature doesn't match
        @callable.call(*invokation_arguments)
      else
        @callable.call
      end
    end

  end

end

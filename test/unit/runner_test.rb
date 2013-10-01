require File.expand_path('../../test_helper', __FILE__)

require 'mocha/runner'

class RunnerTest < Mocha::TestCase

  include Mocha

  def test_should_test_argument_as_callable
    run = false
    assert_raise ArgumentError, "Callable must respond to `call`", "Symbol does not respond to :call" do
      runner = Runner.new(:a)
    end
  end

  def test_should_run_lambda
    run = false
    runner = Runner.new(->{run=true})
    runner.evaluate
    assert run, "Run should have been set in lambda"
  end

  def test_should_run_proc
    run = false
    runner = Runner.new(proc {run=true})
    runner.evaluate
    assert run, "Run should have been set in proc"
  end

  def test_should_run_proc_obj
    run = false
    runner = Runner.new(Proc.new {run=true})
    runner.evaluate
    assert run, "Run should have been set in proc"
  end

  def test_should_run_lambda_with_return_value
    run = false
    runner = Runner.new(lambda {run=true; 'value'})
    return_value = runner.evaluate
    assert run, "Run should have been set in proc"
    assert_equal 'value', return_value, "Return value should be set to value of lambda"
  end

  def test_should_run_proc_with_arguments
    run = false
    runner = Runner.new(proc {|name| "hi #{name}"})
    return_value = runner.evaluate('bob')
    assert_equal 'hi bob', return_value, "Return value should be set to value of lambda with arguments supplied"
  end

  def test_should_run_proc_with_arguments_if_not_accepted
    run = false
    runner = Runner.new(proc {"no args"})
    return_value = runner.evaluate('bob')
    assert_equal 'no args', return_value, "Return value should be set to value of lambda with arguments not accepted"
  end

  def test_should_run_proc_with_arguments_if_not_accepted
    run = false
    runner = Runner.new(proc {|one,two| "#{one} #{two}"})
    return_value = runner.evaluate(1)
    assert_equal '1 ', return_value, "Should be able to accept only one arg"
  end

end

# coding: UTF-8

RSpec::Matchers.define :be_valid do
  error = nil

  match do |actual|
    begin
      actual.class.decode(actual.encode)
    rescue => error
    end

    error == nil
  end

  failure_message do |actual|
    "expected #{actual} to be valid, but caught error: #{error}"
  end

  failure_message_when_negated do |actual|
    "expected #{actual} not to be valid, but didn't catch an error"
  end
end

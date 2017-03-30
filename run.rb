require_relative 'lib/phone_number_converter.rb'
require 'benchmark'

#accepting input from user
puts "Enter 10 digit number or default (2282668687)"
input = gets.chomp

if input.length > 0
  input = input
else
  input = "2282668687"
end

p Benchmark.measure {
  begin
    phone_number_converter = PhoneNumberConverter.new input
    puts phone_number_converter.possible_combinations.map(&:to_s)
  rescue ArgumentError
    puts "Please enter valid ten digit numbers."
  end
}
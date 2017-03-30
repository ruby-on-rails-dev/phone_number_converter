require_relative 'lib/phone_number_converter.rb'

#accepting input from user
puts "Enter 10 digit number"
input = gets.chomp

if input.length > 0
  input = input
else
  input = "2282668687"
end

phone_number_converter = PhoneNumberConverter.new input
puts phone_number_converter.possible_combinations.map(&:to_s)

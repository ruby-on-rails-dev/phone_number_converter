require_relative "../lib/phone_number_converter.rb"
require "test/unit"

#run these test cases by using this command ruby TestMobileKeypadDecoder.rb
class PhoneNumberConverterTest < Test::Unit::TestCase

  def test_initialize
    assert_raise ArgumentError do
      PhoneNumberConverter.new
    end
    assert_raise ArgumentError do
      PhoneNumberConverter.new('010101010101010')
    end
  end

  def test_possible_combinations
    assert_equal(PhoneNumberConverter.new('6686787825').possible_combinations, [[["MOT", "OPT", "PUCK"], ["MOT", "OPT", "RUCK"], ["MOT", "OPT", "SUCK"], ["MOT", "ORT", "PUCK"], ["MOT", "ORT", "RUCK"], ["MOT", "ORT", "SUCK"], ["NOT", "OPT", "PUCK"], ["NOT", "OPT", "RUCK"], ["NOT", "OPT", "SUCK"], ["NOT", "ORT", "PUCK"], ["NOT", "ORT", "RUCK"], ["NOT", "ORT", "SUCK"], ["OOT", "OPT", "PUCK"], ["OOT", "OPT", "RUCK"], ["OOT", "OPT", "SUCK"], ["OOT", "ORT", "PUCK"], ["OOT", "ORT", "RUCK"], ["OOT", "ORT", "SUCK"]],
      [["MOT", "OPTS", "TAJ"], ["MOT", "OPUS", "TAJ"], ["MOT", "ORTS", "TAJ"], ["NOT", "OPTS", "TAJ"], ["NOT", "OPUS", "TAJ"], ["NOT", "ORTS", "TAJ"], ["OOT", "OPTS", "TAJ"], ["OOT", "OPUS", "TAJ"], ["OOT", "ORTS", "TAJ"]],
      [["NOUN", "PUP", "TAJ"], ["NOUN", "PUR", "TAJ"], ["NOUN", "PUS", "TAJ"], ["NOUN", "SUP", "TAJ"], ["NOUN", "SUQ", "TAJ"], ["ONTO", "PUP", "TAJ"], ["ONTO", "PUR", "TAJ"], ["ONTO", "PUS", "TAJ"], ["ONTO", "SUP", "TAJ"], ["ONTO", "SUQ", "TAJ"]],
      [["MOTOR", "TRUCK"], ["MOTOR", "USUAL"], ["NOUNS", "TRUCK"], ["NOUNS", "USUAL"]],
      [["NOUN", "STRUCK"], ["ONTO", "STRUCK"]],
      ["MOTORTRUCK"]
    ])
    assert_equal(PhoneNumberConverter.new('2282668687').possible_combinations, [
      [["ACT", "BOO", "TOTS"], ["ACT", "BOO", "TOUR"], ["ACT", "CON", "TOTS"], ["ACT", "CON", "TOUR"], ["ACT", "COO", "TOTS"], ["ACT", "COO", "TOUR"], ["BAT", "BOO", "TOTS"], ["BAT", "BOO", "TOUR"], ["BAT", "CON", "TOTS"], ["BAT", "CON", "TOUR"], ["BAT", "COO", "TOTS"], ["BAT", "COO", "TOUR"], ["CAT", "BOO", "TOTS"], ["CAT", "BOO", "TOUR"], ["CAT", "CON", "TOTS"], ["CAT", "CON", "TOUR"], ["CAT", "COO", "TOTS"], ["CAT", "COO", "TOUR"]],
      [["ACT", "BOOT", "MUS"], ["ACT", "BOOT", "NUS"], ["ACT", "BOOT", "OUR"], ["ACT", "COOT", "MUS"], ["ACT", "COOT", "NUS"], ["ACT", "COOT", "OUR"], ["BAT", "BOOT", "MUS"], ["BAT", "BOOT", "NUS"], ["BAT", "BOOT", "OUR"], ["BAT", "COOT", "MUS"], ["BAT", "COOT", "NUS"], ["BAT", "COOT", "OUR"], ["CAT", "BOOT", "MUS"], ["CAT", "BOOT", "NUS"], ["CAT", "BOOT", "OUR"], ["CAT", "COOT", "MUS"], ["CAT", "COOT", "NUS"], ["CAT", "COOT", "OUR"]],
      [["ACTA", "MOT", "MUS"], ["ACTA", "MOT", "NUS"], ["ACTA", "MOT", "OUR"], ["ACTA", "NOT", "MUS"], ["ACTA", "NOT", "NUS"], ["ACTA", "NOT", "OUR"], ["ACTA", "OOT", "MUS"], ["ACTA", "OOT", "NUS"], ["ACTA", "OOT", "OUR"]],
      [["ACTA", "MOUNTS"]],
      [["ACT", "AMOUNTS"], ["ACT", "CONTOUR"], ["BAT", "AMOUNTS"], ["BAT", "CONTOUR"], ["CAT", "AMOUNTS"], ["CAT", "CONTOUR"]],
      ["CATAMOUNTS"]
    ])
  end
end
class PhoneNumberConverter

  PATTERN = [
    [3,3,4],
    [3,4,3],
    [4,3,3],
    [5,5],
    [4,6],
    [6,4],
    [7,3],
    [3,7],
    [10]
  ]

  NUMBER_LETTERS = {
    "2" => ["A", "B", "C"],
    "3" => ["D", "E", "F"],
    "4" => ["G", "H", "I"],
    "5" => ["J", "K", "L"],
    "6" => ["M", "N", "O"],
    "7" => ["P", "Q", "R", "S"],
    "8" => ["T", "U", "V"],
    "9" => ["W", "X", "Y", "Z"]
  }

  def initialize phonenumber
    unless /\A[2-9]{10}\z/.match(phonenumber)
      p 'Invalid Input'
    end
    @phonenumber = phonenumber.chars
  end

  def possible_combinations
    expression = {}
    PATTERN.each do |pattern|
      index = 0
      pattern.each do |pattern_element|
        expression["#{index}_#{index + pattern_element - 1}"] = build_regex_pattern(index, pattern_element)
        index += pattern_element
      end
    end
    scan_regex_pattern_expression expression
  end

  def dictionary
    dictionary = File.open('../dictionary.txt', 'r').read
  end

  def build_regex_pattern index, pattern_element
    "^" + @phonenumber[index..(index + pattern_element - 1)].map { |c| "(#{NUMBER_LETTERS[c].join('|')})" }.join + "$"
  end

  def scan_regex_pattern_expression expression
    words = {}
    expression.each_pair do |key, exp|
      words[key] = dictionary.scan(Regexp.new(exp)).map(&:join)
    end
    p words
  end

  phone_number_converter = PhoneNumberConverter.new "2282668687"
  phone_number_converter. possible_combinations
  
end
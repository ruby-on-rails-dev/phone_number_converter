class Phone_NumberConverter

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

  def initialize phone_number
    unless /\A[2-9]{10}\z/.match(phone_number)
      p 'Invalid Input'
    end
    @phone_number = phone_number.chars
  end

  def possible_combinations
    expression = {}
    @result = []
    PATTERN.each do |pattern|
      index = 0
      pattern.each do |pattern_element|
        expression["#{index}_#{index + pattern_element - 1}"] = build_regex_pattern(index, pattern_element)
        index += pattern_element
      end
    end
    scan_regex_pattern_expression expression
    p @result
  end

  def dictionary
    dictionary = File.open('../dictionary.txt', 'r').read
  end

  def build_regex_pattern index, pattern_element
    "^" + @phone_number[index..(index + pattern_element - 1)].map { |c| "(#{NUMBER_LETTERS[c].join('|')})" }.join + "$"
  end

  def scan_regex_pattern_expression expression
    words = {}
    expression.each_pair do |key, exp|
      words[key] = dictionary.scan(Regexp.new(exp)).map(&:join)
    end
    computing_patterns words
  end

  def computing_patterns words
    
    PATTERN.each do |pattern|
      index = 0
      is_blank = true
      pattern.each do |element|
        break if (is_blank = words["#{index}_#{index+element-1}"].empty?)
        index += element
      end
      if !is_blank
        computing_combinations(pattern, words)
      end
    end
  end

  def computing_combinations pattern, words
    index = 0
    words_combination = []
    pattern.each do |pattern_element|
      words_combination << words["#{index}_#{index+pattern_element-1}"]
      index += pattern_element
    end
    if words_combination.count >1
      products = words_combination[0].product(*words_combination[1..-1])
    else
      products = words_combination[0]
    end
    @result << products
  end

  phone_number_converter = Phone_NumberConverter.new "2282668687"
  phone_number_converter. possible_combinations
  
end
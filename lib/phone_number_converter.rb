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

  phone_number_converter = PhoneNumberConverter.new "2282668687"
end
# Phone Number Converter

Given a 10 digit cellphone number the program computes the possible combination of word that can be used as a replacement for numbers.

The program was tested against ruby version 2.2.2 and should work on all ruby 2.x.x versions.

### Steps:
 Download this repo and cd to phone_number_converter directory
```
ruby run.rb
```

Enter the desired number that you want to convert or press Enter to choose "2282668687" as default

### To run the test case
```
ruby test/phone_number_converter_test.rb
```

### Logic behind the Regex Builder

The program basically uses regex to capture the matched words from the dictionary file.

For Example :

For digit 253 the regex build will be **"^(A|B|C)(D|E|F)(A|B|C)$"**
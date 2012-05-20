class SpellChecker

  class << self

    # Run the spellchecker program and display output
    def run(input_file='SAMPLE_INPUT.txt', test_case_start_line=3, number_of_suggestions=2)
      filename = File.join(root, 'input', input_file)
      test_cases = []

      # Build our test cases
      number_of_test_cases = File.open(filename) {|f| f.readline}.to_i
      number_of_test_cases.times do
        test_cases << SpellingTestCase.new(filename, test_case_start_line)
        test_case_start_line += number_of_suggestions + 2
      end

      # Display the suggestions for each of our test cases
      test_cases.each do |tc|
        puts tc.final_suggestion
      end
    end

    # Return the root path of the program
    def root
      File.expand_path '../../..', __FILE__
    end
  end

end
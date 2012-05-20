class SpellingTestCase

  attr_accessor :invalid_word, :possible_suggestions

  # Constructor for our test case that will accept the file to open,
  # along with the relevant line number at which to start reading
  def initialize(filename, starting_line_number, number_of_suggestions=2)
    self.possible_suggestions = []

    # Build up our collection of suggestions for this test case
    self.invalid_word = read_line_number(filename, starting_line_number)
    number_of_suggestions.times do |i|
      self.possible_suggestions << Suggestion.new(self.invalid_word, read_line_number(filename, starting_line_number + i + 1))
    end
  end

  # Determine our best suggestion for this test case
  def final_suggestion
    longest_substring = 0
    best_suggestion = nil

    self.possible_suggestions.each do |suggestion|
      if suggestion.common_substring_length > longest_substring
        best_suggestion = suggestion.possible_word
        longest_substring = suggestion.common_substring_length
      end
    end

    best_suggestion
  end

  private

  # Read a line of text from a given line number
  def read_line_number(filename, number)
    return nil if number < 1
    line = File.readlines(filename)[number-1]
    line ? line.chomp : nil
  end

end
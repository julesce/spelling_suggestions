class Suggestion

  attr_accessor :invalid_word, :possible_word, :common_chars

  # Constructor for our suggestion, that will build the common word as part of initialisation
  def initialize(invalid_word, possible_word)
    self.invalid_word = invalid_word
    self.possible_word = possible_word
    self.common_chars = build_common_word
  end

  def common_substring_length
    self.common_chars.length
  end

  private

  # Build up our common word made of substrings that match
  def build_common_word
    invalid_word_chars = invalid_word.scan(/./)
    possible_word_chars = possible_word.scan(/./)
    common_characters = []
    indexes_matched = []

    matching_possible_word_chars = get_matching_chars(possible_word_chars, invalid_word_chars)

    matching_possible_word_chars.each do |possible_char|
      invalid_word_chars.each_with_index do |invalid_char, invalid_index|
        if possible_char == invalid_char and !indexes_matched.include?(invalid_index)
          common_characters << possible_char
          indexes_matched << invalid_index
          break
        end
      end
    end

    common_characters
  end

  # Build an array of characters that represent characters that exist somewhere in the incorrect word
  def get_matching_chars(possible_word_chars, invalid_word_chars)
    matching_possible_word_chars = []
    possible_word_chars.each do |possible_char|
      if invalid_word_chars.include?(possible_char)
        matching_possible_word_chars << possible_char
      end
    end
    matching_possible_word_chars
  end

end
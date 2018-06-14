class Exercise

  def initialize(nr_diff_chars)
    @nr_diff_chars = nr_diff_chars
    @longest_sequence = ""
  end

  def find(text)
    current_valid_sequences = []
    text.split("").each_with_index do |char, idx|
      get_invalid_elements_after_new_insert(current_valid_sequences, char).reverse.each do |idx|
        current_valid_sequences.delete_at(idx);
      end
    end
    @longest_sequence
  end

  def check_longest_sequence(token)
    @longest_sequence = token if token.size > @longest_sequence.size
  end

  def is_still_valid(token)
    token.split("").uniq.size <= @nr_diff_chars
  end

  def get_invalid_elements_after_new_insert(current_valid_sequences, char)
    remove_invalid = []
    current_valid_sequences.each_with_index do |token, index|
      newtoken="#{token}#{char}"
      current_valid_sequences[index]=newtoken
      if is_still_valid(newtoken)
        check_longest_sequence(newtoken)
      else
        remove_invalid << index
      end
    end
    check_longest_sequence(char)
    current_valid_sequences << char

    remove_invalid
  end
end

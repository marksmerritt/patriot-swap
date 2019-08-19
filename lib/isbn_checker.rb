module IsbnChecker
  def self.is_possible_isbn(val)
    valid_isbn_lengths = [10, 13]
    val_length = val.delete("^0-9").length
    valid_isbn_lengths.include?(val_length)
  end
end
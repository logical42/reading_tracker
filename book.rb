class Book
  attr_accessor :text, :passages, :min_word_count
  def initialize(options)
    self.min_word_count = options[:min_word_count]
    self.text = parse_text(options[:text])
    parse_passages
  end
  def parse_text(text)
    booktext = text.split(/^[B][Yy]\s[^\n]*\n/).last
    booktext = booktext.split("THE END").first
    return booktext
  end
  def parse_passages
    self.passages = self.text.split("\n\n")
    self.passages.delete_if { |passage| passage.length == 0 }
  end
  def pick_random_passage
    self.passages.map do |passage|      
      passage if passage.split(" ").count > self.min_word_count
    end.compact.sample
  end
end
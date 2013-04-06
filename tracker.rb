require 'open-uri'

class Tracker
  attr_accessor :url,               :average_prose,     :average_screen, 
                :user_wpm,          :book,              :passages, 
                :min_word_count

  ### CLASS METHODS 
  def initialize(options={})
    self.url = options[:url] || "http://classics.mit.edu/Confucius/doctmean.1b.txt"
    self.min_word_count = options[:min_word_count] || 100
    self.average_prose = 300
    self.average_screen = 180
    self.book = open(self.url).read
    parse_book

  end

  def self.rspec_works
    true
  end 

  ### END CLASS METHODS



  ### INSTANCE METHODS

  def parse_book
    text = book.split(/^[B][Yy]\s[^\n]*\n/).last
    text = text.split("THE END").first
    self.passages = text.split("\n\n")
    self.passages.delete_if { |passage| passage.length == 0 }
  end
  def pick_random_passage
    passages.map do |passage|      
      passage if passage.split(" ").count > self.min_word_count
    end.compact.sample
  end

  ### END INSTANCE METHODS
end
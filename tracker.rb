require 'open-uri'
load "./book.rb"
class Tracker
  attr_accessor :url,               :average_prose,     :average_screen, 
                :user_wpm,          :min_word_count,    :book
  def initialize(options={})
    self.url = options[:url] || "http://classics.mit.edu/Confucius/doctmean.1b.txt"
    self.min_word_count = options[:min_word_count] || 100
    self.average_prose = 300
    self.average_screen = 180
    self.book = Book.new(text: open(self.url).read, min_word_count: self.min_word_count)
  end
  def self.rspec_works
    true
  end 
end
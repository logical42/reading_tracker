require 'open-uri'

class Tracker
  attr_accessor :url, :average_prose, :average_screen, :user_wpm, :book

  ### CLASS METHODS 
  def initialize(options={})
    self.url = options[:url] || "http://classics.mit.edu/Tzu/artwar.1b.txt"
    self.average_prose = 300
    self.average_screen = 180
    self.book = open(self.url).read
    nil
  end

  def self.rspec_works
    true
  end 

  ### END CLASS METHODS



  ### INSTANCE METHODS



  ### END INSTANCE METHODS
end